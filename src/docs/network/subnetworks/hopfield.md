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

A discrete [Hopfield network](http://www.scholarpedia.org/article/Hopfield_network) is a collection of binary neurons that are recurrently connected to each other. They are useful in pattern completion tasks: a Hopfield network stores a number of memories (for example, patterns representing letters) and can retrieve these memories from partial patterns. They illustrate the concept of an attractor. Each memory is an attractor and a partial cue for that memory is an initial condition. The system can also be understood as minimizing an energy function; the network's energy value decreases as it settles into stored patterns.

To get a feel for how a Hopfield network works, try the Hopfield simulation in the simulations folder.

The network uses binary patterns (0,1) which are converted to bipolar (-1,1) before Hebbian learning is applied. The interaction box displays the current energy value of the network.

## Creation / Editing

When creating a Hopfield network, you specify:

- **Number of neurons:** The number of neurons in the network. Neurons are laid out as a grid by default.

The network is fully interconnected with no self-connections. Hopfield networks have these parameters:

- **Update function:** Determines how neurons are updated. Three options:
  - **Synchronous:** All neurons update simultaneously. Does not depend on update order but can produce oscillations.
  - **Sequential:** Neurons update one at a time in a fixed sequence. More stable than synchronous.
  - **Stochastic:** A single randomly chosen neuron is updated on each iteration. This is the traditional Hopfield approach and relates to Boltzmann machines.
- **Learning rate:** Controls how quickly the network learns new patterns when training.

## Training

The general training process is covered in [Training Networks](../trainingNetworks#unsupervised-learning). To train a Hopfield network, double-click on the interaction box to open the training dialog.

The network learns patterns using Hebbian learning. Binary patterns (0,1) are converted to bipolar (-1,1) before learning is applied. During training and recall, observe the energy value in the interaction box, which decreases as the network settles into stored patterns.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Edit / Train Hopfield:** Opens the training dialog to edit and train the Hopfield network.
- **Train On Current Pattern:** Train the Hopfield network using the Hebbian rule to learn the current pattern of activity.
- **Randomize:** Randomize the synaptic weights symmetrically.

## Continuous Hopfield Networks

To create a continuous Hopfield network, use a set of [Additive neurons](../neurons/additive) in a standard network. These can be connected appropriately and trained by using [Hebbian synapses](../synapses/hebbian). The user then clamps all neurons, iterates to train the synapses, then clamps all weights. On clamping, see the [toolbar documentation](../../workspace/toolbars).

