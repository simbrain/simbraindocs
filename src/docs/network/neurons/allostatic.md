---
title: Allostatic
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Allostatic Update Rule

The Allostatic Update Rule is a spiking neuron model that adjusts its internal target activation level over time, supporting dynamic homeostasis. Based on Falandays et al. (2021), it captures regulatory processes that balance activation around a moving set point.

Each neuron maintains:

- An activation level $$x_n$$.
- A target activation level $$T_n$$.
- A spiking threshold $$T'_n = 2T_n$$.

The neuron updates as follows:

1. Activation decay with input  
   $$
   x_n \leftarrow \max(0,\; x_n \cdot \text{leakRate} + \sum_j w_j \cdot \text{spike}_j)
   $$

2. Spike condition and reset  
   $$
   \text{if } x_n > T'_n \Rightarrow \text{spike}, \quad x_n \leftarrow x_n - T'_n
   $$

3. Synaptic weight adaptation (only from spiking sources) 
   $$
   w_j \leftarrow w_j - \frac{x_n - T_n}{N}
   $$

4. Target adaptation and threshold update
   $$
   T_n \leftarrow \max(1,\; T_n + \eta \cdot (x_n - T_n)), \quad T'_n \leftarrow 2T_n
   $$

This rule causes a neuron to maintain activity around its evolving target, modifying both its incoming weights and threshold accordingly.

## Parameters

- **Leak Rate**: Proportion of activation retained after each time step. A value of 0.75 implies a 25% decay in the absence of input.
- **Learning Rate**: How quickly the target activation level adapts to current activity.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)
