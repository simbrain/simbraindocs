---
title: Connection Strategies
layout: default
parent: Networks
has_children: true
nav_order: 90
---

# Connection Strategies

Connection strategies are rules used to create patterns of connections between source and target groups of neurons. They provide a systematic way to establish synaptic connections with specific properties and patterns. All connection strategies set an [excitatory/inhibitory ratio](#excitatory--inhibitory-ratio) and can randomize weight strengths using probability distributions.

## Quick Connection Workflow (1-2 Trick)

The fastest way to create connections is using the **[1-2 trick](/buildingBasics.html#quick-connect-1-2-trick)**:

1. **Select source neurons** and press `1` to mark them as sources
2. **Select target neurons** and press `2` to connect using the [default connection strategy](#default-connection-strategy)
3. **Press `Shift+2`** to allow self-connections during the [1-2 trick](/buildingBasics.html#quick-connect-1-2-trick)

## Connection Methods

Connection strategies can be invoked in several ways:

- **[1-2 Trick](/buildingBasics.html#quick-connect-1-2-trick)**: Press `1` then `2` for quick connections using the [default strategy](#default-connection-strategy)
- **Right-click menu**: Select neurons, right-click, and choose from the "Connect neurons" submenu
- **Keyboard shortcuts**: Press `2` for [default connections](#default-connection-strategy), `3` for custom connection dialogs
- **Synapse groups**: Connection strategies are associated with synapse groups for organized connections


## Default Connection Strategy

When you create connections using quick methods like the [1-2 trick](/buildingBasics.html#quick-connect-1-2-trick) or the keyboard shortcut `2`, Simbrain applies a default connection strategy rather than prompting you to choose one each time. This default is [All-to-All](allToAll), which connects every source neuron to every target neuron.

You can change the default connection strategy in [Network Preferences](../ui/networkPreferences) to use any available strategy (Sparse, Distance-Based, Fixed Degree, etc.) for all quick connection operations. The default is used for the [1-2 trick](/buildingBasics.html#quick-connect-1-2-trick), keyboard shortcut `2`, and other quick connection operations that don't explicitly specify a strategy.

If you need a different connection strategy for a specific operation, use `3` instead of `2` to open the connection dialog and choose a different strategy.

## Common Properties

All connection strategies share these properties for controlling weight polarity and randomization:

- **Excitatory/Inhibitory Ratio**: Percentage of connections that are excitatory vs inhibitory. This setting applies to strategies that use [polarity](../neurons/#polarity) (most strategies). The ratio determines how many of the created connections will have positive (excitatory) vs negative (inhibitory) weights.
- **Excitatory Weight Randomizer**: Probability distribution used to randomize excitatory synapse strengths. Enable or disable randomization for excitatory connections.
- **Inhibitory Weight Randomizer**: Probability distribution used to randomize inhibitory synapse strengths. Enable or disable randomization for inhibitory connections.

Note that weights are created in three steps: first the strategy creates connections with initial strengths, then the excitatory/inhibitory ratio is applied, then the two sets of weights are randomized using their respective distributions.

Individual strategies may have additional parameters specific to their connection patterns, such as radius, density, or probability settings.

## Excitatory / Inhibitory Ratio

This panel or dialog changes the ratio of excitatory and inhibitory synapses in a set of weights. A main slider bar determines this percentage of excitatory weights. The two text fields can also be used to set more precise ratios.

This can be thought of as a way of polarizing a set of weights. This is straightforward in the case of nonpolar neurons, which is more common. But when neurons are excitatory or inhibitory the underlying logic is more complex, and attempts to create the requested ratio in a way that respects the [polarity](../neurons/#polarity) of the neurons.
