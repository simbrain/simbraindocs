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
	model.accumulateInputs()
for model in networkModels:
	model.update()
```

That is, first accumulate all the inputs to every network model. Then, in a separate step, update all the network models. This ensures deterministic updating regardless of the order in which the list of network models is traversed.

### Network Model Update Order

Even with buffering it does matter what order network models are updated in (for example, a [Hebbian](synapses/hebbian.html) synapse updated before or after neuron update will often produce different results. Network models are updated in the following order:

- Neuron
- NeuronGroup
- NeuronCollection
- NeuronArray
- Connector
- SynapseGroup
- Subnetwork
- Synapse
- All Others 

To customize this [custom simulations](simulations) are the easiest way.

### Why Buffering Matters

To see why buffering matters, consider the network below. Without buffering, we would get different results depending on update order. 

- If update order is $$n_1 \rightarrow n_2 \rightarrow n_3$$ then in one iteration, $$n_2$$ and $$n_3$$ will be activated. 
- However, if update order is $$n_2 \rightarrow n_3 \rightarrow n_3$$ then in one iteration only $$n_2$$ will be activated. (This can actually be tested using priority update, discussed next). However, if buffered update is used, first $$n_2$$ will be updated on the first time step, and then $$n_3$$, so that (somewhat realistically) we can observe activation propagate.

<img src="/assets/images/updateOrder.png" alt="Edit update sequence" style="width:300px;"/>

## Priority Based Update of Free Neurons

Buffered update is convenient but not always desired. Sometimes we __want__ a network to completely update in one time step. For example, buffered update makes activation propogate one layer at a time in a layered network, but often what we desire is for one iteration to propogate through all the layers of a network at once. To achieve this we used priority-based update (in fact, this is how [feed-forward](subnetworks/feedForward.html) work under the hood).

Here is the basic algorithm in pseudo code:
```kotlin
for model in prioritySortedNetworkModels:
	model.accumulateInputs()
	model.update()
