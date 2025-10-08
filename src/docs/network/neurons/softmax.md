---
title: Softmax
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Softmax

The Softmax rule converts a vector of values (logits) into a probability distribution. It is primarily used in classification tasks.

Softmax is only available for neuron arrays (matrix type). It cannot be applied to individual free neurons. Attempting to do so will result in an error. This is because softmax requires knowledge of all inputs in a group to normalize them into a probability distribution.

For a layer with inputs $$x_1, x_2, \ldots, x_n$$ and biases $$b_1, b_2, \ldots, b_n$$, the softmax activation for neuron $$i$$ is:

$$
a_i = \frac{e^{(x_i + b_i - \max(x)) / T}}{\sum_{j=1}^{n} e^{(x_j + b_j - \max(x)) / T}}
$$

Where:

- $$T$$ is the temperature parameter,
- $$\max(x)$$ is used for numerical stability to prevent overflow.

The temperature parameter controls the "sharpness" of the probability distribution:

- $$T > 1$$: "Hotter" distribution, more uniform and chaotic
- $$T = 1$$: Standard softmax
- $$0 < T < 1$$: "Cooler" distribution, sharper and more peaked

The output activations sum to 1 and lie in the range [0, 1], making them interpretable as probabilities.

## Parameters

- **Temperature**: Controls the entropy of the output distribution. Higher values flatten the distribution, while lower values make it more peaked.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties).
