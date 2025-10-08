---
title: Competitive
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 30
---

# Competitive Network

A competitive network is a collection of neurons that compete with each other to represent clusters of inputs. With training, the nodes of a competitive network come to represent particular clusters of inputs, making them useful for unsupervised learning and pattern classification.

The competitive network combines elements of winner-take-all dynamics and Hebbian learning. The [self-organizing map](selfOrganizingMap) is a spatial generalization of this algorithm.

<!-- TODO: Add image -->

A competitive network may either be created as a group or a network. As a network, it has a self-contained layer of input nodes and it can be trained using a table of inputs. As a group, it is up to the user to connect it to other neurons, and the inputs these produce will determine its weights over time.

## Algorithm

The basic algorithm described here is the original PDP version due to Rumelhart and Zipser. An alternative, due to Alvarez and Squire, is also available (see references below).

1. Compute the weighted input to every unit.
2. Determine the winner, which is the unit with the greatest weighted input. In the case of a tie, this is done arbitrarily.
3. Update the weights attaching to the winning neuron only. These weights are changed by the following quantity: learning rate times the source activation divided by the total activation of the source layer minus the current strength of the weight:

$$
\Delta w = \epsilon \left( \frac{a_i}{\sum a_{inputs}} - w_{ij} \right)
$$

where $$ \epsilon $$ is a learning rate, $$ \sum a_{inputs} $$ is the sum of all the inputs to the unit, and $$ a_i $$ is an input neuron's activation. This algorithm has the result that the winning unit's weights come over time to resemble the input vector that led that unit to win. The learning rate controls how quickly this happens.

The division by the sum of inputs maintains the normalization of the weight vectors. Thus, if more strength is added to one weight, it is taken away from another.

## Initialization

Competitive networks are initialized with some number of units and are by default laid out as a line. There are no connections. Connections must be made leading into the network, and they should be constrained to only take values between 0 and 1.

A variant of the competitive learning algorithm called "leaky learning" requires all weights to learn on each time step, rather than just the winning weight. The algorithm for the weight change on the losing units is the same as above, but a new learning rate parameter is used, which will typically be smaller than the winning unit learning rate, so that weights attaching to losing neurons learn more slowly.

## Creation / Editing

When creating a competitive network, you specify:

- **Number of inputs:** Number of input neurons.
- **Number of competitive neurons:** Number of neurons in the competitive layer.

The competitive group has these parameters:

- **Update method:** Select either Rummelhart-Zipser or Alvarez-Squire.
- **Learning rate:** Determines how quickly synapses change during training.
- **Winner Value:** The activation value for the winning neuron.
- **Lose Value:** The activation value for all losing neurons.
- **Normalize inputs:** If enabled, inputs are normalized prior to being used in weight updates.
- **Use Leaky learning:** If enabled, all weights learn on each time step, not just the weights attaching to the winning unit.
- **Leaky learning rate:** The learning rate for losing neurons when leaky learning is enabled. Only available when Use Leaky learning is enabled.
- **Decay percent:** Amount to decay incoming synapses at every iteration. Only used with the Alvarez-Squire update method.
- **Layout:** See the [layouts](../layouts) page.

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Edit / Train Competitive:** Opens the training dialog to edit and train the competitive network.
- **Train On Current Pattern:** Iterate the training algorithm once using the current inputs.
- **Randomize:** Randomize synapses connected to the competitive group.

## Training

Training a competitive network involves specifying input data and then running the algorithm. The general process is covered in [Training Networks](../trainingNetworks#unsupervised-learning). Double-click the interaction box to open the training dialog.

## References

The Rumelhart and Zipser update rule is described in [this PDP handbook chapter](https://web.stanford.edu/group/pdplab/pdphandbook/handbookch7.html). Also see the PDP volumes, volume 1, chapter 5.

The Alvarez and Squire version of the algorithm is described in [this PNAS paper](http://www.pnas.org/content/91/15/7041.full.pdf).
