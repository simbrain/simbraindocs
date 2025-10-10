---
title: Fixed Degree
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 30
---

# Fixed Degree

Creates a fixed number of connections to or from each neuron. For each neuron, the strategy randomly selects a fixed number of target neurons to connect with. An optional radius constraint can limit connections to spatially nearby neurons.

## Parameters

- **Degree**: The number of connections allowed to or from each neuron.

- **Indegree / outdegree**: Determines the direction of connection counting. If set to Indegree, the fixed number of connections are made inward to each neuron (connections sent in to each neuron). If set to Outdegree, the fixed number of connections radiate out from each neuron.

- **Use radius**: If true, only connect within a specified radius. When enabled, the Radius parameter becomes available.

- **Radius**: Distance within which to make connections (in pixels). Only visible when Use radius is enabled.

- **Allow self connections**: Whether synapses from neurons to themselves are allowed.