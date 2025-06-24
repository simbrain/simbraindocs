---
title: Hopfield
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 60
---

# Hopfield Network

<!-- TODO: Add image. Discuss how continuous hopfield is implemented. -->

A discrete [Hopfield network](http://www.scholarpedia.org/article/Hopfield_network) is a collection of **binary neurons** that are recurrently connected to each other. They are useful in pattern completion tasks: a Hopfield network stores a number of "memories" (e.g., the network shown stores the letter "Z") and can retrieve these memories from partial patterns. They illustrate the concept of an attractor. Each memory is an attractor and a partial cue for that memory is an initial condition. The system can also be understood as going to a minimum on an energy landscape; when recalling patterns you can observe energy value reducing, often to lower and lower negative numbers.

To get a feel for how a Hopfield network works, run one the Hopfield simulations and follow the included directions.

Note that the network only takes binary patterns. These are converted to bipolar (-1,1) before a Hebbian learning is applied.

## Creation / Editing

Hopfield networks are initialized with some number of units and are by default laid out as a grid. They are fully interconnected with no self-connections.

### Number of Neurons

Set the desired number of neurons in this field.

### Update Order

This can be set to random or sequential. If set to random, the neurons are updated in random order. This is the standard assumption of Hopfield networks. If sequential is used, neurons are updated in the same sequence each time, making it possible to reproduce chains of behavior.

### By Priority (Only for sequential)

Use neuron **priority** fields when updating sequentially.

### Shuffle Order (Only for sequential)

Shuffle the order of the sequential update.

## Training

To train a Hopfield network, double-click on the interaction box, load training data using the input data tab of the **training dialog**, and then press the play button.

## Right Click Menu

### Update Order

This can be set to random or sequential. If set to random, the neurons are updated in random order. This is the standard assumption of Hopfield networks. If sequential is used, neurons are updated in the same sequence each time, making it possible to reproduce chains of behavior. Three cases:

1. **Synchronous** does not depend on the order in which nodes are updated but sometimes produces oscillations.
2. **Sequential** is more stable. Nodes are updated one at a time and order matters. More stable than synchronous. Can either use the priority of the nodes for update order or a random order (randomize once at initialization and use this order every time).
3. **Random**: Nodes are updated in random order. This was important in the history of Hopfield networks and is related to Boltzmann machines.

### Add Current Pattern To Input Data

Add the current pattern in the network to the training set. Useful for creating training data directly in the GUI.

### Randomize Synapses Symmetrically

Randomize the synaptic weights symmetrically.

### Set Weights To Zero

Set all synaptic strengths to zero.

### Edit/Train Hopfield

Open the edit/train dialog.

### Train on Current Pattern

Train the Hopfield network using the Hebb rule to learn the current pattern of activity across its nodes.

## Continuous Hopfield Networks

To create a continuous Hopfield network, use a set of **Additive neurons** in a standard network. These can be connected appropriately and trained by using **Hebbian synapses**. The user then clamps all neurons, iterates to train the synapses, then clamps all weights. On clamping, see **toolbar**.

