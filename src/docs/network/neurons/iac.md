---
title: IAC
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---


# IAC (Interactive Activation and Competition)

The IAC rule models neurons that participate in excitatory and inhibitory interactions, often used in psychological models of cognition and perception. It is based on the framework described in McClelland (1981), simulating gradual competitive activation dynamics within bounded ranges.

At each time step, the neuron's activation is updated by:

$$
\Delta a = \text{inputEffect} - \text{decay} \cdot (a - r)
$$

Where:

- $$a$$ is the current activation,
- $$r$$ is the resting value,
- $$\text{inputEffect}$$ is computed based on the sign of input:

$$
\text{inputEffect} =
\begin{cases}
(U - a) \cdot I, & \text{if } I \geq 0 \\
(a - L) \cdot I, & \text{if } I < 0
\end{cases}
$$

Here, $$I$$ is the input to the neuron, $$U$$ is the upper bound, and $$L$$ is the lower bound.

The neuron's activation is then adjusted by the total change, optional noise is added, and the result is clipped to stay within bounds.

## Parameters

- **Decay Rate**: Controls how quickly the activation returns toward the resting value in the absence of input.
- **Rest**: The baseline activation level toward which the neuron decays over time.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)



