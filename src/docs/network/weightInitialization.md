---
title: Weight Initialization
layout: default
parent: Networks
nav_order: 75
---

# Weight Initialization

Simbrain uses two  different systems for initializing connection weights, depending on what you're connecting.

## Free Synapses and Synapse Groups

Free synapses (individual connections between neurons) and synapse groups use [connection strategies](connections/) that respect source neuron [polarity](neurons/#polarity):

- Excitatory neurons always produce positive weights
- Inhibitory neurons always produce negative weights  
- Non polar. Neurons can produce positive or negative weights. Works with the excitatory/inhibitory ratio setting

The non-polar mode is generally more common and what you'll work within.

After creating connections, use the [synapse adjustment dialog](synapses/synapseAdjustment) to modify weights while preserving polarity. See [Connection Strategies](connections/) for details on how different strategies initialize weights.

Free synapses are more flexible and can implement computational neuroscience ideas, and also machine learning algorithsm like backprop can be used on them, but they are generally slower than weight matrices.

## Weight Matrices

Weight matrices (connections between neuron arrays or neuron groups) do not use polarity. They are standard linear algebra matrices. They are:

- Initialized using probability distributions (Gaussian, Uniform, etc.)
- Can have arbitrary positive and negative values
- Use the [weight matrix histogram dialog](arraysMatrices#weight-matrix-histogram-dialog) for initialization
- Support machine learning initialization strategies (Xavier, He, LeCun)

Right-click a weight matrix and select `Show weight matrix histogram...` to access initialization tools. See [Arrays and Matrices](arraysMatrices#weight-matrix-initialization) for details.


