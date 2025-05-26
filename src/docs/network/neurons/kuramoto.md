---
title: Kuramoto
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 110
---

# Kuramoto Neuron

The Kuramoto neuron is based on the [Kuramoto model](https://en.wikipedia.org/wiki/Kuramoto_model), which describes a system of coupled oscillators with varying natural frequencies. In the neural context, it models each neuron's phase as a point on a circle (from 0 to $$2\pi$$) and updates that phase based on the difference between its current phase and the phases of its input neurons.

Each neuron's phase $$\theta$$ evolves over time as a function of its intrinsic frequency and the sine of phase differences with its neighbors. This creates synchronized behavior under certain coupling conditions and is useful in modeling biological oscillations, such as those seen in central pattern generators or circadian rhythms.

The update rule is governed by:

$$
\frac{d\theta_i}{dt} = \omega_i + \frac{1}{N} \sum_{j} K_{ij} \sin(\theta_j - \theta_i)
$$

where:
- $$\theta_i$$ is the current phase of neuron $$i$$,
- $$\omega_i$$ is its natural frequency,
- $$K_{ij}$$ is the synaptic strength from neuron $$j$$ to $$i$$,
- $$N$$ is the number of input neurons.

At each update, the neuron's phase is incremented by the computed derivative and wrapped back to the $$[0, 2\pi)$$ range.

This neuron is ideal for:
- Modeling synchronization phenomena
- Exploring phase-coupled oscillations
- Simulating networks with periodic behavior

# Parameters

- **Natural Frequency**: TODO

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)

