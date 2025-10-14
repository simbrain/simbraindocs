---
title: Backprop
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 20
---

# Backprop Network

<!-- TODO: Add image -->

A backprop network is a [feed forward](feedForward) network that can be trained using the backpropagation learning algorithm, one of the most widely used methods for training neural networks. The network learns to map inputs to outputs by adjusting weights to minimize the difference between predicted and target outputs.

Backprop networks are created using Insert > Add subnetwork > Backprop. They can then be trained using the training dialog, and then either used by themselves or linked to other Simbrain components. Once a backprop network has been trained, data can be validated using the validation tab of the training dialog.

## Creation Dialog

The backprop creation dialog allows you to specify the network topology and neuron types. See the [feed forward](feedForward) creation dialog documentation for details on these settings.

By default, the input layer uses linear neurons while hidden and output layers use logistic sigmoid neurons, which is appropriate for many classification and regression tasks.

## Training

Training a backprop network involves specifying input data, target data, and then running the backpropagation algorithm. The general process is covered in [Training Networks](../learning/trainingNetworks#supervised-learning). To open the training dialog, double-click on the interaction box labeled "Backprop".

Once the network is trained to perform a particular input-output mapping, it can be linked to other networks or components in Simbrain, or used on its own with the validation tab to test new patterns.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Edit / Train Backprop:** Opens the training dialog to edit and train the backprop network.
