---
title: Neuron Groups and Collections
layout: default
parent: Networks
has_children: true
nav_order: 90
---

# Neuron Groups and Collections

A neuron group is a logical grouping of neurons surrounded by a gray line and an [interaction box](/docs/network/buildingBasics.html#interaction-boxes). There are various types of neuron groups in Simbrain, each with parameters that can be set, and they are also constituents of [subnetworks](../subnetworks). 

<img src="/assets/images/neuronGroup.png" alt="neuron group" style="width:300px;"/>

## Creation

To create a neuron group, you can

- use the `insert menu` and select `bare neuron group` 
- use the `Insert > Add neurons...` command and select the checkbox to create a group. 

For information on connecting neuron groups with synapse groups, see [the synapse group creation](SynapseGroup.html#synapseGroupCreation) documentation.

Neuron groups can be linked by [Weight Matrices](../arraysMatrices.html) or [Synapse Groups](../synapsegroups.html):

1) To link neuron groups with weight matrices, you  must use the [1-2 trick](../buildingBasics.html#source-and-target-objects).
2) To link neuron groups with synapse groups you mus tuse the [1-3 trick](../buildingBasics.html#source-and-target-objects).


# Neuron Collection

Neuron collections are a lightweight alternative to neuron groups. Unlike neuron groups, they can overlap. They have a green rather than a yellow interaction box. They are created by selecting nodes and pressing `shift-G`.

Here are some of the main differences. Neuron groups
- Contain neurons as children
- Have their own layout object
- When deleting, all nodes are deleted
- Have subclasses (like SOM, Competitive) with custom updating

While neuron collections are:
- Loose associations mainly for labeling
- Do not have custom update
- Deleting does not delete neurons
- Can overlap each other and neuron groups, even when in subnetworks

<img src="/assets/images/neuronCollections.png" alt="neuron colletions" style="width:300px;"/>

## Creation/Edit Dialog

<!-- TODO --> Add image

**Group ID:** Labeling that identifies the group.

**Label:** Name of the group.

**Input mode:** When a neuron group is in input mode, at each update the neurons of this group are set to the values in successive rows of the [Input Data](#inputData) tab.

**Population:** Number of neurons in the group.

**Neuron Type:** The neuron update rule governing the neurons in the group. If multiple different neuron update rules are being used, the value will be displayed as "...".

**Parent:** Denotes the parent group (usually a subnetwork), if any.

## Neurons

See the [neuron](../neurons) page.

## Layout

See the [layouts](../layouts.html) page.

## Input Data

See the [test inputs](../training/testInputs.html) page.

## Right Click Menu

**Edit:** Edit group properties. This opens the group properties panel which includes the above sections. This is the same as double-clicking on the [interaction box](/docs/network/buildingBasics.html#interaction-boxes).

**Rename Neuron Collections:** Input another name for the group.

**Remove Neuone Group:** Delete the group.

**Apply Layout:** Apply a layout to this neuron group

**Select Neurons:** Select all neurons in the group.

**Select Incoming Synapses:** Select all incoming synapse groups and/or free synapses.

**Select Outgoing Synapses:** Select all outgoing synapse groups and/or free synapses.

**Clamp Neurons:** Clamp all neurons in the group. See [Clamping](../neurons#clamping).

**Unclamp Neurons:** Unclamp all the neurons in the group.

**Connect Selected Objects with Weight Matrix:** Automatically connect arrays with weight matrices

**Connect Selected Neuron Groups with Synapse Groups:** Automatically connect arrays with synapse groups

**Set Group as Source:** Set the group as source group. Used when creating synapse groups. The concept is the same as with individual neurons described [here](../buildingBasics.html#source-and-target-objects) but with neuron groups rather than individual neurons.

**Clear Source as Neuron Groups:** Deselect the group as source neuron group.

**Connect Neuron Group with Synapse Group:** Connect source and target neuron groups with a synapse group.

**Create Supervised Model:** Create supervised model with using the current activation as target for immediate training

**Input Data:** Opens a dialog that can be used to send inputs to this layer

**Add Current Pattern to Input Data:** Add the current activation of this layer to the input data table

**Plot:** Plot the neuron group's activations across a graph

**Add Coupled Image World:** Add an image world that is coupled to the neuron group

**Start/Stop Recording:** Starts recording the activation values from the neuron group to a .csv file or stops if it is already recording. When starting recording, a dialog shows up asking you to specify a name for the spike recording file. If the network is a spiking network, then each line of the file begins with a time and is followed by neuron IDs (in this case, the ".csv" file is not really CSV).

**Send Vector Coupling To:** Copies all activation values in the neuron group and represents them as a vector where each element in the vector is the activation value of a single neuron in the group. This creates a coupling such that this vector is forwarded to some other component in Simbrain. See the [couplings](../../workspace/Couplings.html) page.

**Receive Vector Coupling from:** Takes some vector forwarded from some other component and sets the activation values of the neurons in the group based on the incoming vector.




