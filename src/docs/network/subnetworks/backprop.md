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

A backprop network is a **feed forward** network that can be trained using the **backpropagation** learning algorithm, which is perhaps the best known and most popular means of training neural networks. The Simbrain implementation (currently fairly bare bones) is described **here**.

Backprop networks are created using **Insert network > backprop**. They can then be trained using the **training dialog**, and then either used by themselves or linked to other components. Once a backprop network has been trained data can be validated in it using the **validation tab** of the training dialog. Backprop can also be used separately from a backprop network, in **scripts** to custom train a set of weights. An example which steps through the process of creating and training a backprop network is in the **examples page**.

## Creation Dialog

The backprop creation dialog allows you to specify the network topology and neuron types. This dialog is documented in [feed forward](feedForward.html) docs.

## Training

Training a network involves specifying input data, target data, and then running the algorithm. This process is handled in the **training dialog**. To open this dialog double click on the interaction box that is by default labelled "Backprop".

Once the network is trained to perform a particular input-output mapping, it can be linked to other networks or neurons in Simbrain, or simply used on its own, primarily with the **validation tab** of the training dialog.

### Right Click Menu

Generic right-click items are described on the **neuron group** page.

- **Edit/Train Backprop:** Opens edit dialog to edit and train the Backprop network.
