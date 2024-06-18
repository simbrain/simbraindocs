---
title: Networks
layout: default
has_children: true
nav_order: 15
---

# Network

The network component of Simbrain represents a simulated neural circuit. Networks are the core component of a Simbrain simulation. They are built using a simple graphical interface.

For things to quickly get started, see the [quick start](../quickstart.html).  Also see [this video](https://www.youtube.com/watch?v=dvJvY1zVQUE), which contains a series of links to short clips describing common network operations (adding neurons, connecting neurons, editing neuron groups, etc.)

Networks are built by creating neurons and connecting them with synapses. They are run by pressing the `play` or `step` buttons. For a sense of what the colors, circles, etc. signify see [visual conventions](#visual-conventions)

Networks contain a variety of objects (we call them ``network models''), including free-floating neurons and synapses, but also neuron arrays and weight matrices for array-based network, and a wide array of other more complex structures. Most objects can be linked to one another with different types of adapters. By combining these together you can create indefinitely many different kinds of networks. Many tools exist for organizing, arranging, training, and linking these objets together. Some of these objects have many subtypes, such as neurons (many kinds of neuron update rule). On this page we give general information about networks in Simbrain, and the sub-menus give more specific information for objects with subtypes.

TODO [point Mike to source code for this]:
- Neuron Groups: SOM, Competitive, WTA, etc.
- Synapse Rules: Long list.
- Synapse Groups [one page?]
- Training

# Main Object Types

<!-- TODO: Make this a list and move all detail here to subpages -->

## Free neurons and synapses

Free neurons and synapses are part of ``classic'' Simbrain, allowing networks of arbitrary topology to be organized together. Both Neurons or nodes and synpases or weights are associated with update rules.

Simbrain has two kinds of rules: activation-based neurons, and **spiking neurons**, and also allows the two to co-exist. Activation-based neurons are used in more traditional, connectionst types of application, which abstract from biological details, while spiking neurons are used in more biologically realistic simulations. Since spikes are discrete events without a numerical value, some way of converting them into numbers is required (e.g. when a spike arrives at a synapse). This is handled using **spike responders**. See [computational neuroscience].


[Add image] For details on what they represent see [visual conventions](#visual-conventions). 

## Neuron Groups, Synapse Groups, and Neuron Collections

Free neurons and weights can be aggregated in various ways but are rather adjusted *as a group*, typically by double clicking or right-clicking on a yellow interaction box. Shown here is a cortical bursting network, which is a single neuron group and recurrent synapse group. Brief information on the visualization is here.

Neuron collections are a lightweight alternative to neuron groups. They can overlap. They have a green interaction box. Create by selecting nodes and pressing shift-G.

In sum: neuron groups 
- contains neurons as children
- They have their own layout object
- Deleting deletes all neurons
- Subclasses like SOM, Competitive, have custom update

Neuron Collections:
- Neuron collections are loose associations mainly for labeling
- No custom update
- Deleting does not delete neurons
- Can overlap each other and neuron groups even in subnetworks


## Neuron Arrays and Weight matrices

An alterantive to free nodes and weights is neuron arrays and weight matrices, which  support array based operations, as is standard in modern neural networks. These are much faster and more conventional.

Neuron collections and groups can be linked to neuron arrays with weight matrices or synapse groups.

## Subnetworks

These are customized collections of neurons, synapses, and neuron groups and sometimes training algorithms.

## Connection Managers

These are rules that control how source and target neurons are linked together.

## Layout objects

These can be used to organized free nodes and weights

## Smile objects

Using the smile ML library.




