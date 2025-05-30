---
title: Allostatic
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 30
---

# Allostatic Neuron

This spiking neuron model is based on the homeostatic mechanism described by Falandays et al. (2021). It introduces an adjustable internal target activation level and a dynamic spiking threshold. The model attempts to maintain its activity around the target level by adjusting incoming synaptic weights based on recent spiking history and error signals.

At each timestep, the neuron:
1. Applies **leaky integration** to its current activation using a fixed leak rate.
2. Receives input from presynaptic spiking neurons, accumulating this input additively.
3. Spikes if the resulting activation exceeds the current threshold, then reduces its activation by the threshold amount.
4. Learns by adjusting incoming synaptic weights based on the **error** between its current activation and internal target.
5. Updates its target activation and threshold to maintain **homeostatic regulation**.

This model uses the following equations:
- **Leaky integration**:  
  $$x_n(t+1) = \max(0, x_n(t) \cdot \text{leakRate} + I)$$  
  where $$I$$ is total input from presynaptic spikes.

- **Spiking condition**:  
  The neuron spikes if $$x_n > T'_n$$, where $$T'_n = 2T_n$$ is the current threshold.

- **Synaptic weight update**:  
  $$\Delta w = -\frac{(x_n - T_n)}{N}$$ for each presynaptic spike, where $$N$$ is the number of such spikes.

- **Target update**:  
  $$T_n \leftarrow T_n + \text{learningRate} \cdot (x_n - T_n)$$, with a lower bound of 1. The threshold is then updated as $$T'_n = 2T_n$$.

# Parameters

- **leakRate**: Controls the decay of activation over time. A value of 0.75 means the neuron retains 75% of its activation at each step without further input.

- **learning rate**: Determines how quickly the neuron adapts its target activation in response to the error between current activation and the target.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)
