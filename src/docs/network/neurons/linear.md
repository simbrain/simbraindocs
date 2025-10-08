---
title: Linear
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Linear

The Linear rule computes a neuron's activation by scaling its input with a constant slope, optionally adding noise and applying a clipping method. This rule is commonly used in simple neural models and serves as a base for other activation types.

The basic update rule is:

$$
a = \text{slope} \cdot x
$$

Where:

- $$a$$ is the neuron's activation,
- $$x$$ is the total input,
- The slope scales the response.

Different clipping types determine how this result is transformed:

- No Clipping: $$a = \text{slope} \cdot x$$
- Relu: $$a = \max(0, \text{slope} \cdot x)$$
- Piecewise Linear: 
  $$
  a = \min(\text{upperBound}, \max(\text{lowerBound}, \text{slope} \cdot x))
  $$

Noise can optionally be added to the activation before clipping.

## Parameters

- **Slope**: The multiplier applied to the neuron's input to compute its activation.
- **Type**: The clipping strategy applied to the activation. Options are:
  - No Clipping
  - Piecewise Linear
  - ReLU
  
For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)
