---
title: Adjust Value
layout: default
parent: Wand Tool
grand_parent: Networks
has_children: false
---

# Adjust Value Action

The most common wand action type. It can adjust either neuron activations or synapse strengths based on configurable parameters. This unified action replaces what used to be separate actions for activating, inhibiting, setting values, randomizing, incrementing, and decrementing.

# Parameters

## Amount

Determines the value to use when applying the action.

- **Upper Bound**: Use the target's upper bound (e.g., for activating neurons to maximum)
- **Lower Bound**: Use the target's lower bound (e.g., for inhibiting neurons to minimum)
- **Value**: Use a specific fixed value
  - **Value**: The fixed value to use
- **Relative**: Use a value relative to bounds
  - **Relative Value**: A value from -1 (lower bound) to 1 (upper bound), with 0 representing zero (clamped to bounds if outside range)
- **Random**: Sample from a probability distribution
  - **Randomizer**: The probability distribution to sample from

## Operation

How to apply the value to the current value.

- **Set**: Replace the current value with the computed value
- **Add**: Add the computed value to the current value

## Target

What property to adjust.

- **Neuron Activation**: Affect neuron activations
- **Synapse Strength**: Affect synapse strengths (weights)

## Clamp to Bounds

Whether to constrain the result within the target's lower and upper bounds.

For [common properties](.#common-properties) like Letter and Color, see the main wand tool page.

# Common Configurations

While you can create custom combinations, here are some commonly useful configurations:

- **Activate**: Amount = Upper Bound, Operation = Set, Target = Neuron Activation
- **Inhibit**: Amount = Lower Bound, Operation = Set, Target = Neuron Activation
- **Set to Zero**: Amount = Value (0.0), Operation = Set, Target = Neuron Activation
- **Randomize**: Amount = Random, Operation = Set, Target = Neuron Activation
- **Increment**: Amount = Value (0.1), Operation = Add, Target = Neuron Activation
- **Decrement**: Amount = Value (-0.1), Operation = Add, Target = Neuron Activation
- **Set Synapse Weight**: Amount = Value (1.0), Operation = Set, Target = Synapse Strength

# Use Cases

## Setting Activation Levels

Use Set operation with different Amount types to directly set neuron activations:
- Upper Bound for fully active neurons
- Lower Bound for fully inactive neurons
- Value for specific activation levels
- Relative for proportional activation (e.g., 0.5 for half-maximum)

## Incremental Adjustments

Use Add operation with Value amounts to make incremental changes:
- Positive values to gradually increase activation
- Negative values to gradually decrease activation
- Useful for fine-tuning patterns without completely overwriting existing values

## Stochastic Patterns

Use Random amounts with various distributions to create noisy or probabilistic patterns:
- Uniform distributions for unbiased random values
- Normal distributions for naturalistic variation
- Custom distributions for specific statistical properties

## Weight Sculpting

Target Synapse Strength to manually adjust connection patterns:
- Set strong connections to encourage information flow
- Weaken or strengthen groups of synapses together
- Create custom connectivity patterns not easily achievable with connection strategies
