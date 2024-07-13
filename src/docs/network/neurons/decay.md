---
title: Decay
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 60
---

# Decay Neuron

This type of neuron decays towards a fixed base-line value. There are two ways the neuron can decay: either by an absolute amount, or a relative amount. At each iteration of the network, **weighted inputs** are added to the neuron's current activation value, and that sum then decays.

## Relative/Absolute

- If **Relative** is chosen, then at each iteration, the neuron's activation value is changed in the direction of the base-line value by a fixed proportion of its distance from that value. Since the amount the activation decays is a fraction of its current activation, this method is "relative."
- If **Absolute** is chosen, then at each iteration, the neuron's activation value is changed in the direction of the base-line value by a fixed amount, or decay amount.

## Base-line

The fixed value the neuron decays to.

## Decay amount

The amount by which the activation is changed each iteration if absolute decay is chosen.

## Decay fraction

The proportion of the distance between the current value and the base-line value, by which the activation is changed each iteration if relative decay is chosen.

## Add Noise

If this is set to true, random values are added to the activation via a noise generator. The random values are added after the activation is decayed. For details on how the noise generator works, click **here**.
