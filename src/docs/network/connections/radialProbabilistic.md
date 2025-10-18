---
title: Radial Probabilistic
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 80
---

# Radial Probabilistic

Creates connections within specified radii using probability-based selection. For each source neuron, the strategy considers every target neuron within the excitatory and inhibitory radii and makes connections according to specified probabilities. This allows excitatory and inhibitory connections (those based on [polarity](../neurons/#polarity)) to have different spatial extents and densities.

## Parameters

- **Exc. probability**: Probability that connections will be made to neighboring excitatory (or non-polar) neurons found within the excitatory radius.

- **Inh. probability**: Probability that connections will be made to neighboring inhibitory neurons found within the inhibitory radius.

- **Exc. radius**: Distance to search for excitatory neurons to connect to (in pixels).

- **Inh. radius**: Distance to search for inhibitory neurons to connect to (in pixels).

- **Allow self connections**: Whether synapses from neurons to themselves are allowed.
