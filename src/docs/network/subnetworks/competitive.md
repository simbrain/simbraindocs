---
title: Competitive
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 30
---

# Competitive Network

A competitive network is a pre-configured subnetwork containing a [competitive group](../neurongroups/competitive) with an input layer and training interface. The competitive group is where the learning algorithm and parameters are defined.

For details on the algorithm, parameters, and theory, see the [competitive group](../neurongroups/competitive) page.

## Structure

The competitive network consists of:
- An input layer (clamped)
- A [competitive group](../neurongroups/competitive) 
- All-to-all connections from input to competitive layer
- Training data management for unsupervised learning

## Creation

When creating a competitive network, you specify:

- **Number of inputs:** Number of input neurons.
- **Number of competitive neurons:** Number of neurons in the competitive layer.

For competitive group parameters (update method, learning rate, etc.), see the [competitive group](../neurongroups/competitive#parameters) documentation.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Edit / Train Competitive:** Opens the training dialog to edit and train the competitive network.
- **Train On Current Pattern:** Iterate the training algorithm once using the current inputs.
- **Randomize:** Randomize synapses connected to the competitive group.

## Training

Training a competitive network involves specifying input data and then running the algorithm. The general process is covered in [Training Networks](../learning/trainingNetworks#unsupervised-learning). Double-click the interaction box to open the training dialog.

Training sets input patterns, and the competitive group learns to represent clusters in the input data. See the [competitive group](../neurongroups/competitive#algorithm) documentation for algorithm details.
