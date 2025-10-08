---
title: GELU
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# GELU (Gaussian Error Linear Unit)

The GELU (Gaussian Error Linear Unit) is a smooth, non-linear activation function commonly used in modern deep learning architectures like transformers. It provides a differentiable alternative to ReLU that weights inputs by their magnitude rather than using a hard threshold.

The GELU function is defined as:

$$
a = \frac{x}{2} \left(1 + \tanh\left(\sqrt{\frac{2}{\pi}} \left(x + 0.044715 x^3\right)\right)\right)
$$

Where:

- $$x$$ is the input to the neuron,
- $$a$$ is the resulting activation.

The function smoothly interpolates between linear behavior for negative inputs and identity for positive inputs, with the transition controlled by the Gaussian cumulative distribution function. This provides better gradient flow than ReLU while maintaining computational efficiency.

GELU has no configurable parameters beyond the [common neuron properties](/docs/network/neurons/index#common-neuron-properties).
