---
title: Kuramoto
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 110
---


# Kuramoto

The **Kuramoto** update rule implements a phase-coupled oscillator model inspired by the Kuramoto model of synchronization. Each neuron's activation is treated as a phase angle $$\theta$$, which evolves over time based on the phase differences between itself and its input neurons.

At each time step, the neuron computes:

$$
\theta' = \theta + \Delta t \cdot \left( \omega + \frac{1}{N} \sum_j K_j \sin(\theta_j - \theta) \right)
$$

Where:

- $$\theta$$ is the neuron's current phase (activation).
- $$\omega$$ is the neuron's natural frequency.
- $$K_j$$ is the strength of synapse $$j$$.
- $$\theta_j$$ is the phase of presynaptic neuron $$j$$.
- $$N$$ is the number of input synapses.
- $$\Delta t$$ is the simulation time step.

The updated phase is then wrapped into the interval $$[0, 2\pi]$$.

This rule models synchronization phenomena and can be used to simulate coupled oscillators, rhythmic behavior, and collective entrainment in neural networks.

## Parameters

- **Natural Frequency**: The constant intrinsic rotation speed $$\omega$$ of the oscillator.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)


