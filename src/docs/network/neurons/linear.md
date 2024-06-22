---
title: Linear
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 80
---

# Linear Neuron

This is a common type of activation function in neural networks. The activation level *a* of this type of node is a linear function of **weighted inputs** *W* plus a bias term *b*, with *m* representing the slope:

<!-- TODO --> Add equation

A piecewise linear function resembling a sigmoidal function can be created by making use of clipping (see below).

If slope is set to 1 and bias to 0, linear neurons simply pass on their weighted inputs. This is especially useful for [input and output nodes](../../workspace/couplings.html).

To set the horizontal or vertical intercept to some specific value see the bias term below.

## Slope

The slope of the linear activation function, denoted *m* above. The slope scales the value of the **weighted inputs** plus the bias *b*.

## Bias

A fixed amount of input to this node, denoted by *b* above.

- To set the horizontal intercept to a value *h* set *b* = -*h*.
- To set the vertical intercept to a value *v* set *b* = *v/m*.

## Add Noise

If this is set to true, random values are added to the activation via a noise generator. The random values are added after the linear activation function is applied. For details of how the noise generator works, click [**here**](../../utilities/randomizers.html).
