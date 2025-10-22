---
title: Self-Organizing Map
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 70
---

# Self-Organizing Map Network

An SOM network is a pre-configured subnetwork containing a [SOM group](../neurongroups/selfOrganizingMap) with an input layer and training interface. The SOM group is where the learning algorithm and parameters are defined.

For details on the algorithm, parameters, and theory, see the [SOM group](../neurongroups/selfOrganizingMap) page. To get a feel for how SOMs work, try the "SOM network" simulation from `Simulations > Competitive`.

## Structure

The SOM network consists of:
- An input layer (clamped)
- A [SOM group](../neurongroups/selfOrganizingMap) arranged in a hexagonal grid
- All-to-all connections from input to SOM layer
- Training data management for unsupervised learning

## Creation

When creating an SOM network, you specify:

- **Number of som neurons:** Number of neurons in the SOM layer. These are laid out in a spatial grid.
- **Number of inputs:** Number of input neurons that will be fully connected to the SOM layer.

For SOM group parameters (learning rate, neighborhood size, decay rates), see the [SOM group](../neurongroups/selfOrganizingMap#parameters) documentation.

## Training

Training an SOM network involves specifying a set of input data and then running the algorithm. The general process is covered in [Unsupervised Learning](../learning/unsupervisedLearning). Double-click the interaction box to open the training dialog.

The SOM learns by repeatedly finding the winning neuron (closest to each input) and updating weights in a neighborhood around the winner. Over time, the learning rate and neighborhood size decrease to zero, allowing the map to stabilize. The decreasing learning rate and neighborhood size are shown in the interaction box. See the [SOM group](../neurongroups/selfOrganizingMap#algorithm) documentation for algorithm details.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Edit / Train SOM:** Opens the training dialog to train the SOM network.
- **Train On Current Pattern:** Iterate the training algorithm once using the current inputs.
- **Randomize:** Randomize synapses connected to the SOM group.
- **Reset SOM Network:** Reset the learning rate and neighborhood size to their initial values.
- **Recall SOM Memory:** Set the input layer activations to match the weights of the most active SOM neuron.
