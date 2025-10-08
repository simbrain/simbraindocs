---
title: Three Value
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Three Value

The Three Value rule extends the behavior of a binary neuron by allowing three distinct activation states. A neuron's activation is determined by comparing its input (plus a fixed bias) to two thresholds:

$$
x = \text{input} + \text{bias}
$$

The neuron's output is then:

$$
a =
\begin{cases}
\text{Lower Value}, & x < \text{Lower Threshold} \\
\text{Upper Value}, & x > \text{Upper Threshold} \\
\text{Middle Value}, & \text{otherwise}
\end{cases}
$$

This rule allows for a ternary decision model useful in systems requiring an explicit "neutral" or "no response" state between excitatory and inhibitory thresholds.

## Parameters

- **Bias**: A constant value added to the input before threshold comparisons.
- **Lower Threshold**: If the input plus bias is less than this value, the activation is set to the lower value.
- **Upper Threshold**: If the input plus bias is greater than this value, the activation is set to the upper value.
- **Lower Value**: The activation value when input is below the lower threshold.
- **Middle Value**: The activation value when input falls between the two thresholds.
- **Upper Value**: The activation value when input exceeds the upper threshold.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)