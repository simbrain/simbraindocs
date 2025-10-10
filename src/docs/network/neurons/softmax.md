---
title: Softmax
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Softmax Rule

The softmax rule converts a vector of values (logits) into a probability distribution. It is primarily used in classification tasks where outputs represent class probabilities.

Softmax is only available for neuron arrays (matrix type). It cannot be applied to individual free neurons, as softmax requires knowledge of all inputs in a group to normalize them into a probability distribution. Attempting to apply it to free neurons will result in an error.

Note: There is also a [softmax group](../neurongroups/softmax) that provides an alternative way to achieve softmax behavior by applying softmax normalization after individual neuron updates. The group does not use this rule internally.

## Algorithm

For a layer with inputs $$x_1, x_2, \ldots, x_n$$ and biases $$b_1, b_2, \ldots, b_n$$, the softmax activation for neuron $$i$$ is:

$$
a_i = \frac{e^{(x_i + b_i - \max(x)) / T}}{\sum_{j=1}^{n} e^{(x_j + b_j - \max(x)) / T}}
$$

where:

- $$T$$ is the temperature parameter
- $$\max(x)$$ is used for numerical stability to prevent overflow

The output activations sum to 1 and lie in the range [0, 1], making them interpretable as probabilities.

## Temperature Parameter

The temperature parameter controls the "sharpness" of the probability distribution:

- **$$T > 1$$:** "Hotter" distribution, more uniform and chaotic. Higher temperatures flatten the distribution, making all options more equally likely.
- **$$T = 1$$:** Standard softmax with no temperature scaling.
- **$$0 < T < 1$$:** "Cooler" distribution, sharper and more peaked. Lower temperatures make the highest value dominate more strongly.

As temperature approaches 0, softmax approaches argmax (selecting only the maximum value). As temperature increases, the distribution becomes more uniform.

## Parameters

- **Temperature:** Controls the entropy of the output distribution. See the temperature section above for detailed explanation.

For all other parameters, see [common neuron properties](../neurons#common-neuron-properties).
