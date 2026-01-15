---
title: Distance Based
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 20
---

# Distance Based

Creates connections probabilistically based on the spatial distance between neurons, using configurable [decay functions](../../utilities/decayFunctions).

## Modes

Distance Based operates in two modes:

### Standard Mode

Uses a single decay function for all connections. The probability of making a connection between neurons decreases as their distance increases, according to the selected decay function.

### Polarity Mode

Uses separate decay functions for each polarity combination (Excitatory→Excitatory, Excitatory→Inhibitory, Inhibitory→Excitatory, Inhibitory→Inhibitory, and non-polar). This allows fine-grained control over connection patterns based on neuron types.

## Parameters

- **Use Polarity Mode**: When enabled, uses separate decay functions for each polarity combination. When disabled, uses a single decay function for all connections.

- **Decay Function**: The [decay function](../../utilities/decayFunctions) used for all connections in standard mode. Available options include Gaussian, Linear, and Step decay functions. Each has its own parameters such as peak distance and dispersion.

- **Exc → Exc**: Decay function for excitatory to excitatory connections (polarity mode only).

- **Exc → Inh**: Decay function for excitatory to inhibitory connections (polarity mode only).

- **Inh → Exc**: Decay function for inhibitory to excitatory connections (polarity mode only).

- **Inh → Inh**: Decay function for inhibitory to inhibitory connections (polarity mode only).

- **Non-polar**: Decay function for connections involving non-polar neurons (polarity mode only).

- **Allow Self Connections**: Whether synapses from neurons to themselves are allowed.

## Decay Functions

Each decay function determines how connection probability changes with distance. Common options:

- **[Gaussian Decay](../../utilities/decayFunctions#gaussian-decay-function)**: Smooth probability drop-off, good for modeling biological connectivity
- **[Step Decay](../../utilities/decayFunctions#step-decay-function)**: Fixed probability within a radius, zero beyond
- **[Linear Decay](../../utilities/decayFunctions#linear-decay-function)**: Linear probability decrease with distance

Each decay function has a base multiplier parameter that scales the overall connection probability.

## Polarity Behavior

In standard mode, this strategy respects source neuron polarity automatically. The excitatory/inhibitory ratio setting controls the distribution of positive and negative weights for nonpolar neurons.

In polarity mode, neuron polarity affects both connection topology and weight signs. The strategy uses different decay functions based on source and target neuron polarity, allowing you to create networks where, for example, connections from excitatory neurons are long-range while connections from inhibitory neurons are local.
