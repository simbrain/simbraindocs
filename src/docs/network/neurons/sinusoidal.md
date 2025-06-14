---
title: Sinusoidal Generator
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 190
---

# Sinusoidal

The **Sinusoidal** rule generates an oscillating signal based on a sine wave. It is used as an **activity generator**, not driven by input but producing rhythmic output over time. This is useful in simulations involving rhythmic inputs, periodic behavior, or neural oscillations.

At each time step, the neuron's activation is updated by:

$$
a(t) = \left(\frac{U - L}{2}\right) \cdot \sin(f \cdot t + \phi) + \left(\frac{U + L}{2}\right)
$$

Where:

- $$a(t)$$ is the neuron's activation at time $$t$$,
- $$U$$ and $$L$$ are the upper and lower bounds,
- $$f$$ is the frequency of oscillation,
- $$\phi$$ is the phase (initial position in the sine cycle),
- Optional noise can be added after computing the sine value.

This rule produces a smooth continuous waveform within a bounded range, centered between the upper and lower limits.

## Parameters

- **Phase**: The initial offset in the sine wave cycle (in radians).
- **Frequency**: Controls how fast the activation oscillates over time.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)

## Add Noise

If set to true, **random noise** is added to the activation after each update. The noise is generated from a distribution (by default, a uniform distribution). This can be useful for simulating stochastic neural activity. See [Randomizers](/docs/utilities/randomizers) for more detail

<!-- TODO --> Duplicate?