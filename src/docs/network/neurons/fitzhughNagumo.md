---
title: Fitzhugh Nagumo
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---


# FitzHugh-Nagumo

The FitzHugh-Nagumo rule is a two-variable spiking neuron model that captures the basic dynamics of an action potential. It models a neuron's voltage and a recovery variable, producing realistic spike-like behavior.

The neuron's state is described by two coupled differential equations:

$$
\frac{dv}{dt} = v - \frac{v^3}{3} - w + I \\
\frac{dw}{dt} = a(bv + 0.7 - c w)
$$

Where:

- $$v$$ is the membrane potential (activation).
- $$w$$ is a recovery variable.
- $$I$$ is total input: external input, background current, and optional noise.
- $$a, b, c$$ are model parameters controlling the shape and timing of spikes.
- A spike is recorded when $$v \geq \text{threshold}$$.

The rule models oscillatory behavior, rest states, and excitability, and is commonly used in computational neuroscience to simulate spiking behavior without the complexity of full Hodgkin-Huxley dynamics.

## Parameters

- **A (Recovery Rate)**: Controls how strongly the recovery variable responds to changes in voltage.
- **B (Rec. Voltage Dependence)**: Scales how much voltage affects the recovery dynamics.
- **C (Rec. Self Dependence)**: Determines how quickly the recovery variable returns to baseline.
- **Spike Threshold**: If the voltage exceeds this value, the neuron is considered to have spiked.
- **Background Current**: Constant input current applied to the neuron.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)