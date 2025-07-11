---
title: KWTA Group
layout: default
grand_parent: Networks
parent: Neuron Groups
has_children: false
nav_order: 7
---

# KWTA Group

The **K-Winner-Take-All (KWTA)** group is a competitive neural architecture where only the top **K** neurons (based on excitatory input) become active, while the rest are suppressed. It is often used in models of decision making and competition in cognitive science.

This model is based on the implementation described in *Computational Explorations in Cognitive Neuroscience* by O'Reilly and Munakata (2000), particularly page 110. It determines a level of global inhibition that allows exactly **K** neurons to be active above threshold.

## Behavior

- All neurons receive excitation from external sources.
- Global inhibition is applied to all neurons.
- The **K neurons** with the highest net excitatory input **survive inhibition** and are activated.
- All others are suppressed.

Although the update logic is currently marked as **not yet implemented** in the code, the intended behavior is to:

1. Sort neurons by excitatory input.
2. Compute an inhibition level that pushes the \( k+1 \)th neuron below threshold.
3. Apply that inhibition to all neurons.
4. Activate the top **K** neurons.

## Parameters

- **K**: The number of neurons that should win the competition (default: 1).
- **q**: Determines the relative contribution of the \( k \)th and \( k+1 \)th neuron to the inhibition threshold (default: 0.25).
- **Inhibitory Conductance**: The global inhibitory value to be applied to all neurons (default: 0.0).
