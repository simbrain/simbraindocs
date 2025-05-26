---
title: Kuramoto
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 110
---

# Kuramoto Neuron

The **Kuramoto** neuron implements dynamics inspired by the [Kuramoto model](https://en.wikipedia.org/wiki/Kuramoto_model), a mathematical framework for studying synchronization in systems of coupled oscillators. This model is often used to simulate how populations of neurons (or oscillators) can spontaneously synchronize their activity over time.

Each neuron is treated as an oscillator with its own **phase**, and its update is based on the phase differences between itself and its input (fan-in) neurons. The rate of change in the neuron's phase (its "angular velocity") is determined by its natural frequency and the sum of sinusoidal coupling terms from other neurons.

The update equation is:

$$
\theta_i(t + \Delta t) = \theta_i(t) + \Delta t \left[ \omega_i + \frac{K}{N} \sum_j \sin(\theta_j - \theta_i) \right]
$$

where:
- $$\theta_i$$ is the current **phase** (activation) of neuron *i*,
- $$\omega_i$$ is the **natural frequency** of neuron *i* (the slope parameter),
- $$K$$ is the **connection strength** from each input neuron,
- $$N$$ is the number of inputs (fan-in size),
- $$\Delta t$$ is the simulation time step (internally managed).

The result is a neuron whose activation continuously evolves as a circular phase variable in the range $$[0, 2\pi]$$. The neuron wraps around when it reaches $$2\pi$$, simulating a full cycle of oscillation.

This neuron is ideal for:
- Modeling **coupled oscillator networks**
- Exploring **neural synchronization**
- Simulations involving **phase-coded information**


## Parameters

### Natural Frequency

Controls the neuron's **intrinsic rate of oscillation**. A higher value causes the phase to advance more quickly in the absence of input. This parameter corresponds to $$\omega_i$$ in the Kuramoto equation.

### Add Noise

If enabled, **random noise** is added to the neuron's activity (currently commented out in the implementation). This can be used to simulate stochasticity in phase dynamics, although it may need to be manually enabled in the code. The noise source is configurable through a [Probability Distribution](/docs/utilities/randomizers).

### Clipping

If enabled, ensures that the neuron's activation stays within the range defined by **upper** and **lower bounds**. Though the phase normally wraps around $$2\pi$$, clipping may be used for debugging or alternative behaviors.

### Upper and Lower Bound

Specifies the **activation range** if clipping is enabled. These are not typically used in circular phase models but are available for flexibility.
