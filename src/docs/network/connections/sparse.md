---
title: Sparse
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 100
---

# Sparse

Creates a subset of all possible connections between source and target neurons, controlled by a density parameter.

## Dynamic Behavior

Unlike other connection strategies that create connections from scratch, Sparse preserves existing connections and makes incremental changes. When applied:

- If increasing density, new connections are added to existing ones
- If decreasing density, connections are randomly removed
- Existing connections are preserved when possible

For example, if you have 10% density and change to 20%, only the additional 10% of connections are created, not all 20%.

## Parameters

- **Connection density**: What percentage of total possible connections to create. For example, 0.1 creates 10% of possible connections, 0.5 creates 50%, and 1.0 creates all possible connections (equivalent to All-to-All).

- **Equalize efferents**: Whether each source neuron gets exactly the same number of outgoing connections. When enabled, every source neuron will have the same number of synapses emanating from them. For example, with 10 source neurons, 10 target neurons, and 50% density, each source neuron will connect to exactly 5 targets. When disabled, each source connects to approximately 5 targets on average, but some may have 3 and others 7.

- **Allow self connection**: Whether connections where the source and target are the same neuron are allowed. Only applicable if the source and target neuron sets overlap.

## Polarity Behavior

This strategy respects source neuron polarity automatically. The excitatory/inhibitory ratio setting controls the distribution of positive and negative weights for non-polar (Both polarity) neurons. Pre-polarized Excitatory and Inhibitory neurons always maintain their polarity.
