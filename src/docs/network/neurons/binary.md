---
title: Binary
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 40
---

# Binary Neuron

<!-- Link to Relu when we have it -->
<!-- Link to weighted inputs in update logic -->

The binary activation function (also threshold or heavyside; and closely related to [ReLU](linear)) is a common type of activation function in neural networks. The activation level $$a$$ of a binary node is set to an upper value $$u$$ (set in the upper bound field) if the weighted input $$w$$ plus a bias term $$b$$ is greater than the threshold $$\theta$$, and a lower value $$l$$ (set in the lower bound field) otherwise:

$$
    a_k = f(n_k) =  \left\{
        \begin{array}{lc}
        \ell & {\rm if} \; w \leq \theta \\
        u  & {\rm if} \;  w > \theta
    \end{array} 
    \right.
$$

This type of activation function is also referred to as a threshold function, and these units are sometimes called "linear threshold units."

## Threshold

The threshold value $$\theta$$. Weighted inputs above this value cause the node to enter its on state. This provides a simple model of the voltage potential that real neuron membranes must exceed in order to fire an action potential.

## On Value

The upper value $$u$$ that occurs when the weighted input to node is above threshold.

## Off Value

The lower value $$l$$ that occurs when the weighted input to node is less than or equal to the threshold.

## Bias

A fixed amount of input to this node, denoted by *b* above.

