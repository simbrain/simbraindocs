---
title: Networks
layout: default
has_children: true
nav_order: 15
---

# Network

The network component of Simbrain represents a simulated neural circuit. For a quick dive in see the [quick start](../quickstart.html) or [this video](https://www.youtube.com/watch?v=dvJvY1zVQUE), which contains a series of links to short clips describing common network operations (adding neurons, connecting neurons, editing neuron groups, etc.). 

Networks contain a variety of objects (we call them "network models"), including free-floating neurons and synapses, but also neuron arrays and weight matrices for array-based network, and a wide array of other more complex structures. This page contains a brief overview of the main object types. The Simbrain philosophy is to allow for arbitrary combinations of models. Most objects can be linked to one another with different types of adapters. By combining these together you can create indefinitely many different kinds of networks. Many tools exist for organizing, arranging, training, and linking these objects together.

# Main Object Types

## Free neurons and synapses

Free neurons and synapses are part of "classic" Simbrain, allowing nodes and connections to be organized in arbitrary ways using a familiar point-and-click interface. Both nodes and synapses can be equipped with arbitrary rules. 

<img src="/assets/images/freeNodes.png" alt="free weights and neurons" style="width:300px;"/>


## Neuron Groups, Synapse Groups, and Neuron Collections

Free neurons and weights can be aggregated in various ways but are moved and adjusted _as a group_, via a yellow **interaction box**. 

<img src="/assets/images/neuronGroup.png" alt="neuron group" style="width:300px;"/>

<img src="/assets/images/neuronCollections.png" alt="neuron colletions" style="width:300px;"/>

## Neuron Arrays and Weight matrices

An alterantive to free nodes and weights (and collections of them) is neuron arrays and weight matrices, which  support array based operations, as is standard in modern neural networks. These are much faster and more conventional, though somewhat less intuitive at first.

<img src="/assets/images/neuronArrayWeightMatrix.png" alt="neuron array and weight matrix" style="width:450px;"/>

Neuron collections and groups can be linked to neuron arrays with weight matrices or synapse groups.

## Subnetworks

These are customized collections of network models (neurons, neuron groups, neuron arrays, etc.) that can be associated with data and other objects, and that are updated in a customized way. Examples include backprop networks and restricted boltzmann machines.

<img src="/assets/images/rbm.png" alt="restricted boltzmann machine" style="width:550px;"/>

