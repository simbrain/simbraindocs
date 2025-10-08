---
title: Stochastic Generator
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Stochastic

The Stochastic rule is a simple spiking activity generator that fires based on a fixed probability. At each time step, the neuron independently samples a random value to determine whether it spikes. This rule can be used to simulate spontaneous spiking activity or probabilistic inputs to a network.

The update behavior is defined as:

$$
P(\text{spike}) = p \\
a =
\begin{cases}
1.0, & \text{if spiked} \\
0.0, & \text{otherwise}
\end{cases}
$$

Where:

- $$p$$ is the firing probability (between 0 and 1),
- $$a$$ is the neuron's activation,
- A spike is recorded if a randomly drawn number is less than $$p$$.

This rule produces binary output and should be used with spiking neuron networks or event-driven simulations.

## Parameters

- **Firing Probability**: The probability that the neuron will spike (i.e., emit an activation of 1.0) at each time step.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)