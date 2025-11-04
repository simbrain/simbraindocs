---
title: Weight Initialization
layout: default
parent: Networks
nav_order: 75
---

# Weight Initialization

When creating connections between neurons, understanding how weights get their initial values helps you manage and adjust them effectively. This page explains how [connection strategies](connections/) and weight adjustment tools work together for both free synapses and [weight matrices](arraysMatrices).

## How Weights Are Initialized

Connection strategies create weights in three steps:

1. Connections are created with initial strengths (typically 1.0)
2. The excitatory/inhibitory ratio is applied, setting weights to 1 or -1
3. If the strategy uses randomizers, probability distributions are applied

Most connection strategies follow this pattern, setting weights to fixed values (1 or -1) based on the excitatory/inhibitory ratio. A few strategies apply probability distributions during connection creation.

## Strategies That Set Fixed Values

Most connection strategies initialize weights to 1 or -1:

- [All to All](connections/allToAll)
- [One to One](connections/oneToOne)
- [Sparse](connections/sparse)
- [Distance Based](connections/distanceBased)
- [Radial Gaussian](connections/radialGaussian)

For these strategies, use the [synapse adjustment dialog](synapses/synapseAdjustment) to apply probability distributions to the weights. The dialog's randomizer tab is the primary way to set weight distributions after connections are created.

## Strategies That Apply Distributions

Some connection strategies apply probability distributions during connection creation:

- [Fixed Degree](connections/fixedDegree) uses the excitatory randomizer to set initial weight values
- [Radial Probabilistic](connections/radialProbabilistic) uses both excitatory and inhibitory randomizers with spatial constraints

For these strategies, weights already have a distribution applied. You can still use the synapse adjustment dialog to modify them, but the randomizer tab will replace the original distribution. The scaler and perturber tabs can modify weights while preserving relative patterns.

## Preserving Excitatory/Inhibitory Ratios

When adjusting weights, you often want to preserve the excitatory/inhibitory ratio. To do this, use the dropdown in the statistics panel of the synapse adjustment dialog to select either excitatory or inhibitory, then modify each population separately. Using the both option will break the ratio.

For synapse groups, you can reapply the connection strategy from the synapse group dialog's connection strategy tab. This recreates connections from scratch using the current strategy parameters.

## Weight Matrix Initialization

[Weight matrices](arraysMatrices) connecting neuron arrays or neuron groups have their own initialization tools optimized for machine learning workflows:

### Quick Randomization

Right-click menu options provide fast randomization:
- **Randomize selection** (R): Uses the [default weight randomizer](ui/networkPreferences#randomizers) from network preferences
- **Randomize symmetric**: Creates symmetric matrices using the default weight randomizer, useful for recurrent networks

Both options apply the weight randomizer configured in `File > Network Preferences > Randomizers > Weight randomizer`. This randomizer can produce both positive and negative values, potentially changing weight polarity.

### Weight Matrix Histogram Dialog

For more sophisticated initialization, use the [weight matrix histogram dialog](arraysMatrices#weight-matrix-histogram-dialog):

1. Right-click a weight matrix and select `Show weight matrix histogram...`
2. View the current weight distribution and statistics
3. Select an initialization strategy:
   - **Random Initialization**: Apply any probability distribution
   - **[Xavier](https://proceedings.mlr.press/v9/glorot10a.html)**: Maintains activation variance across layers, works well for sigmoid and tanh activations
   - **[He](https://arxiv.org/abs/1502.01852)**: Optimized for ReLU activations
   - **LeCun**: Classic initialization method, designed for SELU activations
4. Click Apply to reinitialize the matrix

The histogram updates in real-time, allowing you to experiment with different strategies and see their effects immediately. This is particularly useful when setting up networks for machine learning tasks, where proper weight initialization significantly impacts training performance.

These are the same initialization strategies used in [supervised learning](learning/supervisedLearning). For more details on each strategy, see [Training Parameters](learning/trainingParameters#weight-initialization-strategy).

## Workflow Summary

### For Free Synapses

The typical workflow for managing free synapse weights:

1. Create connections using a connection strategy, which sets the excitatory/inhibitory ratio
2. If the strategy sets fixed values, use the [synapse adjustment dialog](synapses/synapseAdjustment) randomizer tab to apply a distribution
3. To adjust weights while preserving the ratio, select excitatory or inhibitory in the statistics panel dropdown
4. Use the scaler to proportionally adjust all weights, or the perturber to add noise while maintaining structure

### For Weight Matrices

The typical workflow for managing weight matrix values:

1. Create weight matrices by connecting neuron arrays or neuron groups
2. For quick randomization, use `Randomize selection` or `Randomize symmetric` from the right-click menu
3. For machine learning applications, use the weight matrix histogram dialog to apply specialized initialization strategies (Xavier, He, LeCun)
4. Monitor the histogram to verify the weight distribution matches your needs
