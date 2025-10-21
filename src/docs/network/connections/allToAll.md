---
title: All To All
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 10
---

# All to All

Connects every source neuron to every target neuron. This is the default connection strategy in Simbrain, used by both the [1-2 trick](../buildingBasics.html#quick-connect-1-2-and-1-3-tricks) (with 100% excitatory) and the [1-3 trick](../buildingBasics.html#quick-connect-1-2-and-1-3-tricks) (with configurable excitatory/inhibitory ratio).

## Parameters

- **Self-connections allowed**: Whether connections where the source and target are the same neuron are allowed. Only applicable if the source and target neurons overlap.
- **Bi-directional**: If true, synapses are added in both directions (source→target and target→source).
