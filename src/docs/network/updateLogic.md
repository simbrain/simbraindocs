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

At the top level each network iteration a sequence of actions is executed. Usually the default update action, `Buffered update`, is all that is executed, and all that is needed. However, custom actions can be added and update can be customized, either in the GUI, or for even more custom applications, in [scripts](../simulations/simulations.md).

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


# Network Models

Network models can override certain features of update to allow for customization within the default buffered update mode.

Neuron groups and subnets have special update functions. For example, feedforward networks [link] update the input nodes first, then hidden layers in sequence, then the output nodes.

# Update Rules and Data Holders

Neurons, synapses, neuron arrays, weight matrices, and spike responders [links] all use a design that separates update rules from the data they operate on and easily edited and changed in using a property editor [link]. 
     
There are two main cases here: free neurons and weights, and neuron arrays and weight matrices. Both are somewhat more complex because of the possibility of spikes and so that adds a layer of logic. There are also synaptic delays to deal with.

The basic thing to remember is this. The neuron has an activation. That is its main quantity.  The synapse has as a psr, a post synaptic response. That is meant to capture two possibilities. One, the connectionist one. PSR is just weight times pre-synaptic activaiton. Two the spiking one, PSR is the output of a spike responder.

Then in the array case, we have a neuronarray, which has a matrix of activations, and a weight matrix hwhich has a matrix of psr's and a weight matrix. [more]

PSR update can also introduce delays.

In both cases a given rule may require additional variables, which are stored in data holders. These data are scalar for neurons and weights, and matrix for neuron arrays and weight matrices.

So then for each neuron or neuron array:
- For each fan-in synapse or weight matrices, update psr
- Update the neuron or neuron array 

![Neuron logic](/assets/images/simbrainNeuron.png)

# Time

The workspace has a time variable that is separate from each network.

Networks can have two time types

Time Type:
- Discrete: at each iteration time goes up by 1. Time is displayed as “iterations”
- Continuous: at each iteration time goes up by one time step. The time step can be set. Time is displayed in milliseconds. This is used when differential equations are numerically integrated. Generally speaking, the smaller the time-step, the more accurate the numerical integration. 

Time Type and (for continuous) Time Step can be set manually in network properties.  Any time a single continuous update rule  is used in a network, time is automatically changed to continuous. However it can then be changed back.

Note that the underlying code is always using continuous time, and discrete is just using a different display style.

