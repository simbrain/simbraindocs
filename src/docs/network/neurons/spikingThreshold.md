---
title: Spiking Threshold
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 200
---

# Spiking Threshold Neuron

The **Spiking Threshold** neuron is a simple binary spiking unit. It emits a spike when its total input exceeds a specified threshold. When this condition is met, the neuron's activation becomes 1; otherwise, it remains at 0. This makes it ideal for use in discrete-time spiking models or networks where binary spiking behavior is desired.

This model optionally supports stochastic noise, which is added to the input before comparison with the threshold. The default noise generator uses a uniform distribution, but this can be customized to use any [Probability Distribution](/docs/utilities/randomizers).

This neuron behaves according to the rule:

$$
\text{activation} =
\begin{cases}
1, & \text{if } x + \eta \geq \theta \\
0, & \text{otherwise}
\end{cases}
$$

where:
- $$x$$ is the neuron's weighted input,
- $$\eta$$ is random noise (if enabled),
- $$\theta$$ is the **threshold** parameter.

A spike is emitted (and stored in the neuron's spike flag) whenever this rule returns 1. This model does **not** include a refractory period or spike timing dynamics—each step is evaluated independently.

This neuron is ideal for:
- Building simple spiking networks with threshold-based behavior
- Modeling neurons that exhibit **all-or-none** responses
- Simulations where **binary spike events** are sufficient


## Parameters

### Threshold

Specifies the **minimum input value** required for the neuron to spike. If the weighted sum of inputs (plus noise, if enabled) is greater than or equal to this value, the neuron activates with a spike.

### Add Noise

If enabled, **random noise** is added to the input before comparison with the threshold. This noise is sampled from a [Probability Distribution](/docs/utilities/randomizers), allowing for exploration of stochastic spiking behavior.
