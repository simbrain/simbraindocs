---
title: Hebbian
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 30
---

# Hebbian Rule

A standard [Hebbian learning rule](https://en.wikipedia.org/wiki/Hebbian_theory) that updates synaptic strengths based on the correlation between pre- and post-synaptic activities. 

$$
\Delta w = \epsilon \cdot (a_\text{source} \cdot a_\text{target})
$$  

where:
- $$\epsilon$$ is the learning rate
- $$a_{\text{source}}$$ is the activation of the source or pre-synaptic neuron
- $$a_{\text{target}}$$ is the activation of the target or post-synaptic neuron
- $$w$$ is the current synaptic strength

When a forgetting rate $$\gamma$$ is applied, the update becomes:

$$
w_{\text{new}} = (1 - \gamma) \cdot w + \epsilon \cdot (a_\text{source} \cdot a_\text{target})
$$

# Parameters
- **Learning rate**: Learning rate $$\epsilon$$ for Hebb rule (range: 0 and up)
- **Forgetting rate**: The percent of strength to remove at each time step (range: 0 to 1)
