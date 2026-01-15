---
title: Weight Initialization
layout: default
parent: Networks
nav_order: 95
---

# Weight Initialization

Simbrain uses two different systems for initializing connection weights, depending on what you're connecting.

Note: This page covers weight initialization for free synapses and synapse groups. For weight initialization in weight matrices and trainers (Xavier, He, LeCun initialization), see [Neuron Arrays and Weight Matrices](arraysMatrices#weight-matrix-initialization).

## Free Synapses and Synapse Groups

Free synapses (individual connections between neurons) and synapse groups use a two-stage process:

1. **[Connection Strategies](connections/)**: Determine which neurons to connect based on topology (all-to-all, sparse, distance-based, etc.)
2. **Weight Initializers**: Set the initial strength values for those connections

This separation allows independent control of network topology and weight values.

### Weight Initializer Types

After a connection strategy creates synapses, a weight initializer sets their strengths. Each [connection strategy](connections/) has a Weight Initializer parameter that can be configured. Three types are available:

### Constant

Sets all excitatory synapses to a fixed positive value and all inhibitory synapses to a fixed negative value. This is the simplest option and useful when you want uniform connection strengths.

- **Excitatory Strength**: The strength value for all excitatory synapses (default 1.0)
- **Inhibitory Strength**: The strength value for all inhibitory synapses (default -1.0)

Use constant initialization when you want simple, uniform connection strengths or plan to adjust weights later through learning rules or manual editing.

### Random

Initializes synapse weights using probability distributions, allowing for variability in connection strengths.

- **Randomize Excitatory**: Whether to randomize excitatory connection strengths. When disabled, uses the default excitatory strength (1.0)
- **Randomize Inhibitory**: Whether to randomize inhibitory connection strengths. When disabled, uses the default inhibitory strength (-1.0)
- **Excitatory Randomizer**: The [probability distribution](../utilities/randomizers) used to generate excitatory weight values
- **Inhibitory Randomizer**: The [probability distribution](../utilities/randomizers) used to generate inhibitory weight values

Common distributions include Normal (Gaussian), Uniform, and Exponential. The absolute value of sampled values is used to ensure correct polarity. Use random initialization when you want variability in connection strengths to model biological diversity or avoid symmetries that might affect learning dynamics.

### Distance-Based

Scales synapse weights based on the spatial distance between source and target neurons. Closer neurons receive stronger connections.

- **Decay Function**: The [decay function](../utilities/decayFunctions) that determines how weight strength decreases with distance
- **Base Strength**: The maximum weight strength at the peak distance (typically distance 0)

For each synapse, the final weight is calculated as: `weight = baseStrength × decayFunction(distance)`. Common decay functions include Gaussian (smooth drop-off), Linear (linear decrease), and Step (constant within radius). Use distance-based initialization when modeling spatially organized networks where nearby neurons should have stronger influence.

### Polarity and Weight Initialization

All weight initializers respect source neuron [polarity](neurons/#polarity):

- Excitatory neurons always produce positive weights
- Inhibitory neurons always produce negative weights
- Non-polar neurons can produce either, controlled by the [excitatory/inhibitory ratio](connections/#excitatoryinhibitory-ratio)

The non-polar mode is most common and what you'll typically work with.

After creating connections, use the [synapse adjustment dialog](synapses/synapseAdjustment) to modify weights while preserving polarity.

Free synapses are more flexible and can implement computational neuroscience ideas. Machine learning algorithms like backprop can be used on them, but they are generally slower than weight matrices.

## Weight Matrices

Weight matrices (connections between neuron arrays or neuron groups) do not use polarity. They are standard linear algebra matrices. They are:

- Initialized using probability distributions (Gaussian, Uniform, etc.)
- Can have arbitrary positive and negative values
- Use the [weight matrix histogram dialog](arraysMatrices#weight-matrix-histogram-dialog) for initialization
- Support machine learning initialization strategies (Xavier, He, LeCun)

Right-click a weight matrix and select `Show weight matrix histogram...` to access initialization tools. See [Arrays and Matrices](arraysMatrices#weight-matrix-initialization) for details.


