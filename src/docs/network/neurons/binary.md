---
title: Binary
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 20
---

# Binary Neuron

This is a common type of activation function in neural networks. The activation level *a* of a binary node is set to an upper value *u* (set in the **upper bound field**) if the **weighted input** *W* plus a bias term *b* is greater than the threshold θ, and a lower value *l* (set in the **lower bound field**) otherwise:

<!-- TODO --> Add equation

This type of activation function is also referred to as a threshold function, and these units are sometimes called "linear threshold units."

## Threshold

The value, denoted by θ above. This provides a simple model of the voltage potential that real neuron membranes must exceed in order to fire an action potential.

## On Value

The value that turns on neuron.

## Off Value

The value that turns off neuron.

## Bias

A fixed amount of input to this node, denoted by *b* above.

