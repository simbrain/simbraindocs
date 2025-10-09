---
title: Winner Take All
layout: default
grand_parent: Networks
parent: Neuron Groups and Collections
has_children: false
nav_order: 50
---

# Winner Take All

The Winner Take All (WTA) group enforces competitive dynamics among its neurons: only one neuron "wins" based on having the strongest input or activation, and all others are suppressed. This is useful for modeling categorical selection, decision-making, and inhibitory competition where only one output should be active at a time.

At each time step:

1. Each neuron accumulates and updates its inputs using its own update rule.
2. The neuron with the highest net input (or activation) is selected as the winner.
3. The winner's activation is set to a win value (e.g., 1.0).
4. All other neurons are set to a lose value (e.g., 0.0).
5. Optionally, the winner can be chosen at random based on a probability, even if it's not the strongest neuron.

If multiple neurons are tied for the highest input, one of the tied neurons is selected randomly.

## Parameters

- **Wining value**: The activation value assigned to the winning neuron.
- **Losing value**: The activation value assigned to all non-winning neurons.
- **Random winner**: If enabled, occasionally choose a winner at random regardless of input strength.
- **Random prob**: The probability of choosing a random winner when Random winner is enabled (only visible when Random winner is checked).

The winner is determined by comparing weighted input values. In case of ties, the winner is chosen uniformly at random from the top-scoring neurons.