---
title: Softmax
layout: default
grand_parent: Networks
parent: Neuron Groups and Collections
has_children: false
nav_order: 80
---

# Softmax

The softmax activation function, which is often used for classification tasks and for well-known networks like large language models. It converts the weighted inputs to a group of nodes into a probability distribution over those nodes--that is, a set of values all of which are between 0 and 1 which sum to 1.   These activations are often interpreted as probabilities associated with a group of class labels. For example if a softmax layer of a network trained to recognize visual inputs has nodes for cat, dog, and raccoon, then the softmax activations might be .05, .9, and .05, indicating a 5% probability that the input pattern represents a cat, a 90% probability that it represents a dog, and a 5% that it represents a raccoon.

The formula for softmax is this:

$$
\begin{eqnarray}
f(n_i) &=& \frac{\exp\left(\frac{n_i}{T}\right)}{\sum_{j=1}^{K} \exp\left(\frac{n_j}{T}\right)}
\end{eqnarray}
$$

That is, for each neuron $$i$$ in the softmax layer, its weighted input $$n_i$$ is exponentiated, and these exponentiated values are normalized (the summation on the bottom, which shows why softmax requires knowledge of all nodes in a layer). $$T$$ is a temperature parameter discussed below. 

The exponentiation step increases the influence of larger input values, producing a more sharply peaked distribution.

## Parameters

- **Temperature**: A scaling parameter that controls how sharply peaked the softmax distribution is. 
  - When $$T=1$$ it is a default softmax function. 
  - When $$T>1$$ the softmax distribution becomes a more dispersed, "flatter" distribution, because more outcomes are possible. Think of a "hotter" more active system, doing slightly more random or reckless things. In classification tasks, this can be interpreted as less confidence about the classification. 
  - When $$0 < T < 1$$ the distribution becomes more predictable, and thus more sharply peaked. Think of a "cooler" distribution. In a classification task this can be interpreted as more confidence about the predictions.  

One application of temperature is to large language models, where turning the temperature up can encourage the system to produce less predictable responses and turning it down can lead it to rely more on its training data.



