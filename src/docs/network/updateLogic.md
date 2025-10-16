---
title: Network Update
layout: default
parent: Networks
has_children: false
nav_order: 20
---

# How Network Updates Work

When a network is open and the workspace is iterated, an **update algorithm** is repeatedly called, which is visible in the form of spreading activity in networks nodes and other changes. These changes have a complex logic that is described here.  This complexity stems from Simbrain's effort to support many configurations. This includes networks which mix free neurons and synapses, local learning rules, array-based computations, spiking networks, and more custom forms of update. 

The next section gives a broad overview of update focusing on the case of free neurons and synapses. The rest of this document covers more specific topics and forms of update.

# Basics

The way information flows from one node to another via a weight provides a useful starting point for understanding how network updates work in Simbrain. In the simplest and easiest-to-understand case, activation in one node is multiplied by a weight strength, and the result is sent to the next node where it becomes the new activation. In the example below assume the weight strength is .5, so that the output is half the input.

<img src="/assets/images/synapseRulesBasic.png" alt="synapse basics" style="width:600px;"/>

There are several variables that play an important role in this process.

- **Activation**: A number that represents how active a neuron is. The precise interpretation depends on what kind of neuron it is. This is visible as the color of a neuron. More information on the graphical display of activations is in the [neuron](neurons) documentation.

- **Strength**: How strong or efficacious a synapse is in transmitting information, and whether it is excitatory or inhibitory. More information on the graphical display of strength is in the [synapse](synapses) documentation.

Two additional values are crucial to the process, but are not visible in the GUI:

