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

## Polarity Behavior

Radial Probabilistic uses neuron polarity to control connection parameters, not just weight signs. The strategy uses separate probability and radius parameters for excitatory and inhibitory connections, allowing you to create different spatial connectivity patterns for each type.

This means:
- The excitatory/inhibitory ratio setting is ignored (the separate exc/inh probabilities and radii control the balance)
- Neurons can be pre-polarized to use different spatial parameters
- You can configure inhibitory connections to be local (small radius) and excitatory connections to be more distant (large radius)
- Weight signs automatically follow source neuron polarity

For non-polar neurons, the Exc. probability and Exc. radius parameters are used.
