---
title: Radial Gaussian
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 70
---

# Radial Gaussian

This connection strategy is like [distance-based](distanceBased), but is more complex, and is especially well-suited to making connections in a way that respects neuron polarity. 

Constants such as Excitatory to Excitatory ($$C_{ee}$$) and Excitatory to Inhibitory ($$C_{ei}$$) are used to determine how many connetions are made between neurons of a given type (a non-polar constant is also used.). These constants range between 0 (no connections of that type will be made between those types of neurons) and 1 (the maximum number of connections possible will be made between those neurons).

The probability of making a connection drops off according to a Gaussian distribution centered on each neuron, which is scaled differently according to the polarity of the source and target neurons. Specifically, the probability of forming a connection between a neuron $$a$$ with polarity $$x$$ and another neuron $$b$$ with polarity $$y$$ is given by:

$$P(a, b) = \min\left(C_{xy} \cdot \exp\left(-\left(\frac{D(a, b)}{\lambda}\right)^2\right), 1\right)$$

where:
- $$(D(a, b))$$ is the Euclidean distance in pixels
- $$(C_{xy})$$ is the scalar constant describing probabilities for making connections between neurons of polarity $$x$$ and $$y$$. For example, $$C_{ee}$$ is the excitatory to excitatory constant.
- $$\lambda$$ represents the standard deviation with respect to distance for the Gaussian drop-off.

The larger any of the constants is relative to the others, the more likely a connection of that type will occur. For example, if $$C_{ii}$$ is 0.2 and $$C_{ii}$$ of 0.1, then excitatory-to-excitatory synapses are twice as likely to be made as inhibitory-to-inhibitory synapses.

**Excitatory → Excitatory Constant**: Controls the probability of forming a connection between two excitatory neurons.

**Excitatory → Inhibitory Constant**: Controls the probability of forming a connection from an excitatory neuron to an inhibitory neuron.

**Inhibitory → Excitatory Constant**: Controls the probability of forming a connection from an inhibitory neuron to an excitatory neuron.

**Inhibitory → Inhibitory Constant**: Controls the probability of forming a connection between two inhibitory neurons.

**No Polarity Constant**: Governs the probability of forming connections for neurons without explicit polarity.

**Distance Drop-off ($$\lambda$$)**: Represents the average distance in pixels for connections, affecting overall connection density.