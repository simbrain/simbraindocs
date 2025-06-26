---
title: Hebbian CPCA
published: false
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 40
---

# Hebbian CPCA

The Hebbian CPCA rule is a [Hebbian learning](https://en.wikipedia.org/wiki/Hebbian_theory) variant that updates the strength of a synapse using a modified weight update rule. The change in weight, $$\Delta w$$, is determined by the learning rate, the activations of the source and target neurons, and the current synapse strength:

$$
\Delta w = \epsilon \cdot (a_{\text{target}} \cdot a_{\text{source}} - a_{\text{target}} \cdot w)
$$

where:
- $$\epsilon$$ is the learning rate
- $$a_{\text{source}}$$ is the activation of the source neuron
- $$a_{\text{target}}$$ is the activation of the target neuron
- $$w$$ is the current synaptic strength.

The learning rule includes a sigmoidal function to transform weight values:

$$
\text{sigmoidal}(x) = \frac{1}{1 + (\theta \cdot \frac{x}{1 - x})^{-\lambda}}
$$

where:
- $$\theta$$ is the weight offset parameter,
- $$\lambda$$ is the sigmoidal scaling parameter.

This rule is based on equations described in O'Reilly and Munakata (2000), specifically equations 4.12 and 4.23.

# Parameters

- **Learning Rate**: Sets the rate of change of the synapse, $$\text{learningRate}$$.
- **m**: The maximum weight value, $$m$$.
- **Theta**: The weight offset value, $$\theta$$.
- **Lambda**: The scaling parameter for the sigmoidal function, $$\lambda$$.
