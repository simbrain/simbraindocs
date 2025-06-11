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
  
- When the forgetting rate is zero, the update is:  

$$
\Delta w = \text{learningRate} \cdot (\text{input} \cdot \text{output})
$$  

- When the forgetting rate is positive, weights decay before the update:  

$$
w = (1 - \text{forgettingRate}) \cdot w + \text{learningRate} \cdot (\text{input} \cdot \text{output})
$$  

- Can be applied to both individual synapses and weight matrices.

# Preferences
- **Learning rate**: Learning rate for Hebb rule.
- **Forgetting rate**: The percent of strength to remove at each time step.
