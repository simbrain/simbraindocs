---
title: Random Generator
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 170
---

# Random

The **Random** rule is an activity generator that assigns a new random activation value to the neuron at each time step. Values are sampled from a specified probability distribution, typically uniform by default. This rule is useful for producing stochastic inputs or modeling spontaneous fluctuations in neural activity.

At each step:

$$
a_t = \text{sample}(\mathcal{D})
$$

Where:

- $$a_t$$ is the neuron's activation at time $$t$$,
- $$\mathcal{D}$$ is the selected probability distribution (e.g., uniform, Gaussian).

This generator produces uncorrelated outputs across time steps, and it ignores all incoming input. It can be clipped if needed using the inherited clipping interface.

## Parameters

- **Noise Generator**: A probability distribution used to sample random values.

Random activity generators produce a random value at each update over time; they have their activation set by noise generators. For details how the noise generator works, click **[here](/docs/utilities/randomizers)**.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)
