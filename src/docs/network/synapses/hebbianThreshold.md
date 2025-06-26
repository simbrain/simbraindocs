---
title: Hebbian Threshold
published: false
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 50
---

# Hebbian Threshold Rule

A [Hebbian learning rule](https://en.wikipedia.org/wiki/Hebbian_theory) that updates synaptic strengths based on the correlation between pre- and post-synaptic activities, incorporating an output threshold.  When the sliding threshold is active, the output threshold adapts each step:  

$$
\text{outputThreshold} = \text{outputThreshold} + \text{outputThresholdMomentum} \cdot (\text{output}^2 - \text{outputThreshold})
$$  

The synapse strength update is: 
 
$$
\Delta w = \text{learningRate} \cdot \text{input} \cdot \text{output} \cdot (\text{output} - \text{outputThreshold})
$$

# Preferences
- **Learning rate**: Learning rate for Hebb threshold rule.
- **Threshold**: Output threshold for Hebb threshold rule.
- **Threshold momentum**: Amount the output threshold can adapt at each step.
- **Sliding threshold**: Use sliding output threshold for Hebb threshold rule.