- **Input**: Input to a neuron, shown as open rectangles above. A buffer that accumulates inputs from other nodes (via PSRs) and via external [couplings](../workspace/couplings). This supports asynchronous or [buffered update](#buffered-update).

<a name="PSR"></a>
- **PSR**: Post-synaptic response or "output" of a synapse, shown as diamonds above. Usually the PSR of a node is just source activation times weight. Sometimes the PSR varies over time in response to spikes (see [spike responders](spikeresponders)). The logic of PSR updates is discussed in [PSR update](#psr-update).

When multiple source nodes connect to a target node, the input to the target node is a summation of PSRs across the source nodes. In the example above, the target node accumulates PSRs from three other nodes. Since in this case there are no spike responders, the target input is a simple weighted sum. In this image we have also shown dotted lines feeding into each input, which emphasizes that information from external couplings can be part of the input to any neuron.

<img src="/assets/images/multipleSynapses.png" alt="summation" style="width:600px;"/>

As we will see, all of these values can exist as arrays: activations, inputs, weight strengths, PSRs, etc. 

# Buffered Update

The default way networks are updated is using buffered update (other options are discussed in [update actions](#update-actions)). The value of buffered update is that it allows for deterministic updating, that is independent of the order in which network models were added (without this system, you would get different results depending on what order you added items to Simbrain). 

Here is the basic algorithm in pseudo code:
```kotlin
for model in networkModels:
    model.accumulateInputs()
for model in networkModels:
    model.update()
```

First accumulate all the inputs to every network model (mainly neurons, neuron collections, and neuron arrays). These inputs include external inputs from couplings and PSRs from incoming synapses or weight matrices. All of these inputs are added together. 

```kotlind
for w in fanIn:
    w.updatePSR()
    activation += synapse.psr
```

Updating the PSR (or PSR Matrix) usualy amounts to multiplying inputs times activations (for neurons) or matrix multiplying input activations by a weight matrix (for neuron arrays, etc.). Some update rules require additional processing here. When the source model is spiking [spike responders](spikeresponders) are used to update the PSRs as well. 

Then, in a separate step, update all the network models. Neuron activations are updated using [neuron update rules](neurons); synapses can be updated using local [learning rules](synapses); etc. Once the update function is done with processing, it will **clear inputs** in preparation for the next application of accumulate inputs.

# How Rules Operate on Data

[Neurons](neurons/), [synapses](synapses), [neuron arrays and weight matrices](arraysMatrices), and [spike responders](spikingneurons) all use a design that separates update rules from the data they operate on. We will start with the case of neurons; the same basic structure applies to other objects as well.

These are the three main types of value associated with a neuron, all of which can be edited using a Simbrain [property editor](../utilities/propertyEditor).

<!-- <img src="/assets/images/ruleAndDataHolder.png" alt="neuron rule and data holder" style="width:400px;"/> -->

First, there are two kinds of data that can dynamically change as a network is updated:

- **Neuron variables**. These are variables like activation and bias that every neuron has. It also includes the input buffer which accumulates inputs from other network models and from couplings.
- **Update rule variables**. These are variables associated with the update rule. They are called "state variables" in the property dialog. These variables change as the update rule is changed. In the case shown above, an [Izhikevich neuron](neurons/izhikevich) is associated with a recovery variable. 

Then, there are rules which _operate_ on this data:

- **Update rules and parameters**. These are rule objects associated with a range of parameters that can be edited in property editors. These rules determine how the data are updated. The parameters do not change as the network is updated.

The dialog for the Izhikevich neuron shows where each category is in the dialog. 

<img src="/assets/images/izhikDialog.png" alt="neuron rule and data holder" style="width:400px;"/>

## Data Holders and State Variables

Each update rule creates its own **data holder** object to store the state variables it needs. For example, the Naka-Rushton neuron rule uses an adaptation variable `a`, while the Izhikevich rule uses a recovery variable `v`. When you change the update rule, Simbrain automatically creates the appropriate data holder for that rule.

Data holders serve different purposes for scalar and matrix-based components:

- **Scalar data holders** store state variables for individual neurons and synapses
- **Matrix data holders** store arrays of state variables for neuron arrays and weight matrices

Some update rules use simple data holders with minimal state, while others like spiking models require complex state tracking. The data holder appears in the property editor as "State variables" and its contents depend entirely on the selected update rule.

# Update Rules can Operate on Array Data

The same update rules that operate on scalar data can operate on array data. For example, in a [neuron array](arraysMatrices), the same categories of data are present: top-level variables like an activation array, and rules specific to an update rule (like a recovery array) variables.

<img src="/assets/images/ruleAndDataHolderArray.png" alt="update rule operating on array data" style="width:300px;"/>

The same rule that operates on scalar state variables with an Izhikevich neuron now operate on arrays with an Izhekevich neuron <array class=""></array>

# Synapses, Learning Rules, and Spike Responders

These same ideas apply to [synapses](synapses), but there are now potentially _two_ rule objects. There is a learning rule, which updates the synapse's strength, and a [spike responder](spikeresponders), which updates the PSR in response to spikes. Each of these rules can be associated with rule-dependent variables, for example variables which track the course of a spike response (though currently few learning rules or spike responders are associated with special variables). The schematic below shows a synapse with a [Hebbian](synapses/hebbian) learning rule for the weight strength and a [Jump and decay](spikeresponders/jumpdecay) spike responder. 

<!-- <img src="/assets/images/synapseRulesFull.png" alt="synapse spike responder and learning rule" style="width:600px;"/> -->

By default synapses are pretty simple. The learning rule is set to "static synapse rule" and the spike responder is set to "no rule", in which case the synapse is just a static weight value.  But as the image above shows, they can become quite complex, with rules modifying weight strengths and spike response as a simulation runs.

Note that these learning rules are local learning rules, change the weight strength only using information available to the synapse about the source and target neurons it is connected to. A more common way of updating weight strengths is externally, using a [trainer](learning/trainingNetworks).

# Weight Matrices

The structure of a synapse is mirrored in [weight matrices](arraysMatrices), but all state variables are now matrices. This is similar to the relationship between neurons and neuron arrays discussed above. Below is a schematic

<img src="/assets/images/synapseRulesMatrix.png" alt="Weight matrix rule objects" style="width:250px;"/>

The weight matrix can be updated using a synapse update rule and the PSR matrix can be updated using a spike responder.

<!-- Weights can also be modified using [supervised learning](trainingNetworks). -->

<!--  In fact in the code the rule objects are shared. Here again `psr` is the "output", but this time of a whole weight matrix. This it is a `psrmatrix`. If there is no spike responder set, the `psrmatix` is the matrix product the source activaiton vector and the actual weight matrix. If there is a [spike responder](spikeresponders/), it is applied to the weight matrix object, and directly updates the `psrmatrix`, using the `weightMatrix`, `source.activationArray` as needed, and anything other matrix-shaped state variables (like a matrix of recovery variables) associated the spike responder itself.

Thus, for a neuron array,  `update()` iterates through a fan-in of weight matrices, calling `updatePSR()` on each one, and then adding the resulting `psrMatrices` using vector addition to update the neuron's activations. This allows connectionist and spiking input arrays to feed to the same neuron array.

Before we summed PSRs but now we are “summing PSR matrices” and then mutating them. -->

# Update actions

At each network iteration a sequence of actions is executed. Usually only one action is updated, the default update action, [buffered update](#buffered-update). However, custom actions can be added and update can be customized, either in the GUI, or for even more custom applications, in [scripts](../simulations).

Actions are set using a GUI that is largely the same as in [workspace update](../workspace/workspaceUpdate). 

From `Network > Edit Update Sequence...` the following dialog shows

<img src="/assets/images/networkUpdateSequence.png" alt="Edit update sequence" style="width:300px;"/>

At each network iteration each of these actions is executed in sequence. Some built-in actions can be added from the GUI using the `Add action` button. Update order can be adjusted using the other buttons or by dragging items on the screen. In this case, the default `Buffered update` is called followed by a custom action that was created in a script (this is the `Simulations > Cognitive Maps > Agent Trails` script).




### Network Model Update Order

Buffering solves some but not all problems with update order. For example, it makes a difference whether a [Hebbian](synapses/hebbian) synapse is updated before or after neuron update. Thus, by default, network models are updated in the following determinate order:

- Neuron
- NeuronGroup
- NeuronCollection
- NeuronArray
- Connector
- SynapseGroup
- Subnetwork
- Synapse
- All Others 

Note that items _within_ [Neuron groups](neurongroups/) and [subnetworks](subnetworks/) are updated in a custom manner specific to the group or network. To customize even further [custom simulations](simulations) can be used.

<!-- [Neuron groups](../neurongroups) and [subnetworks](subnetworks) have their own customized update functions. For example, [feedforward](subnetworks/feedForward.html) networks update the input nodes first, then hidden layers in sequence, then  output nodes.  [Neuron collections](neurongroups/index.html#neuron-collections) don't have custom update. [Hopfield](subnetworks/hopfield.html) networks have three kinds of update, including stochastic update where a random node is selected for update each iteration. -->




### Why Buffering Matters

To see why buffering matters, consider the network below. Neuron $$n_1$$ is clamped and weight strengths are $$1$$. Assume buffering is turned off (in Simbrain this means using priority-based updating, where we specify which nodes are updated in which order)

<img src="/assets/images/updateOrderBase.png" alt="Update order base case" style="width:250px;"/>

Without buffering, we would get different results depending on update order. If $$n_2$$ is updated before $$n_3$$ then in the next iteration all nodes will be active

<img src="/assets/images/updateOrderN2N3.png" alt="Update n2 before n3" style="width:250px;"/>


However, if $$n_3$$ is updated before $$n_2$$ then in the next iteration only $$n_2$$ will be active, because when $$n_3$$ was updated it's input was 0.


<img src="/assets/images/updateOrderN3N2.png" alt="Update n3 becore n2" style="width:250px;"/>

Since buffered update accumulates the inputs to every node first, and then updates, it does not matter in which order update occur. 

## Priority Based Update of Free Neurons

Buffered update is convenient but not always desired. Sometimes we __want__ a network to completely update in one time step. Buffered update makes activation propagate one layer at a time in a layered network, but often what we desire is for one iteration to propagate through all the layers of a network at once. To achieve this we use priority-based update (in fact, this is how [feed-forward](subnetworks/feedForward) works under the hood).

Priority update processes models one at a time in a specific order, allowing each model to immediately affect models updated later in the sequence. Each model accumulates its inputs and updates before the next model processes.

Here is the basic algorithm in pseudo code:
```kotlin
for model in prioritySortedNetworkModels:
	model.accumulateInputs()
	model.update()
```
Notice that, unlike with buffered update, we have one single loop rather than two loops. This means each model makes its new state available to models that update later, enabling sequential processing where one layer completes before the next begins.

### Setting Priorities

Each neuron has a priority property that determines its update order. Lower numbers have higher priority and are updated first. The default priority is 0 for all neurons. Priority can be set in the neuron properties dialog (select neurons and press `Cmd/Ctrl+E`).

To view and manage priorities, go to `Network > Show Priority Table`. This displays all network models with their current priorities in an editable table. You can edit priorities by clicking in the priority column and sort by priority to see the update order. To display priority numbers directly on neurons in the network, go to `View > Show Neuron Priorities`.

### Setting Up Priority Update

To use priority-based update:

1. Go to `File > Edit Update Sequence`
2. Remove the "Buffered update" action
3. Add "Priority update" action
4. Set neuron priorities (select neurons, press `Cmd/Ctrl+E`, set Priority for each layer)

Since priority update only handles neurons, you may need to add manual updates for synapse groups, weight matrices, and other network components as separate actions in the update sequence.

Priority update is useful when you need sequential processing where information flows in one direction through layers (e.g., feed-forward networks where input layer priority 0, hidden layer priority 1, output layer priority 2). However, in practice, it's often not needed because relevant subnetworks already update in this way.

Currently priority is only used for neuron update. When priority-based update is used, `Buffered Update` should be removed from the update list, and all other groups, arrays, etc must be manually updated. 


# Continuous and Discrete Time Update

The network is updated from the [workspace](../workspace) or separately using its own run menu.

When the network is updated, a `time` variable is updated by adding a `time-step` to it. This updating time can be displayed in two ways, captured by a `time-type` parameter

- **Continuous**: at each iteration time increases by a `time step` that can be set. Time is displayed in milliseconds. This is used when differential equations are numerically integrated. Generally speaking, the smaller the time-step, the more accurate the numerical integration. 

- **Discrete**: at each iteration time increases by 1. Time is displayed as “iterations” (in the underlying code the system is still updated by a time-step; but in this mode time is displayed by dividing the continuous time by the time-step.)

Neuron update rules are associated with a time type. Any time a single continuous update rule is used in a network, time is automatically changed to continuous. This can however be overridden by manually adjusting time type in the network properties.

<!-- TODO: Merge below in -->
<!-- - Basic Iterative (unmarked in the menu above): standard discrete time update, based on iteration of an algorithm.

- Continuous time (marked with a "δt" in the menu above): update is based on numerical integration of a differential equation. Such neurons (or synapses) do not just respond to external inputs but have internal dynamics and an internal state variable that is updated at each time step. Neurons that are continuous have a **time-step** field, described below.

Consider two neuron models: The first performs a weighted sum on the incoming synaptic connections, puts that value through some function which takes in only that net input as an argument, and produces an output. The second performs a weighted sum as well, but this time, the function takes in not only this net input value, but also the "state" (be it the previous net input, activation, or some other value) of the neuron as well. Thus its activation is based not only on its input but its own previous history. In this way we can say that the 2nd neuron has its own internal dynamics. In the first case, the unit of time in the simulation has little or no importance. The activation does not unfold through time and is only dependent on external input to the neuron, thus the question of granularity is irrelevant. This neuron takes in an input and produces an output in a step by step manner. These two cases can be referred to as temporally "discrete" or "continuous" respectively.

Practically speaking even the continuous case is technically discrete as we chose some level of temporal granularity. This is a necessity of simulating temporally continuous situations on a computer which can only consider discrete states. The practice of simulating continuous time on a discrete machine is a major topic in numerical analysis and far beyond the scope of this documentation. The important point is that in complex neuron models with internal states the notion of when things happen and how long they take to happen becomes important, and we simulate that fundamental temporal continuity by choosing typically very small (but meaningful and quantified) discretized time-steps.

- Time Step: The time step is a global variable that is used whenever differential equations are numerically integrated. When a continuous neuron is used, an iteration of the network represents an interval of time whose length equals the time-step. Generally speaking, the smaller the time-step, the more accurate the numerical integration. If there is a single continuous neuron or synapse in a simulation, the network panel will display time in "seconds." Otherwise time is displayed in "iterations." -->