```

In this case network models are associated with a priority which the user can set. Then we basically update network models in that order.

However, in practice, it's often not needed, because relevant subnetworks already update in this way.

Currently priority is only used for neuron update. If there is a demand for other items (in particular neuron arrays) to be updated using priority based update it will be added. When priority-based update is used, `Buffered Update` should be removed fro the update list, and all other groups, arrays, etc must be manually updated. 

# Neuron Groups and Subnetworks

Neuron groups and [subnetworks](subnetworks) have their own customized update functions. For example, [feedforward](subnetworks/feedForward.html) networks update the input nodes first, then hidden layers in sequence, then  output nodes.  [Neuron collections](neurongroups/index.html#neuron-collections) don't have custom update. [Hopfield](subnetworks/hopfield.html) networks have three kinds of update, including stochastic update where a random node is selected for update each iteration.

# Update Rules Operate on Scalar Data

[Neurons](neurons/), [synapses](synapses), neuron arrays, weight matrices, and spike responders all use a design that separates update rules from the data they operate on. These can be called **rule objects**.  We will describe how this all works for neurons first; the same basic structure applies to other objects as well.

The picture below shows how this works for neurons. The update rule is a separate object that _operates_ on the state variables of a neuron, in the sense of reading in the neuron's state, and then writing back to the neuron's state. The rule itself is associated with parameters that can be edited using the Simbrain [property editor](../utilities/propertyEditor.html). When the neuron is updated, the update rule can read all the state variables of a neuron. (This includes both the neuron's state, but also anything the neuron is connected to, it's all available to the rule). It's similar for neuron arrays, weights, etc. The rules can read from and write to any data associated with these network models.

The state variables of a neuron can be divided into two classes: intrinsic and rule-dependent.  The _intrinsic state variables_ of a neuron are primarily its activation, visible as its color, but other variables include whether it spiked (for spiking neurons) and an auxiliary variable that can be used in simulations. The _rule-dependent state variables_ change as the update rule changes. In the code these are held in a `data holder` object. As you change the update rule, these variables change. 

In the case shown below a [linear rule](neurons/linear.html) is shown operating on a neuron.  

<img src="/assets/images/ruleAndDataHolder.png" alt="neuron rule and data holder" style="width:600px;"/>

In that case the only rule-dependent variable is a bias, but in other cases, like the [Izhikevich neuron](neurons/izhikevich.html), there is, in addition to activation (interpreted as membrane potential), a recovery variable that the rule needs in order to keep track of the neuron's state.

# Update Rules Operate on Array Data

The same rules that operate on scalar data can operate on array data. All the parameters are the same, and the editor dialog is the same, but in the code, array data is operated on.  In Simbrain this is general represented using [Smile matrix](https://haifengl.github.io/linear-algebra.html) objects.

<img src="/assets/images/ruleAndDataHolderArray.png" alt="neuron rule and data holder" style="width:8	00px;"/>

# Synapses, Learning Rules, and Spike Responders

Each synapse has a PSR. The PSR can just be source activation times weight (simple case) or a more complex spiking case.  Weight may be updated. But regardless. Summed psr is accumulated. Then the neuron update rule (“activation function”) is applied Activation is the result. (See book activatoin function chapter)

<!-- Synaptic inputs are a bit more complicated than weighted inputs as they attempt to capture some of the dynamics of real synapses in the brain. This type of input is meant specifically for translating action potentials (spikes) created when spiking neurons fire into a continuous value which can be interpreted by other neurons. (So this input type is not meaningful if the pre-synaptic neuron does not produce action potentials). Synaptic inputs perform a weighted sum over the post-synaptic responses of the incoming synapses, which are themselves governed by **spike responders**. More details can be found in the **spike responder** and **spiking neuron** documentation pages. The basic idea is that spikes are modeled as being instantaneous in time and spike responders generate a continuous value from this instantaneous one, for example producing a decaying stream of input to the post-synaptic neuron after a spike (as in the animated image above). -->


Here is the basic case for how synapses work

To accomodate all this, the following structure is used:
<img src="/assets/images/synapseRulesBasic.png" alt="synapse basics" style="width:600px;"/>

But it gets more complex. The same basic structure from aboe is used for synapses, but there is a bit more going on. This is based on the fact that synapse learn with learning rules, but also sometimes must react in a dynamical way to spiking events. However, in the default case all they are is weights that are multipled by pre-synaptic neuron activations.

To accomodate all this, the following structure is used:
<img src="/assets/images/synapseRulesFull.png" alt="synapse spike responder and learning rule" style="width:600px;"/>

The synapse has two main intrinsic state variables: `psr` or post-synaptic-response, and `strength`. The strength is the classic weight value of a synapse. The `psr` is a variable that corresponds to the "output" of the synapse. In the basic case, the `psr` is just the source neuron activation for the synapse times the weight strength. In the case shown, if the weight strength is .5, then the psr is .2 * .5, and so on update the target synapse is set to .1. Often in a neural network this is all we have.

But two things can be added to the synapse, two rules: (1) a leaning rule, to model how weights change (in unsuperised learning; supervised learning happens via an external [trainer](trainingNetworks.html)), and (2) a spike response rule or spike responder, which models what happens when the pre-synaptic source neuron is a spiking neuron. Both of these are rule objects that operate on the synapse. That is, they read and write to it. Both are associated with rule-dependent data. So if a learning rule is used which needs to track additional data, a learning rule data holder is added to the synapse. If a spike responder needs to track additional data, a spike response data holder is added. Both rule objects have access to all data in the synapse, including the source neuron (e.g. whether it spiked) and the target neuron.

However, in the default case, there is no learning rule, and so the weight just stays the same unless it is manually updated or updated by a training algorithm. And in the default case neurons are not spiking and so no spike responder is needed.

Here is how synapses `psr` is updated, in pseudocode:

```kotlin
fun Synapse.updatePSR():
	if spikeResponder:
		// The spike responder updates the psr
		spikeResonder.apply(this)
	else
		// Connectionist case
		psr = source.activation * weightStrength
```

For a given neuron,  `update()` just works by iterating through fan-in synapses and calling `updatePSR()`, and then aggregating these to update activation. This allows connectionist and spiking neurons to connect to the same neuron

```kotlin
fun Neuron.update()
	for synapse in fanIn:
		synapse.updatePSR()
		activation += synapse.psr
