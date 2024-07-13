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

## Implementation

In general, the sigmoidal rule computes a sigmoidal function of **weighted inputs** *W* with a bias term *b*. *m* represents the slope at the inflection point, and *u* and *l* represent the upper and lower asymptotes (implied by the **upper bound** and **lower bound** fields).

Several standard forms of the sigmoidal function are used. All are scaled using upper and lower bounds and the slope.

### Arctan

$$
a \,\,\,= \,\,\, \frac{u-l}{\pi}\, \arctan \left( \frac{\pi m(W + b)}{u-l}\right) \,\,+\,\, \frac{u+l}{2}
$$

### Logistic

A scaled version of the logistic function \( \frac{1}{1 + e^{-x}} \).

$$
a \,\,\,= \,\,\, \frac{u-l}{2}\, \text{logistic} \left( \frac{4 m(W + b)}{u-l}\right) \,\,+\,\, l
$$

### Tanh

A scaled version of a sigmoidal implementation using a hyperbolic tangent function.

$$
a \,\,\,= \,\,\, \frac{u-l}{2}\, \tanh \left( \frac{2 m(W + b)}{u-l} \right)  \,\,+\,\, \frac{u+l}{2}
$$

Where:

$$
W \;\;=\;\; x_i(t \;+\; \Delta t) \;=\; x_i(t) \left(1 - \frac{a \Delta t}{\tau} \right) \;+\; \frac{\Delta t}{\tau} \sum\limits_{j = 0}^N w_{ji} r_j(t) \;\;+\;\; \zeta
$$

in the continuous case and:

$$
W \;\;=\;\; \sum\limits_{j = 0}^N w_{ji} r_j(t) \;\;+\;\; \zeta
$$

in the discrete case. Here \( r_j(t) \) refers to the activation value of pre-synaptic neuron \( j \) at time \( t \), and \( x_i(t) \) refers to a net activation value which the sigmoid function squashes to produce the activation value for the neuron.

## Time Constant (\( \tau \))

The time constant controls how quickly the numerical integration occurs. Larger values for the time constant produce slower, smoother changes. Smaller values produce faster, more discrete changes. If \( a \cdot dt = \tau \) this is equivalent to the discrete case.

## Leak Constant (\( a \))

Absent input the activation will tend towards its base value. The leak constant determines how strongly the neuron will be attracted to its base activation. If \( a \cdot dt = \tau \) this is equivalent to the discrete case.

## Bias (\( b \))

The bias is a fixed amount of input to the node, denoted by *b* above. This shifts the inflection point to the left or right of the origin.

## Slope (\( m \))

The slope at the inflection point is denoted by *m* above. This represents how steep the sigmoidal is.

## Add Noise (\( \zeta \))

If this is set to true, random values are added to the activation via a noise generator. The random values are added after the sigmoidal activation function is applied. For details on how the noise generator works, click **here**.