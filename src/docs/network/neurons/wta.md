---
title: Winner Take All
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 200
---

# Winner Take All Rule

The winner-take-all rule is available for [neuron arrays](../arraysMatrices) only. It selects the neuron with the highest input as the winner and sets all others to a lose value.

This rule is useful for modeling categorical selection, decision-making, and inhibitory competition where only one output should be active at a time.

On each update, the neuron with the highest net input is selected as the winner. The winner's activation is set to the win value and all others are set to the lose value. In case of a tie, the winner is chosen uniformly at random from the tied neurons.

## Parameters

- **Win value**: Activation value assigned to the winning neuron.
- **Lose value**: Activation value assigned to all non-winning neurons.
- **Use random**: If enabled, occasionally selects a winner at random regardless of input strength.
- **Random probability**: Probability of selecting a random winner when Use random is enabled. Only visible when Use random is checked.
