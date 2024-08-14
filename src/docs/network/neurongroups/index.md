---
title: Neuron Groups and Collections
layout: default
parent: Networks
has_children: true
nav_order: 50
---

# Neuron Groups and Collections

A neuron group is a logical grouping of neurons surrounded by a gray line and an [interaction box](../groups.html#interactionBox). There are various types of neuron groups in Simbrain, each with parameters that can be set, and they are also constituents of [subnetworks](../subnetwork.html). This page covers properties common to all neuron group types. Details of each type can be found on their respective page.

To create a neuron group, either use the `insert menu` and select `bare neuron group` or use the `Insert > Add neurons...` command and select the checkbox to create a group. For information on connecting neuron groups with synapse groups, see [the synapse group creation](SynapseGroup.html#synapseGroupCreation) documentation.


Neuron collections are a lightweight alternative to neuron groups. They can overlap. They have a green rather than a yellow interaction box. They are create by selecting nodes and pressing `shift-G`.

Here are the main differences.

Neuron Groups:
- Contain neurons as children
- Have their own layout object
- When deleting, all nodes are deleted
- Have subclasses (like SOM, Competitive) with custom updating

Neuron Collections:
- Loose associations mainly for labeling
- Do not have custom update
- Deleting does not delete neurons
- Can overlap each other and neuron groups, even when in subnetworks



<img src="/assets/images/neuronGroup.png" alt="neuron group" style="width:300px;"/>

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

See the [neuron](../neuron.html) page.

## Layout

See the [layouts](../layouts.html) page.

## Input Data

See the [test inputs](../training/testInputs.html) page.

## Right Click Menu

**Edit:** Edit group properties. This opens the group properties panel which includes the above sections. This is the same as double-clicking on the interaction box.

**Rename Group:** Input another name for the group.

**Remove Group:** Delete the group.

**Select Neurons:** Select all neurons in the group.

**Select Incoming Synapses:** Select all incoming synapse groups and/or loose synapses.

**Select Outgoing Synapses:** Select all outgoing synapse groups and/or loose synapses.

**Clamp Neurons:** Clamp all neurons in the group. See [Clamping](../neuron.html#clamping).

**Unclamp Neurons:** Unclamp all the neurons in the group.

**Set Group as Source:** Set the group as source group. Used when creating synapse groups. The concept is the same as with individual neurons described [here](../connections.html#sourceTarget) but with neuron groups rather than individual neurons.

**Clear Source Neuron Groups:** Deselect the group as source neuron group.

**Connect Neuron Group with Synapse Group:** Connect source and target neuron groups with a synapse group.

**Send Vector Coupling To:** Copies all activation values in the neuron group and represents them as a vector where each element in the vector is the activation value of a single neuron in the group. This creates a coupling such that this vector is forwarded to some other component in Simbrain. See the [couplings](../../workspace/Couplings.html) page.

**Receive Vector Coupling from:** Takes some vector forwarded from some other component and sets the activation values of the neurons in the group based on the incoming vector.

**Start/Stop Recording:** Starts recording the activation values from the neuron group to a .csv file or stops if it is already recording. When starting recording, a dialog shows up asking you to specify a name for the spike recording file. If the network is a spiking network, then each line of the file begins with a time and is followed by neuron IDs (in this case, the ".csv" file is not really CSV).



