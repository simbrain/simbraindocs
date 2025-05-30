---
title: Continuous Sigmoidal
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 50
---

# Continuous Sigmoidal Neuron

The **Continuous Sigmoidal Neuron** is a type of artificial neuron designed to simulate continuous changes in activation over time. It utilizes a numerical integration process to smoothly update its activation based on the inputs it receives, making it ideal for scenarios where gradual, continuous changes in neuron behavior are needed. This neuron can optionally incorporate noise in its updates, adding a layer of stochasticity to its behavior.

This neuron model is especially useful in neural networks where you want the neuron's activation to evolve continuously, such as in simulations of real-world biological processes or in continuous-time neural models.

## How It Works

The Continuous Sigmoidal Neuron operates by integrating the input values over time and then passing the integrated value through a sigmoid function to calculate the final output activation.

The update rule for the neuron is based on the following differential equation:

$$
c \frac{dx_i}{dt} = -a x_i(t) + \sum w_{ij} r_j(t)
$$

Where:
- $$ x_i(t) $$ is the net activation of neuron $$ i $$ at time $$ t $$,
- $$ r_j(t) $$ is the output activation after applying the sigmoid squashing function,
- $$ a $$ is the leak constant,
- $$ c $$ is the time constant.

Discretizing this equation using Euler’s integration method gives the following:

$$
x_i(t + dt) = x_i(t) \left( 1 - \frac{a dt}{c} \right) + \frac{dt}{c} \sum w_{ij} r_j(t)
$$

This equation explains how the neuron's activation evolves over time based on its previous activation, the input it receives, and its internal parameters (time constant and leak constant).

## Parameters

- **Time Constant**: controls how quickly the neuron’s activation integrates over time. A higher time constant results in slower integration, meaning the neuron is less sensitive to rapid changes in input. Conversely, a smaller time constant means the neuron reacts more quickly to changes in input.

- **Leak Constant** defines how strongly the neuron will be attracted to its baseline activation when no significant input is present. It determines the rate at which the neuron "decays" or moves back to its resting state.

### Add Noise
If set to true, **random noise** is added to the activation after each update. The noise is generated from a distribution (by default, a uniform distribution). This can be useful for simulating stochastic neural activity. See [Randomizers](/docs/utilities/randomizers) for more detail.

For other adjustable properties like noise and sigmoid function type, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)


