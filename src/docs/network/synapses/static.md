---
title: Static
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 20
---

# Static

The static synapse rule models synapses whose strength does not change over time. This rule effectively "clamps" the weight of the synapse, preventing it from participating in any learning dynamics or plasticity mechanisms. Such synapses remain constant regardless of the activities of the source or target neurons.

This can be useful for implementing fixed connections in a network that should not be modified during training or simulation. Static synapses have no configurable parameters beyond the common synapse properties.
