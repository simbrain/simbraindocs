---
title: Radial Gaussian
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 70
---

# Radial Gaussian

Creates connections using a [Gaussian decay function](../../utilities/decayFunctions#gaussian-decay-function) that respects neuron polarity. The probability of making a connection drops off according to a Gaussian distribution centered on each neuron, scaled differently according to the polarity of the source and target neurons. The probability of forming a connection between a neuron $$a$$ with polarity $$x$$ and another neuron $$b$$ with polarity $$y$$ is given by:

$$P(a, b) = \min\left(C_{xy} \cdot \exp\left(-\left(\frac{D(a, b)}{\lambda}\right)^2\right), 1\right)$$

where:
- $$D(a, b)$$ is the Euclidean distance in pixels
- $$C_{xy}$$ is the scalar constant describing probabilities for making connections between neurons of polarity $$x$$ and $$y$$
- $$\lambda$$ represents the standard deviation with respect to distance for the Gaussian drop-off

The larger any of the constants is relative to the others, the more likely a connection of that type will occur. For example, if $$C_{ee}$$ is 0.2 and $$C_{ii}$$ is 0.1, then excitatory-to-excitatory synapses are twice as likely as inhibitory-to-inhibitory synapses.

## Parameters

- **Distance drop-off**: Roughly the average connection distance in pixels. Lambda ($$\lambda$$) is a regulating constant governing overall connection density. Higher values create denser connections over larger distances.

- **Exc. → exc. constant**: Controls the probability of forming a connection between two excitatory neurons.

- **Exc. → inh. constant**: Controls the probability of forming a connection from an excitatory neuron to an inhibitory neuron.

- **Inh. → exc. constant**: Controls the probability of forming a connection from an inhibitory neuron to an excitatory neuron.

- **Inh. → inh. constant**: Controls the probability of forming a connection between two inhibitory neurons.

- **No polarity constant**: Governs the probability of forming connections for neurons without explicit polarity.