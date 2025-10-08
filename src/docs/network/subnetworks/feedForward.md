---
title: Feed Forward
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 50
---

# Feedforward Network

<!-- TODO: Add image -->

A feedforward network is a sequence of [neuron arrays](../arraysMatrices) connected by all-to-all [weight matrices](../arraysMatrices). [Backprop networks](backprop) and [SRN networks](simpleRecurrentNetwork) are specialized types of feedforward networks. Activation in the input layer of a feedforward network propagates forward through the network, layer by layer, with no recurrent connections.

Feedforward networks provide a flexible base structure for building custom neural networks. The basic feedforward network doesn't include training capabilities, but serves as a foundation for more specialized supervised learning networks.

<!-- TODO: Add image -->

## Creation Dialog

A feedforward network's topology is specified using a creation dialog with these fields:

**Number of Layers:** Sets the number of layers in the network. Enter a value in the text field and press the change button. When you do, the dialog updates to allow you to specify the number of neurons and neuron type separately for each layer. Layer 1 is the input layer.

**Number of Neurons:** Sets the number of neurons for each layer.

**Neuron Type:** Sets the neuron type for each layer. By default, layers use variants of a [discrete sigmoidal](../neurons/sigmoidal) neuron.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page. The basic feedforward network has only the standard menu items (Cut, Copy, Rename, Remove, Edit).
