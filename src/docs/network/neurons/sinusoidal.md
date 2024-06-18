---
title: Sinusoidal Generator
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 70
---

# Sinusoidal Generator

The activation of this type of neuron varies sinusoidally over time between the upper bound and lower bound of the neuron.

Note that this type of neuron functions autonomously; it does not use sensory inputs or inputs from other neurons. It can be thought of as a signal generation device.

## Phase

The phase tells us where we start in a period of the sinusoidal oscillation.  It basically determines a start value for an oscillation.  This number should be between 0 and 2π. 

## Frequency

The frequency tells us how frequently the activation oscillates. For example, a low value (e.g. .001) will make the activation slowly vary over time.  A higher value (e.g. 1) will create rapid oscillations.

## Add Noise

If this is set to true, random values are added to the activation via a noise generator. The random values are added after the sinusoidal function is applied. For details how the noise generator works, click here.

<!-- TODO --> Duplicate?
Add Noise