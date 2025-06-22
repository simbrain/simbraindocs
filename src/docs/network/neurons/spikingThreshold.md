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
- $$\theta$$ is the threshold parameter.

A spike is emitted (and stored in the neuron's spike flag) whenever this rule returns 1. This model does **not** include a refractory period or spike timing dynamics—each step is evaluated independently.

## Parameters

- **Threshold**: The input value at which the neuron spikes. If the total input (plus any noise) is greater than or equal to this value, the neuron activates.

For other adjustable properties like noise and sigmoid function type, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)
