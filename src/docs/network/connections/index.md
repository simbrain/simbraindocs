---
title: Connection Methods
layout: default
parent: Networks
has_children: true
nav_order: 70
---

# Connection Strategies

Connection strategies are one way of [connecting neurons](../buildBasics#Connection_Methods) They rules used to create rule-based patterns of connections between source and target groups of neurons. The connection strategies generally also set an [excitatory / inhibitory ratio](../otherDialogs#Excitatory-Inhibitory-Ratio). All weights strenghts are simply 1 or -1 by default. To set a distribution on weights strengths the [synapse adjustment panel](../otherDialogs#Synapse-Adjustment-Dialog) should be used.

Connection strategies can be invoked in these ways:

- There is a default strategy that is set in network preferences when using the 1-2 trick. 
- You can also right click and select one from the `connect neurons` submenu.
- Synapse groups are also associated with connection strategies that can be applied


## Types of Connection Strategies

These are notes to be moved to sub-pages.

## All-to-All

Done. See sub-page.


## Distance Based

Connect source neurons to target neurons with a probability proportional to a distance function. Amount to decay connection probabilty as a function of pixel distance. At the `peak` of the decay function connectios are made with probability 1, and this probabiliy decays to 0 after `dispersion`. For example, with a linear decay function, target neurons on top of a source neuron will be guaranteed to make a connection and as target neurons are farther away the probability of a conneciton drops off to 0.


<!-- Link to distance functions.  -->


## One-to-One

Done. See sub-page

## Fixed Degree

 For each source neuron, create a fixed number of connections to or from target neurons (fixed indegree vs. fixed outdegree).

**Degree**. Maximum number of connections a source neuron can make to a target neuron.

**Indegree / Outdegree**. Make the fixed connections 'inward' (connections sent in to each neuron) or 'outward' (connections radiating out from each neuron)?

**Use radius**. If true, only connect within a radius specified in pixels.

**Allow self connections**. Allow synapses from neurons to themselves.

## Radial Gaussian

### Distance-based Connection Types

This connection type makes four types of distance-based connections probabilistically:

1. **Excitatory to Excitatory (EE)**
2. **Excitatory to Inhibitory (EI)**
3. **Inhibitory to Inhibitory (II)**
4. **Inhibitory to Excitatory (IE)**

The probability of making a connection drops off according to a Gaussian distribution centered on each neuron, which is scaled differently according to the polarity of the source and target neurons. Specifically, the probability of forming a connection between a neuron $$a$$ with polarity $$x$$ and another neuron $$b$$ with polarity $$y$$ is given by:

$$P(a, b) = \min\left(C_{xy} \cdot \exp\left(-\left(\frac{D(a, b)}{\lambda}\right)^2\right), 1\right)$$

where:
- $$(D(a, b))$$ gives the Euclidean distance in pixels,
- $$(C_{xy})$$ is a scalar constant unique to the polarity of $$x$$ and $$y$$ (e.g., excitatory to excitatory may have a $$C_{ee}$$ of 0.2, while inhibitory to inhibitory may have a $$C_{ii}$$ of 0.1, meaning as a baseline, excitatory-to-excitatory synapses are twice as likely as inhibitory-to-inhibitory synapses),
- $$\lambda$$ represents the standard deviation with respect to distance for the Gaussian drop-off.

Any of the four constants for the four cases can be set to a value between 0 and 1. 
- **0**: No connections of that type will be made.
- **1**: The maximum number of connections possible will be made given the exponential distribution.

The larger any of the constants is relative to the others, the more likely a connection of that type will occur.


**Excitatory → Excitatory Constant**: Controls the probability of forming a connection between two excitatory neurons.

**Excitatory → Inhibitory Constant**: Controls the probability of forming a connection from an excitatory neuron to an inhibitory neuron.

**Inhibitory → Excitatory Constant**: Controls the probability of forming a connection from an inhibitory neuron to an excitatory neuron.

**Inhibitory → Inhibitory Constant**: Controls the probability of forming a connection between two inhibitory neurons.

**No Polarity Constant**: Governs the probability of forming connections for neurons without explicit polarity.

**Distance Drop-off (lambda)**: Represents the average distance in pixels for connections, affecting overall connection density.


## Radial Probabilistic

For each source neuron consider every target neuron in a radius and make excitatory and inhibitory synapses with them according to specified probabilities.

**Excitatory Probability**. Probability of making excitatory connections to neighboring neurons with the excitatory radius.

**Inhibitory Probability**.Probability of making inhibitory connections to neighboring neurons within the inhibitory radius.

**Excitatory Radius**. Radius within which to make excitatory connections.

**Inhibitory Radius**. Radius within which to make inhibitory connections.

**Allow self connections**. Allow synapses from neurons to themselves.


## Sparse

Done.  See sub-page

