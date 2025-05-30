---
title: Additive (Continuous Hopfield)  
layout: default  
grand_parent: Networks  
parent: Neurons  
has_children: false  
nav_order: 10
---

# Additive (Continuous Hopfield) Neuron

This neuron model is based on the continuous [Hopfield](https://en.wikipedia.org/wiki/Hopfield_network) network described in Haykin (2002) and originally described in [this paper](https://www.pnas.org/doi/10.1073/pnas.81.10.3088). It features decay-based dynamics and a sigmoidal transfer function, and is useful in networks where smooth, continuous changes in activation are desired.

The neuron's activation changes over time as a function of its current activation and total input, modified by a sigmoidal function. It can optionally include noise at each update step.

The update rule is governed by the following differential equation:

$$
da/dt = -a / R + I
$$

where:
- $$a$$ is the activation,
- $$R$$ is the resistance (inverse decay rate),
- $$I$$ is the total weighted synaptic input.

The input is transformed through a sigmoidal activation function of the form:

$$
y = (2 / \pi) * \mbox{arctan}((\pi * \lambda * I) / 2)
$$

This neuron is ideal for:
- Modeling continuous-time Hopfield networks
- Exploring energy-minimizing dynamics
- Systems requiring graded response neurons instead of binary outputs

# Parameters

- **Lambda**: controls the steepness of the sigmoid function used to transform input. A larger value makes the function more like a step function, while a smaller value smooths it out.

- **Resistance**: Determines the rate of decay of the neuron's activation. A higher resistance value leads to slower decay; a lower value causes the neuron to change more quickly.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)
