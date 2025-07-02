---
title: Bare Neuron Group
layout: default
grand_parent: Networks
parent: Neuron Groups and Collections
has_children: false
nav_order: 20
---

# Bare Neuron

The **Bare Neuron** group is the simplest kind of neuron group in Simbrain. It is a basic collection of neurons, all sharing the same update rule (e.g., linear, sigmoidal, spiking). This group is ideal for constructing custom networks from the ground up without any specialized behavior like competition, softmax normalization, or spatial structure.

This group is essentially a wrapper around a list of neurons, providing convenience for group-level operations such as updating, layout, and rule assignment.

During each simulation update:

1. Each neuron accumulates input from incoming synapses.
2. Each neuron updates its activation using the shared update rule.
3. Inputs are cleared after the update step.

## Behavior

- All neurons in the group use the same update rule.
- The update rule can be changed after creation.
- Neurons are sorted spatially at creation (left to right, top to bottom).
- Group layout and identity can be managed like any other network model.

## Parameters

- **Number of Neurons**: Determines how many neurons are included in the group at creation.
- **Update Rule**: All neurons use the same rule (e.g., Linear, Sigmoidal, Spiking Threshold).
