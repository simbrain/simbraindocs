---
title: Logistic Generator
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 130
---

# Logistic

The **Logistic** rule is a chaotic activity generator based on the **logistic map**, a classic discrete-time dynamical system. It produces oscillating or chaotic activity depending on the growth rate. This rule is distinct from the logistic sigmoid function and is used to generate internal activity over time rather than compute a transfer function based on input.

The update equation is:

$$
y = \frac{a - L}{U - L} \\
y' = r \cdot y \cdot (1 - y) \\
a' = y' \cdot (U - L) + L
$$

Where:

- $$a$$ is the current activation,
- $$a'$$ is the next activation,
- $$r$$ is the growth rate,
- $$U$$ and $$L$$ are the upper and lower bounds.

When $$r$$ is between 3.6 and 4.0, the map exhibits chaotic behavior. Lower values lead to periodic or stable activity.

## Parameters

- **Growth Rate**: Controls the behavior of the system. Must be between 0 and 4. Higher values tend toward chaos.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)