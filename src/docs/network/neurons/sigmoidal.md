---
title: Sigmoidal
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 180
---

# Sigmoidal Neuron

The sigmoidal update rule is the classic S-shaped **sigmoidal function** used in backprop and familiar throughout the biological sciences. They approximate a linear function at their inflection point and approach their upper and lower bounds non-linearly away from that point. They are sometimes called squashing functions because they squash values into a certain range non-linearly. In the neuroscience literature, sigmoidal rules are used to represent the saturation of firing rate: neurons can only fire at some maximum or minimum rate, no more, no less. They have the advantage of being differentiable and are thus in certain gradient descent algorithms like backprop.

This page covers two types of sigmoidal update rule, labeled "Sigmoidal (Discrete)" and "Sigmoidal (Continuous)" in the application. The continuous sigmoidal is a generalization of the discrete case to continuous time. The inputs are numerically integrated and there is some dependence on the previous state. In the discrete case, the sigmoid function is applied at a time and that's it. In the continuous case, it represents a combination of what inputs it received at previous time steps and what inputs it's receiving now. That is, the discrete case is "memory-less", while in the continuous case there is an internal variable that is being numerically integrated through time.

This rule includes two variants:

- **Sigmoidal (Discrete)**: Stateless update based on current input only.
- **Sigmoidal (Continuous)**: Numerically integrates inputs over time with memory and internal dynamics.

---

## Discrete vs. Continuous

In the **discrete** case, the activation is a direct function of the current input:

$$
a = f(W)
$$

In the **continuous** case, the activation depends on both current and past input:

$$
x_i(t + \Delta t) = x_i(t)\left(1 - \frac{a \Delta t}{\tau} \right) + \frac{\Delta t}{\tau} \sum_j w_{ji} r_j(t) + \zeta
$$

This net input is then passed through a sigmoid nonlinearity to produce the activation.

---

## Sigmoidal Forms

The specific form of the sigmoidal function can be selected via a **Sigmoid Type** parameter. All forms are scaled by an upper bound $$u$$, lower bound $$l$$, slope $$m$$, and bias $$b$$.

### Logistic

$$
a = \frac{u - l}{2} \cdot \frac{1}{1 + e^{-\frac{4m(W + b)}{u - l}}} + l
$$

### Tanh

$$
a = \frac{u - l}{2} \cdot \tanh\left(\frac{2m(W + b)}{u - l}\right) + \frac{u + l}{2}
$$

### Arctangent

$$
a = \frac{u - l}{\pi} \cdot \arctan\left(\frac{\pi m(W + b)}{u - l}\right) + \frac{u + l}{2}
$$

---

## Parameters

- **Slope (m)**: Controls the steepness of the sigmoidal curve.
- **Bias (b)**: A fixed offset applied to the input before the sigmoid function is computed. Shifts the curve left or right.
- **Sigmoid Type**: Determines the mathematical form of the sigmoidal function (e.g., Logistic, Tanh, Arctangent).

_Only for the continuous variant:_

- **Time Constant (τ)**: Determines the rate at which the neuron's internal activation integrates over time. Larger values lead to slower responses.
- **Leak Constant (a)**: Governs the decay of the internal activation toward baseline in the absence of input.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)