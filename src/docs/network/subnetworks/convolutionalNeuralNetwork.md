---
title: Convolutional Neural Network
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 40
---

# Convolutional Neural Network

Convolutional neural networks are documented in the main [Convolutional Neural Networks](../convolutionalNeuralNetworks) page, which covers tensor layers, convolution kernels, pooling, flattening, receptive field tracing, training, and CNN shape notation used in node labels.

A ConvolutionalNeuralNetwork subnetwork wraps a CNN pipeline so one network update performs a full forward pass through the tensor stages, flatten connector, and dense layers.

## Creation Dialog

Create a new CNN using `Insert > Add subnetwork > Convolutional neural network`. This opens a creation dialog that builds the pipeline from top to bottom. Specify the input tensor shape, add convolution and pooling stages, add dense layers if needed, and set the output neuron count.

The dialog computes the output shape after each tensor stage, so it is usually the simplest way to create a complete CNN from scratch. Each convolution stage creates a new tensor layer and a convolution connector. Each pooling stage creates a new tensor layer and a pooling connector. The final tensor is flattened to a NeuronArray and then connected to the dense and output layers.

You can also create the same structure manually from the network canvas. Start with a tensor layer, use its right-click menu to add convolution, pooling, and flatten layers outward, then wrap the completed input-to-output pipeline with `Create convolutional neural network`.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Train...**: Opens the CNN training dialog.
- **Add Current Data to Training Set**: Adds the current input tensor activations and output array activations to the CNN training set.
- **Add Current Data to Testing Set**: Adds the current input tensor activations and output array activations to the CNN testing set.
