---
title: Networks
layout: default
has_children: true
nav_order: 15
---

# Network

The network component of Simbrain represents a simulated neural circuit. For a quick dive in see the [quick start](../quickstart) or [this video](https://www.youtube.com/watch?v=dvJvY1zVQUE), which contains a series of links to short clips describing common network operations (adding neurons, connecting neurons, etc.). 

Networks contain a variety of objects ("network models"), including free-floating neurons and synapses, but also neuron arrays and weight matrices for array-based networks, and other more complex structures. This page contains a brief overview of the main object types.  Most objects can be linked to one another with synapses, synapse groups, or weight matrices. The Simbrain philosophy is to allow for arbitrary combinations of network models. Many tools and utilities exist for organizing, arranging, and training these linked network models.

# Main Object Types

## Free neurons and synapses

Free neurons and synapses are part of "classic" Simbrain, allowing nodes and connections to be organized in arbitrary ways using a familiar point-and-click interface. Both nodes and synapses can be equipped with arbitrary rules. See [neurons](neurons/) and [synapses](synapses/).

<img src="/assets/images/freeNodes.png" alt="free weights and neurons" style="width:300px;"/>


## Neuron Collections and Synapse Groups

Free neurons and weights can be aggregated into [neuron collections](neuroncollections/) and [synapse groups](synapsegroups). Neuron collections are lightweight wrappers that allow neurons to be labeled, moved as a unit, and connected to other layers. They have green interaction boxes; deleting a collection leaves the neurons intact.

<img src="/assets/images/neuronCollections.png" alt="neuron collections" style="width:300px;"/>

## Neuron Arrays and Weight Matrices

An alternative to free nodes and weights (and collections of them) is neuron arrays and weight matrices, which support array-based operations, as is standard in modern neural networks. These are much faster and more conventional, though somewhat less intuitive at first. See [arrays and matrices](arraysMatrices).

<img src="/assets/images/neuronArrayWeightMatrix.png" alt="neuron array and weight matrix" style="width:450px;"/>

Neuron collections can be linked to neuron arrays with weight matrices or synapse groups.

## Tensor Layers and Convolutional Neural Networks

Tensor layers support image-like arrays with height, width, and channel dimensions. They can be connected by convolution, pooling, and flattening connectors to build convolutional neural networks. See [convolutional neural networks](convolutionalNeuralNetworks).

CNN shape labels use different conventions depending on the object: tensor layers use `H x W x C`, pooling connectors use pool-window size, and convolution connectors use full kernel-bank shape. See [Convolutional Neural Networks](convolutionalNeuralNetworks#shape-notation).

<img src="/assets/images/cnn/tensor.png" alt="tensor layer" style="width:250px;"/>

## Subnetworks

These are customized collections of network models (neurons, neuron arrays, tensor layers, etc.) that can be associated with data and other objects, and that are updated in a customized way. Examples include backprop networks, convolutional neural networks, and restricted boltzmann machines. See [subnetworks](subnetworks/).

<img src="/assets/images/rbm.png" alt="restricted boltzmann machine" style="width:550px;"/>

# See Also

- [Building Networks](buildingBasics) - Basic network construction
- [Network Update](updateLogic) - How networks are updated
- [Learning](learning/) - Training and learning approaches 
- [Evolution](learning/evolution) - Evolving neural networks
- [Convolutional Neural Networks](convolutionalNeuralNetworks) - Tensor layers, kernels, pooling, and tracing
- [Network Menu](ui/networkMenu) - Menu commands
