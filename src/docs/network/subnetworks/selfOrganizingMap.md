---
title: Self-Organizing Map
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 70
---

# Self-Organizing Map

A self-organizing map (SOM) is a type of [competitive network](competitive) that learns to represent the structure of input data in a spatially organized way. Over time, the SOM's neurons become tuned to different patterns in the input, and importantly, nearby neurons in the SOM respond to similar inputs. For example, an SOM trained on different smells might develop one region that responds to cheese smells and another region that responds to flower smells. To get a feel for how SOMs work, try the somLetters.zip and somSmells.zip workspaces in the simulations folder.

<!-- TODO: Add image -->

An SOM network includes a self-contained layer of input nodes and a SOM group, and can be trained using a table of inputs. The SOM neurons are arranged in a spatial layout (typically a grid) where position matters for the learning algorithm.

## Algorithm

Intuitively, the algorithm works by taking an input, finding the output node whose weights most closely match the input (the "winner") and then updating the winning neuron's weights so that they match the inputs more closely. The weights are not only updated on the winning node, but also on other nodes in a neighborhood around the winning node. Over time the learning rate and neighborhood size decrease to 0. Thus the bank of nodes in an SOM network correspond to a kind of "map" of the input space, whereby nearby nodes correspond to similar objects in the network's environment.

The following algorithm is run on each iteration of a SOM network.

<!-- TODO: Equations need to be fixed -->

1. Determine the SOM neuron which is closest to the input vector by computing the following for each SOM neuron:

$$
d(i,j) = \sum_i (w_{ij} - x_j)^2
$$

where $$ i $$ and $$ j $$ are the dimensions of the weight matrix $$ w $$, and $$ x $$ is the input vector.

2. Update the winning neuron and the neurons in its update neighborhood:

$$
w_i(t+1) = w_i(t) + \alpha(t)(x - w_i(t))
$$

where $$ \alpha $$ is the current learning rate.

3. Diminish learning rate and neighborhood size.

The effect of the algorithm is such that the SOM neurons that remain are characteristic of the trends of input patterns.

## Creation

SOMs are initialized by specifying a number of neurons and a layout for those neurons. The layout is important because the SOM works by updating a winning node and neighboring nodes.

Input vectors are activations of neurons connecting to the SOM network, and should be fully connected to the SOM network.

The synapses should be either small or sampled evenly from the subspace spanned by the two largest principal component eigenvectors.

<!-- TODO: Add image -->

## Training

Training an SOM network involves specifying a set of input data and then running the algorithm. The general process is covered in [Training Networks](../trainingNetworks#unsupervised-learning). Double-click the interaction box to open the training dialog.

The SOM learns by repeatedly finding the winning neuron (closest to each input) and updating weights in a neighborhood around the winner. Over time, the learning rate and neighborhood size decrease to zero, allowing the map to stabilize. The decreasing learning rate and neighborhood size are shown in the interaction box. Use Reset SOM Network from the right-click menu to restart training from initial parameter values with possibly modified parameters.

## Creation Parameters

When creating an SOM network, you specify:

- **Number of som neurons:** Number of neurons in the SOM layer. These are laid out in a spatial grid.
- **Number of inputs:** Number of input neurons that will be fully connected to the SOM layer.

## SOM Parameters

The SOM group has these learning parameters:

- **Initial learning rate:** The starting learning rate from which all future learning rates are derived. This decreases over time during training.
- **Initial Neighborhood size:** The starting radius around the winning neuron within which learning takes place. This decreases over time during training.
- **Learning decay rate:** The rate at which the learning rate decreases after each iteration.
- **Neighborhood decay rate:** The amount that the neighborhood size decreases after each iteration.

## Recall

Displays the weights attaching to the most active SOM neuron in the pool of input neurons. This gives a sense of what pattern the currently active SOM node represents in terms of inputs.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Edit / Train SOM:** Opens the training dialog to train the SOM network.
- **Train On Current Pattern:** Iterate the training algorithm once using the current inputs.
- **Randomize:** Randomize synapses connected to the SOM group.
- **Reset SOM Network:** Reset the learning rate and neighborhood size to their initial values.
- **Recall SOM Memory:** Set the input layer activations to match the weights of the most active SOM neuron.

## References

Kohonen, Teuvo (1990), The Self-Organizing Map, *Proceedings of the IEEE*, 78:9.
