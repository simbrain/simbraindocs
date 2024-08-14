---
title: Subnetworks
layout: default
parent: Networks
has_children: true
nav_order: 61
---

# Subnetworks

<!-- TODO: Link to neuron collections -->

Subnetworks are a special kind of network model that can encompass multiple [neuron groups](../neurongroups), [synapse groups](../synapsegroups.html), neuron collections and custom update rules.

<!-- TODO: Add image -->

For more information on specific types of subnetwork click on the items in the menu on the right.

Note! The input nodes of many subnetworks are, by default, **clamped**. This is to make it easier to manually set and test their values. However, if you want to connect other neurons to the input nodes of a subnetwork you should unclamp the input neurons.