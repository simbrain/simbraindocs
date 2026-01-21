---
title: Prune Weights
layout: default
parent: Wand Tool
grand_parent: Networks
has_children: false
---

# Prune Weights Action

Removes synapses with weak connection strengths by deleting any synapse where the absolute value of its weight is below a specified threshold. This action is useful for cleaning up networks with many near-zero weights, simplifying network structure, or implementing weight pruning strategies.

# Parameters

- **Threshold**: The minimum absolute weight value to keep. Any synapse with `|strength| < threshold` will be deleted. Default is 0.5.

For [common properties](.#common-properties) like Letter, Color, and Radius, see the main wand tool page.