```

Again PSR is our generic construct. The node’s net input is just the accumulated psr. That is then modified by act function. TODO: Show activation function working.

<img src="/assets/images/multipleSynapses.png" alt="summation" style="width:300px;"/>

# Synapses, Learning Rules, and Spike Responders (array case)

The  same structure applies to [neuron arrays and weight matrices](arraysMatrices.html). In fact in the code the rule objects are shared. Here again `psr` is the "output", but this time of a whole weight matrix. This it is a `psrmatrix`. If there is no spike responder set, the `psrmatix` is the matrix product the source activaiton vector and the actual weight matrix. If there is a [spike responder](spikeresponders/), it is applied to the weight matrix object, and directly updates the `psrmatrix`, using the `weightMatrix`, `source.activationArray` as needed, and anything other matrix-shaped state variables (like a matrix of recovery variables) associated the spike responder itself.

<img src="/assets/images/synapseRulesMatrix.png" alt="Weight matrix rule objects" style="width:500px;"/>

Thus, for a neuron array,  `update()` iterates through a fan-in of weight matrices, calling `updatePSR()` on each one, and then adding the resulting `psrMatrices` using vector addition to update the neuron's activations. This allows connectionist and spiking input arrays to feed to the same neuron array.

Again we sum PSR's but now we are “summing PSR matrices” and then mutating them.


# Continuous and Discrete Time Update

The network is updated from the [workspace](../workspace) or separately using its own run menu.

When the network is updated, a `time` variable is updated by adding a `time-step` to it. This updating time can be displayed in two ways, captured by a `time-type` parameter

- Continuous: at each iteration time increases by a `time step` that can be set. Time is displayed in milliseconds. This is used when differential equations are numerically integrated. Generally speaking, the smaller the time-step, the more accurate the numerical integration. 

- Discrete: at each iteration time increases by 1. Time is displayed as “iterations” (in the underlying code the system is still updated by a time-step; but in this mode time is displayed by dividing the continuous time by the time-step.)

Neuron update rules are associated with a time type. Any time a single continuous update rule is used in a network, time is automatically changed to continuous. This can however be overridden by manually adjusting time type in the network properties.

<!-- TODO: Merge below in -->
<!-- - Basic Iterative (unmarked in the menu above): standard discrete time update, based on iteration of an algorithm.

- Continuous time (marked with a "δt" in the menu above): update is based on numerical integration of a differential equation. Such neurons (or synapses) do not just respond to external inputs but have internal dynamics and an internal state variable that is updated at each time step. Neurons that are continuous have a **time-step** field, described below.

Consider two neuron models: The first performs a weighted sum on the incoming synaptic connections, puts that value through some function which takes in only that net input as an argument, and produces an output. The second performs a weighted sum as well, but this time, the function takes in not only this net input value, but also the "state" (be it the previous net input, activation, or some other value) of the neuron as well. Thus its activation is based not only on its input but its own previous history. In this way we can say that the 2nd neuron has its own internal dynamics. In the first case, the unit of time in the simulation has little or no importance. The activation does not unfold through time and is only dependent on external input to the neuron, thus the question of granularity is irrelevant. This neuron takes in an input and produces an output in a step by step manner. These two cases can be referred to as temporally "discrete" or "continuous" respectively.

Practically speaking even the continuous case is technically discrete as we chose some level of temporal granularity. This is a necessity of simulating temporally continuous situations on a computer which can only consider discrete states. The practice of simulating continuous time on a discrete machine is a major topic in numerical analysis and far beyond the scope of this documentation. The important point is that in complex neuron models with internal states the notion of when things happen and how long they take to happen becomes important, and we simulate that fundamental temporal continuity by choosing typically very small (but meaningful and quantified) discretized time-steps.

- Time Step: The time step is a global variable that is used whenever differential equations are numerically integrated. When a continuous neuron is used, an iteration of the network represents an interval of time whose length equals the time-step. Generally speaking, the smaller the time-step, the more accurate the numerical integration. If there is a single continuous neuron or synapse in a simulation, the network panel will display time in "seconds." Otherwise time is displayed in "iterations." -->

