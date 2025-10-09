---
title: Self Organizing Map
layout: default
grand_parent: Networks
parent: Neuron Groups and Collections
has_children: false
nav_order: 40
---

# Self-Organizing Map

A self-organizing map or SOM is a kind of [competitive network](competitive), which over time is tuned to represent the structure of a set of inputs. For example, an SOM exposed to a dataset consisting of different smells will learn to distinguish those smells over time. Moreover, the positions of the nodes in the SOM are significant: nearby nodes come to represent similar inputs. In a smell network, one group of neighboring nodes might come to represent different cheese smells, while another group might come to represent different flower smells. To get a feel for how SOM's work try the workspaces called "somLetters.zip" and "somSmells.zip".

<!-- TODO --> Add image of equation or latex for equation (not in simbrain3)

An SOM may either be created as a group or a network. As a network, it has a self-contained layer of input nodes and it can be trained using a table of inputs. As a group, it is up to the user to connect it to other neurons, and the inputs these produce will determine the way it comes to represent those inputs over time.

## Algorithm

Intuitively, the algorithm works by taking an input, finding the output node whose weights most closely match the input (the "winner) and then updating the winning neuron's weights so that they match the inputs more closely. The weights are not only updated on the winning node, but also on other nodes in a neighborhood around the winning node. Over time the learning rate and neighborhood size decrease to 0. Thus the bank of nodes in an SOM network correspond to a kind of "map" of the input space, whereby nearby nodes correspond to similar objects in the network's environment.

Step-by-Step Algorithm:

1. Determine the SOM neuron which is closest to the input vector by computing the following for each SOM neuron:
$$[ d_{ij} = | x - w_{ij} | ]$$
Where $$( i )$$ and $$( j )$$ are the dimensions of the weight matrix $$( w )$$, and $$( x )$$ is the input vector.

2. Update the winning neuron and the neurons in its update neighborhood:
$$[ w_{ij}(t+1) = w_{ij}(t) + \alpha \cdot h_{ij}(t) \cdot (x - w_{ij}(t)) ]$$
Where $$(\alpha)$$ is the current learning rate.

3. Diminish learning rate and neighborhood size.

The effect of the algorithm is such that the SOM neurons that remain are characteristic of the trends of input patterns.

## Training

Training a network involves specifying a set of input data and then running the algorithm. This will repeatedly apply the SOM algorithm. The general process is covered in [Training Networks](../trainingNetworks). The decreasing learning rate and neighborhood size are shown in the interaction box. Occasionally it may be useful to reset the network to try training it again, possible with modified parameters.

## Creation

SOMs are initialized by specifying a number of neurons and a layout for those neurons. The layout is important, because the SOM works by updating a winning node and neighboring nodes. Input vectors are activations of neurons connecting to the SOM network, and should be fully connected to the SOM network. The synapses should be either small or sampled evenly from the subspace spanned by the two largest [principal component](https://en.wikipedia.org/wiki/Principal_component_analysis) eigenvectors.

<!-- TODO --> Add image of equation or latex for equation  

## Training the SOM

When used as a group only, or when linked to external networks or sources of data, then those inputs train the network, and it is only up to the user to occasionally reset the parameters and the network.

When the [training dialog](../trainingNetworks) is used, inputs can be specified in the input tab, and then the play button pressed until the learning rate and neighborhood size go to 0. Parameters controlling the rate at which these decay can be adjusted and learning re-run to try to achieve a desired result.

## Parameters

- **Initial learning rate**: The base learning rate from which all future learning rates are derived through decay. This rate determines how much the weights are adjusted toward the input pattern.
- **Initial Neighborhood size**: The initial radius around the winning neuron within which learning takes place. This determines how many neighboring neurons are updated along with the winner.
- **Learning decay rate**: The rate at which the learning rate decreases over time. After each iteration, the learning rate decays by this proportion.
- **Neighborhood decay rate**: The amount by which the neighborhood size decreases after each iteration. The neighborhood gradually shrinks as training progresses, allowing for fine-tuning.

## Recall

Displays the weights attaching to the most active SOM neuron in the pool of input neurons. This gives a sense of what pattern the currently active SOM node represents in terms of inputs.

## Right Click Menu

Generic right-click items are described on the **[neuron group](.)** page.

- **Edit/Train SOM:** Opens edit dialog to train SOM network.
- **Add Current Pattern To Input Data:** Add the current pattern in the network to the training set. Useful for creating training data directly in the GUI.
- **Train On Current Pattern:** Iterate the training algorithm once using the current inputs.
- **Randomize Synapses:** Randomize synapses connected the competitive group, which are the ones trained using the algorithm.

## References

- Kohonen, Teuvo (1990), The Self Organizing Map, *Proceedings of the IEEE*, 78:9.


