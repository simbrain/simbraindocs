---
title: Connection Strategies
layout: default
parent: Networks
has_children: true
nav_order: 90
---

# Connection Strategies

Connection strategies are rules used to create patterns of connections between source and target groups of neurons. They provide a systematic way to establish synaptic connections with specific properties and patterns. All connection strategies set an [excitatory/inhibitory ratio](#excitatory--inhibitory-ratio) and can randomize weight strengths using probability distributions.

## Quick Connection Workflow

The fastest way to create connections is using the [1-2 and 1-3 tricks](../buildingBasics#quick-connect-1-2-and-1-3-tricks). See the [Building Basics](../buildingBasics#quick-connect-1-2-and-1-3-tricks) page for a complete explanation.

## Connection Methods

Connection strategies can be invoked in several ways:

- [1-2 and 1-3 tricks](../buildingBasics#quick-connect-1-2-and-1-3-tricks): Quick keyboard shortcuts for connecting neurons
- Right-click menu: Select neurons, right-click, and choose from the "Connect neurons" submenu
- Synapse groups: Connection strategies are associated with synapse groups for organized connections


## Configurable Connection Strategy

When you use the 1-3 trick, Simbrain uses the connection strategy configured in [Network Preferences](../ui/networkPreferences). By default this is [All-to-All](allToAll) with 50% excitatory and 50% inhibitory connections.

You can change this strategy in [Network Preferences](../ui/networkPreferences) to use any available strategy (Sparse, Distance-Based, Fixed Degree, etc.) with your preferred excitatory/inhibitory ratio.

## Common Properties

All connection strategies share these properties for controlling weight polarity and randomization:

- **Excitatory/Inhibitory Ratio**: Percentage of connections that are excitatory vs inhibitory. This setting applies to strategies that use [polarity](../neurons/#polarity) (most strategies). The ratio determines how many of the created connections will have positive (excitatory) vs negative (inhibitory) weights.
- **Excitatory Weight Randomizer**: Probability distribution used to randomize excitatory synapse strengths. Enable or disable randomization for excitatory connections.
- **Inhibitory Weight Randomizer**: Probability distribution used to randomize inhibitory synapse strengths. Enable or disable randomization for inhibitory connections.

Note that weights are created in three steps: first the strategy creates connections with initial strengths, then the excitatory/inhibitory ratio is applied, then the two sets of weights are randomized using their respective distributions.

Individual strategies may have additional parameters specific to their connection patterns, such as radius, density, or probability settings.

For more information on how connection strategies interact with weight adjustment, see [Weight Initialization](../weightInitialization).

## Excitatory / Inhibitory Ratio

This panel or dialog changes the ratio of excitatory and inhibitory synapses in a set of weights. A main slider bar determines this percentage of excitatory weights. The two text fields can also be used to set more precise ratios.

This can be thought of as a way of polarizing a set of weights. This is straightforward in the case of nonpolar neurons, which is more common. But when neurons are excitatory or inhibitory the underlying logic is more complex, and attempts to create the requested ratio in a way that respects the [polarity](../neurons/#polarity) of the neurons.
