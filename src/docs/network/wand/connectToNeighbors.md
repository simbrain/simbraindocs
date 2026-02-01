---
title: Connect to Neighbors
layout: default
parent: Wand Tool
grand_parent: Networks
has_children: false
---

# Connect to Neighbors Action

Creates synapses from each touched neuron to other neurons within a specified radius. This provides a quick way to build local connectivity patterns by painting over neurons.

The action uses a configurable [connection strategy](../connections/) to determine which synapses to create and how to initialize their weights. Different strategies allow for different patterns of local connectivity.

# Parameters

## Connection Strategy

The connection strategy determines which synapses to create and how to initialize their weights. See the [connection strategies](../connections/) documentation for more details on each type.

## Radius

The distance within which to search for neighboring neurons to connect to. Neurons within this radius of the touched neuron become potential connection targets (subject to the connection strategy).

For [common properties](.#common-properties) like Letter, Color, and Radius, see the main wand tool page.

# Using Connect to Neighbors

1. Select the Connect to Neighbors action in the wand palette
2. Activate wand mode if not already active
3. Paint over neurons to create connections from each touched neuron to its neighbors
4. The radius parameter determines how far away neighbors can be

