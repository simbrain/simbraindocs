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

Unlike other connection strategies that create connections from scratch, Sparse preserves existing connections and makes incremental changes based on the current connection density. When applied:

- If the target density is higher than current density, new connections are added to reach the target
- If the target density is lower than current density, connections are randomly removed to reach the target
- If the target density equals current density, no changes are made
- Existing connections are always preserved when possible

This behavior allows you to incrementally adjust connection density. For example, if you have 10% density and apply Sparse with 20% density, only the additional 10% of connections are created, not all 20%. Running Sparse multiple times with the same density value will not change the network, which allows you to safely adjust upward from the current sparsity level without resetting existing connections.

## Parameters

- **Connection density**: What percentage of total possible connections to create. For example, 0.1 creates 10% of possible connections, 0.5 creates 50%, and 1.0 creates all possible connections (equivalent to All-to-All).

- **Equalize efferents**: Whether each source neuron gets exactly the same number of outgoing connections. When enabled, every source neuron will have the same number of synapses emanating from them. For example, with 10 source neurons, 10 target neurons, and 50% density, each source neuron will connect to exactly 5 targets. When disabled, each source connects to approximately 5 targets on average, but some may have 3 and others 7.

- **Allow self connection**: Whether connections where the source and target are the same neuron are allowed. Only applicable if the source and target neuron sets overlap.

- **Weight Initializer**: Determines how synapse strengths are set. See [Weight Initialization](../weightInitialization) for options.

## Polarity Behavior

This strategy respects source neuron polarity automatically. The excitatory/inhibitory ratio setting controls the distribution of positive and negative weights for non-polar (Both polarity) neurons. Pre-polarized Excitatory and Inhibitory neurons always maintain their polarity.
