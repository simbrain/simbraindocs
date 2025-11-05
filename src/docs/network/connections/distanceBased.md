---
title: Distance Based
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 20
---

# Distance Based

Creates synapses between neurons with a probability that depends on their spatial distance. The connection probability is determined by a [decay function](../../utilities/decayFunctions) that takes the Euclidean distance between neurons as input.

## Parameters

- **Distance function**: The [decay function](../../utilities/decayFunctions) that determines connection probability based on distance. This is a configurable probability distribution that controls how connection probability decreases as distance increases. Available options include Gaussian, Linear, and Step decay functions. Each decay function has its own parameters such as peak distance and dispersion (the effective range of the function).

## Polarity Behavior

This strategy respects source neuron polarity automatically. The excitatory/inhibitory ratio setting controls the distribution of positive and negative weights for non-polar (Both polarity) neurons. Pre-polarized Excitatory and Inhibitory neurons always maintain their polarity.
