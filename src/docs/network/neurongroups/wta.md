---
title: Winner Take All
layout: default
grand_parent: Networks
parent: Neuron Groups and Collections
has_children: false
nav_order: 50
---

The **Winner Take All (WTA)** group enforces competitive dynamics among its neurons: only one neuron "wins" based on having the strongest input or activation, and all others are suppressed. This is useful for modeling categorical selection, decision-making, and inhibitory competition where only one output should be active at a time.

At each time step:

1. Each neuron accumulates and updates its inputs using its own update rule.
2. The neuron with the highest net input (or activation) is selected as the **winner**.
3. The winner's activation is set to a **win value** (e.g., 1.0).
4. All other neurons are set to a **lose value** (e.g., 0.0).
5. Optionally, the winner can be chosen at random based on a probability, even if it's not the strongest neuron.

If multiple neurons are tied for the highest input, one of the tied neurons is selected randomly.

## Parameters

- **Winning Value**: The activation value assigned to the winning neuron (default: 1.0).
- **Losing Value**: The activation value assigned to all non-winning neurons (default: 0.0).
- **Random Winner**: If enabled, occasionally choose a winner at random regardless of input.
- **Random Probability**: The probability of choosing a random winner when "Random Winner" is enabled.

## Notes

- The winner is determined by comparing **net input** values by default. You can also configure the system to compare **activations** if needed.
- In case of ties, the winner is chosen uniformly at random from the top-scoring neurons.