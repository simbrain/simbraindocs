---
title: Connection Methods
layout: default
parent: Networks
has_children: true
nav_order: 70
---


# Connection Strategies

Connection strategies are rules used to create patterns of connections between source and target groups of neurons.

They can be invoked in these ways:

- There is a default strategy that is set in network preferences when using the 1-2 trick. 
- You can also right click and select one from the `connect neurons` submenu.
- Synapse groups are also associated with connection strategies that can be applied

## Types of Connection Strategies

### All-to-All

When a neuron group is self-connected, an All-to-All connection creates a synapse connection between every neuron so that each neuron is directly connected to the other neurons in the group. 

### One-to-One

When a group is connected to itself, a One-to-One connection type will connect each neuron to itself. 

### Radial (Simple)

This connection type connects neurons in succession from a starting point. This creates weights in a directed manner and activation radiates outward from the starting point or initial site of activation. This type of radial connection is termed “simple” as it is the most basic radial pattern of activation.

### Radial

This connection type is like the Radial (Simple) type, but with more variations in how synapses radiate outward. This pattern is less predictable the the simple model.

### Sparse

This connection type creates synapse connections in such a way that not all neurons are connected to each other, hence the connections produced are “sparse” as opposed to complete (i.e like in All-to-All). Unlike in radial connections, where neurons also aren’t completely connected, sparse connections do not follow a particular pattern of activation. 

