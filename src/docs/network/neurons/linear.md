---
title: Linear
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 120
---

# Linear Neuron

This is a standard type of neuron where the activation *a* is a linear function of the weighted inputs $$w$$ plus a bias term *b*, with *m* representing the slope:

$$ a = m(W + b) $$

This rule is flexible, and different activation behaviors can be achieved using the clipping type described below.

## Clipping Type

There are three clipping types that determine how the activation function behaves:

- **No Clipping**: A pure linear function. No limits are placed on the output.
- **Relu**: The Rectified Linear Unit, clips values below 0 to 0. 

$$
  a = \max(0, m(W + b))
$$

- **Piecewise Linear**: Clips the output between a lower and upper bound. To approximate sigmoid-like behavior, choose `Piecewise Linear` and set appropriate bounds.

## Slope

The slope *m* scales the weighted inputs plus the bias *b*. Setting slope to 1.0 and bias to 0 results in the node passing on its input unchanged.

This is commonly used in [input and output nodes](../../workspace/couplings.html).

## Bias

A fixed amount of input to this node, denoted by *b* in the activation equation.

- To set a horizontal intercept of *h*, set *b = -h*.
- To set a vertical intercept of *v*, set *b = v/m*.

## Bounds

Only used if the clipping type is set to *Piecewise Linear*.

- Upper Bound: Maximum allowed value of activation.
- Lower Bound: Minimum allowed value of activation.

These values are ignored in Relu and No Clipping modes (except in UI controls like increment/decrement).

## Add Noise

When this is enabled, random noise (from a specified distribution) is added to the output *after* applying the linear transformation and clipping. This is useful for adding variability to the neuron's response.

For more information on the noise generator, click [here](../../utilities/randomizers.html).
