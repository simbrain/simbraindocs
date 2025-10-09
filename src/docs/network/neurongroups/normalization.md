---
title: Normalization Group
layout: default
grand_parent: Networks
parent: Neuron Groups and Collections
has_children: false
nav_order: 60
---

# Normalization Group

The Normalization Group normalizes the activations of its neurons so they sum to 1.0, effectively creating a probability distribution over the group's neurons. This is similar to softmax but without the exponentiation step.

At each time step:

1. Each neuron accumulates and updates its inputs using its own update rule.
2. The sum of all neuron activations is calculated.
3. Each neuron's activation is divided by the total, normalizing them.
4. If the total is zero, all neurons are set to equal values (1/n where n is the number of neurons).

This normalization ensures that the activations always sum to 1.0, making them interpretable as proportions or probabilities. Unlike softmax, which amplifies differences through exponentiation, normalization maintains the relative proportions of the raw activations.

## Parameters

The Normalization Group has no specific parameters beyond the standard neuron group settings. The normalization operation is applied automatically during each update.

## Use Cases

- Creating probability distributions without the sharpening effect of softmax
- Maintaining proportional relationships between neuron activations
- Ensuring activations sum to a fixed total for downstream processing

