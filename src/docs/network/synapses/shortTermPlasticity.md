---
title: Short Term Plasticity
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 80
---

# Short Term Plasticity

The [Short Term Plasticity (STP)](https://en.wikipedia.org/wiki/Synaptic_plasticity#Short-term_plasticity) rule models transient changes in synaptic strength that occur on a short timescale, distinct from [long-term plasticity](https://en.wikipedia.org/wiki/Synaptic_plasticity#Long-term_plasticity) mechanisms like Hebbian learning. This rule updates the synaptic strength dynamically based on whether the source neuron is actively firing or not.

At each update:
- **Activation**: If the source neuron is spiking (for spiking neurons) or its activation exceeds a threshold (for rate-based neurons), the synapse is considered *activated*.
- **Plasticity type**:  
  - If **[STD](https://en.wikipedia.org/wiki/Synaptic_plasticity#Long-term_depression)** (short term depression) is selected, the synapse strength is decreased toward its lower bound at a rate determined by the bump rate.  
  - If facilitation is selected (not explicitly named here but implied by a non-STD type), the strength is increased toward its upper bound at a rate determined by the bump rate.
- **Decay**: When not activated, the synapse strength decays toward a baseline strength at a rate determined by the decay rate.

The synaptic strength update is as follows:
- If activated and **STD**:
  $$
  w \leftarrow w - \text{bumpRate} \cdot (w - w_{\min})
  $$
- If activated and facilitation:
  $$
  w \leftarrow w + \text{bumpRate} \cdot (w_{\max} - w)
  $$
- If not activated:
  $$
  w \leftarrow w - \text{decayRate} \cdot (w - \text{baseLineStrength})
  $$

# Parameters

- **Plasticity Type**: Determines the type of plasticity (STD or facilitation).
- **Spike Threshold**: Threshold used to determine activation for rate-based neurons.
- **Line Strength**: Baseline synaptic strength the synapse decays to when not activated.
- **Input Threshold**: Input threshold (not actively used in this rule).
- **Bump rate**: Rate at which synaptic strength is modified when activated.
- **Decay Rate**: Rate at which synaptic strength decays when not activated.