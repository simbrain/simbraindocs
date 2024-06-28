---
title: Update Logic
layout: default
parent: Networks
has_children: false
nav_order: 15
---

# Network Update Logic

When a network is open and the workspace is iterated, an **update algorithm** is repeatedly called, which is visible in the form of spreading activity in network's nodes and other changes. These changes have a complex logic that is described here. 

The complexity of the system stems from Simbrain's effort to support many configurations. This includes free neurons and synapses, local learning rules, array based computations, spiking networks, and even more custom forms of update. Most of this is supported in the GUI using a point and click interface.

# Update actions

At the top level each network iteration a sequence of actions is executed. Usually the default update action, `Buffered update`, is all that is executed, and all that is needed. However, custom actions can be added and update can be customized, either in the GUI, or for even more custom applications, in [scripts](../simulations).

Actions are set using a GUI that is largely the same as in [workspace update](../workspace/update.html). 

From `Network > Edit Update Sequence...` the following dialog shows

<img src="/assets/images/networkUpdateSequence.png" alt="Edit update sequence" style="width:300px;"/>

At each network iteration each of these actions is executed in sequence. Some built-in actions can be added from the GUI using the `Add action` button. Update order can be adjusted using the other buttons or by dragging items on the screen. In this case, the default `Buffered update` is called followed by a custom action that was created in a script (this is the `Simulations > Cognitive Maps > Agent Trails` script).


## Buffered Update

The default action, and usually all that is needed, is buffered update. The value of buffered update is that it allows for determinstic updating, that is independent of the order in which network models (without this system, you would get different results depending on what order you added items to Simbrain). 

Here is the basic algorithm in pseudo code:
```kotlin
for model in networkModels:
	m.updateInputs()
	m.update()
```

That is, for each network model in the network, first call `updateInput`, and then `update`.

TODO: Add picture and example that shows how update order matters.

## Priority Based Update of Free Neurons

Buffered update is convenient but not always desired. For example, it makes update propogate one layer at a time in a layered network, but often what we desire is for one iteration to propogate through a whole layer at once.

In this case network models are associated with a priority which the user can set. Then `updateInput` and `update` are called in order of priority.

Currently only neurons are updated using priority update. If there is a demand for other items (in particular neuron arrays) to be updated using priority based update it will be added.

If this is used, `Buffered Update` should be removed, and all other groups, arrays, etc must be manually updated. 


# Neuron Groups and Subnetworks

Neuron groups and [subnetworks](subnetworks/subnetworks.html) have their own customized update functions. For example, feedforward networks [link] update the input nodes first, then hidden layers in sequence, then  output nodes. Neuron collections don't have custom update.

# Update Rules operate on Data

[Neurons](neurons/), [synapses](synapses), neuron arrays, weight matrices, and spike responders all use a design that separates update rules from the data they operate on and easily edited and changed in using a [property editor](../utilities/propertyEditor.html). These can be called **rule objects**. 

The picture below shows how this works for neurons. The update rule is a separate object that _operates_ on the state variables of a neuron . All neurons have an activation value that is generally what is used to represent their color. However, depending on the rule, they will have other state variables. As you change the update rule, a data holder object that encapasulates this other data is changed. In this case a [linear rule](neurons/linear.html) is shown operating on a neuron. The main editable parameters of the rule are associated with the rule. The activation and bias are values that can change over time when the update rule (or other rules, like [training rules](trainingNetworks.html)) are applied.

<img src="/assets/images/updateScheme.png" alt="Update Scheme" style="width:600px;"/>

The same update rule also operates on neuron arrays, but in that case the data are an activtion array and bias array.

In the code we have something like this, where `n` can either be a neuron or a neuron array.
```kotlin
updateRule.apply(n)
```

# Post synaptic response (scalar case)

Let's start with a picture:

<img src="/assets/images/neuronSchematic.png" alt="Neuron schematic" style="width:600px;"/>

Note that the learning rule and spike responder rules are optional, in the sense that there is a `no rule` learnign rule and a `non responder' spike responder. When they are absent, spike responders are not used and the weights simply stay the same on each update. This is the default.

This scheme can handle both spiking and "connectionist" neurons. The basic way it does this by defining a post-synaptic response or `psr` variable for each [synapse](synapses) and using `psr` as the way to encode the "output" of the synapse.  If there is no spike responder `psr` is set to the source activation times weight strength, as in standard connecitonism. If there is a [spike responder](spikeresponders/), it is applied to the synapse, and directly updates the `psr`, using the `weightStrength`, `source.activation` as needed, and any other state variables associated with the spike responder itself.

In pseudocode:
```kotlin
fun Synapse.updatePSR():
	if spikeResponder:
		// The spike responder updates the psr
		spikeResonder.apply(this)
	else
		// Connectionist case
		psr = source.activation * weightStrength
```

Thus, for a given neuron,  `update()` just works by iterating through fan-in synapses and calling `updatePSR()`, and then aggregating these to update activation. This allows connectionist and spiking neurons to connect to the same neuron.

```kotlin
fun Neuron.update()
	for s in fanIn:
		s.updatePSR()
		activation += s.psr
```

# Post synaptic response (array case)

The  same structure applies to [neuron arrays and weight matrices](arraysMatrices.html). In fact in the code the rule objects are shared. This shows the structure:

<img src="/assets/images/neuronArraySchematic.png" alt="Neuron schematic" style="width:500px;"/>

Here again `psr` is the "output", but this time of a whole weight matrix. This it is a `psrmatrix`. If there is no spike responder set, the `psrmatix` is the matrix product the source activaiton vector and the actual weight matrix. If there is a [spike responder](spikeresponders/), it is applied to the weight matrix object, and directly updates the `psrmatrix`, using the `weightMatrix`, `source.activationArray` as needed, and anything other matrix-shaped state variables (like a matrix of recovery variables) associated the spike responder itself.

Thus, for a neuron array,  `update()` iterates through a fan-in of weight matrices, calling `updatePSR()` on each one, and then adding the resulting `psrMatrices` using vector addition to update the neuron's activations. This allows connectionist and spiking input arrays to feed to the same neuron array.



# Continuous and Discrete Time

<!-- Todo: Links -->

The network is updated from the [workspace](../workspace) or separately using its own run menu.

When the network is updated, a `time` variable is updated by adding a `time-step` to it. This updating time can be displayed in two ways, captured by a `time-type` parameter

- Continuous: at each iteration time increases by a `time step` that can be set. Time is displayed in milliseconds. This is used when differential equations are numerically integrated. Generally speaking, the smaller the time-step, the more accurate the numerical integration. 
- Discrete: at each iteration time increases by 1. Time is displayed as “iterations” (in the underlying code the system is still updated by a time-step; but in this mode time is displayed by dividing the continuous time by the time-step.)

Neuron update rules are associated with a time type. Any time a single continuous update rule is used in a network, time is automatically changed to continuous. This can however be overridden by manually adjusting time type in the network properties.

