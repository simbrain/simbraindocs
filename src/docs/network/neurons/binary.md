---
title: Binary
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Binary Neuron

<!-- Link to Relu when we have it -->
<!-- Link to weighted inputs in update logic -->

The Binary rule models a neuron that switches between two discrete values based on a threshold comparison. This is a hard-threshold activation function commonly used in early neural models and logic-based systems.

At each time step, the neuron's input is compared to a threshold:

$$
a =
\begin{cases}
\text{upperBound}, & \text{if } x > \text{threshold} \\
\text{lowerBound}, & \text{otherwise}
\end{cases}
$$

Where:

- $$x$$ is the input to the neuron,
- $$a$$ is the resulting activation.

This rule is often used for binary classification, digital logic emulation, and models where sharp decision boundaries are needed.

## Parameters

- **Threshold**: The input value above which the neuron fires (i.e., switches to the upper bound).

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)