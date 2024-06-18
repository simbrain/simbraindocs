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

<img src="/assets/images/networkUpdateSequence.png" alt="Edit update sequence" style="width:400px;"/>

At each network iteration each of these actions is executed in sequence. Some built-in actions can be added from the GUI using the `Add action` button. Update order can be adjusted using the other buttons or by dragging items on the screen. In this case, the default `Buffered update` is called followed by a custom action that was created in a script (this is the `Simulations > Cognitive Maps > Agent Trails` script).


## Buffered Update

The default action, and usually all that is needed, is buffered update. The value of buffered update is that it allows for determinstic updating, that is independent of the order in which network models (without this system, you would get different results depending on what order you added items to Simbrain). 

Here is the basic algorithm:

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

TODO: Links once we have them

Neuron groups and [subnetworks](subnetworks/subnetworks.html) have their own customized update functions. For example, feedforward networks [link] update the input nodes first, then hidden layers in sequence, then  output nodes. Neuron collections don't have custom update.

# Update Rules and Data Holders

TODO: Links

Neurons, synapses, neuron arrays, weight matrices, and spike responders  all use a design that separates update rules from the data they operate on and easily edited and changed in using a [property editor](../utilities/propertEditor.html). 

We can start with the case of Neurons. Activations are the main state variable of neurons. They are updated as follows.

First, `updateInputs`, is called:

```kotlin
for s in fanIn:
	s.updatePSR()
	activation += s.psr
```
Then the update rule is applied to the neuron `n`. 
```kotlin
updateRule.apply(n)
```
The `updateRule` is just logic. It mutates the neuron as needed, changing its activation and other state variables, like biases, as needed.

The `updatePSR` function covers both the spiking and non-spiking case

```kotlin
if spikeResponder is NonResponder:
	psr = source.activation 
else
	spikeResonder.update()
	psr = spikeResonder.value
```
Delays are also handled.

All this logic also works for neuron arrays and weight matrices.

![Neuron logic](/assets/images/simbrainNeuron.png)

# Continuous and Discrate Time

<!-- Todo: Links -->

The network is updated from the [workspace](../workspace) or separately using its own run menu.

When the network is updated, a `time` variable is updated by adding a `time-step` to it. This updating time can be displayed in two ways, captured by a `time-type` parameter

- Continuous: at each iteration time increases by a `time step` that can be set. Time is displayed in milliseconds. This is used when differential equations are numerically integrated. Generally speaking, the smaller the time-step, the more accurate the numerical integration. 
- Discrete: at each iteration time increases by 1. Time is displayed as “iterations” (in the underlying code the system is still updated by a time-step; but in this mode time is displayed by dividing the continuous time by the time-step.)

Neuron update rules are associated with a time type. Any time a single continuous update rule is used in a network, time is automatically changed to continuous. This can however be overridden by manually adjusting time type in the network properties.

