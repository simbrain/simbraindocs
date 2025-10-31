---
title: Weight Initialization
layout: default
parent: Networks
nav_order: 75
---

# Weight Initialization

When creating connections between neurons, understanding how weights get their initial values helps you manage and adjust them effectively. This page explains how [connection strategies](connections/) and the [synapse adjustment dialog](synapses/synapseAdjustment) work together.

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

## Workflow Summary

The typical workflow for managing weights:

1. Create connections using a connection strategy, which sets the excitatory/inhibitory ratio
2. If the strategy sets fixed values, use the synapse adjustment dialog's randomizer tab to apply a distribution
3. To adjust weights while preserving the ratio, select excitatory or inhibitory in the statistics panel dropdown
4. Use the scaler to proportionally adjust all weights, or the perturber to add noise while maintaining structure
