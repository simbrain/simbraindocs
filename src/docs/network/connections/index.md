---
title: Connection Strategies
layout: default
parent: Networks
has_children: true
nav_order: 90
---

# Connection Strategies

Connection strategies are rules used to create patterns of connections between source and target groups of neurons. They provide a systematic way to establish synaptic connections with specific properties and patterns. All connection strategies set an [excitatory/inhibitory ratio](#excitatoryinhibitory-ratio) and can randomize weight strengths using probability distributions.

## Quick Connection Workflow

The fastest way to create connections is using the [1-2 and 1-3 tricks](../buildingBasics#quick-connect-1-2-and-1-3-tricks). See the [Building Basics](../buildingBasics#quick-connect-1-2-and-1-3-tricks) page for a complete explanation.

Tip: After creating connections, the newly created synapses remain selected, allowing you to immediately edit them with `Cmd/Ctrl-E`, randomize them with `R`, or open the [synapse adjustment panel](../synapses/synapseAdjustment) with `Cmd/Ctrl-R`.

## Connection Methods

Connection strategies can be invoked in several ways:

- [1-2 and 1-3 tricks](../buildingBasics#quick-connect-1-2-and-1-3-tricks): Quick keyboard shortcuts for connecting neurons
- Right-click menu: Select neurons, right-click, and choose from the "Connect neurons" submenu
- Synapse groups: Connection strategies are associated with synapse groups for organized connections

## Configurable Connection Strategy

When you use the 1-3 trick, Simbrain uses the connection strategy configured in [Network Preferences](../ui/networkPreferences). By default this is [All-to-All](allToAll) with 50% excitatory and 50% inhibitory connections.

You can change this strategy in [Network Preferences](../ui/networkPreferences) to use any available strategy (Sparse, Distance-Based, Fixed Degree, etc.) with your preferred excitatory/inhibitory ratio.

## Two-Stage Connection Process

Connection strategies work in two integrated stages:

1. **Connection Creation**: The strategy determines which neurons to connect based on its algorithm (all-to-all, distance-based, sparse, etc.)
2. **Weight Initialization**: A weight initializer sets the initial strength values for the created connections

This separation allows you to independently control the topology (which neurons connect) and the weight values (how strong those connections are).

## Weight Initializers

After a connection strategy creates synapses, a weight initializer sets their strengths. Three types are available:

### Constant

Sets all excitatory synapses to a fixed positive value and all inhibitory synapses to a fixed negative value. This is the simplest option and useful when you want uniform connection strengths.

- **Excitatory Strength**: The strength value for all excitatory synapses (default 1.0)
- **Inhibitory Strength**: The strength value for all inhibitory synapses (default -1.0)

Use constant initialization when you want simple, uniform connection strengths or plan to adjust weights later through learning rules or manual editing.

### Random

Initializes synapse weights using probability distributions, allowing for variability in connection strengths.

- **Randomize Excitatory**: Whether to randomize excitatory connection strengths. When disabled, uses the default excitatory strength (1.0)
- **Randomize Inhibitory**: Whether to randomize inhibitory connection strengths. When disabled, uses the default inhibitory strength (-1.0)
- **Excitatory Randomizer**: The [probability distribution](../../utilities/randomizers) used to generate excitatory weight values
- **Inhibitory Randomizer**: The [probability distribution](../../utilities/randomizers) used to generate inhibitory weight values

Common distributions include Normal (Gaussian), Uniform, and Exponential. The absolute value of sampled values is used to ensure correct polarity. Use random initialization when you want variability in connection strengths to model biological diversity or avoid symmetries that might affect learning dynamics.

### Distance-Based

Scales synapse weights based on the spatial distance between source and target neurons. Closer neurons receive stronger connections.

- **Decay Function**: The [decay function](../../utilities/decayFunctions) that determines how weight strength decreases with distance
- **Base Strength**: The maximum weight strength at the peak distance (typically distance 0)

For each synapse, the final weight is calculated as: `weight = baseStrength × decayFunction(distance)`. Common decay functions include Gaussian (smooth drop-off), Linear (linear decrease), and Step (constant within radius). Use distance-based initialization when modeling spatially organized networks where nearby neurons should have stronger influence.

## Excitatory/Inhibitory Ratio

All connection strategies set the percentage of connections that should be excitatory vs inhibitory. This setting only affects neurons with Both polarity (the default). Pre-polarized neurons (explicitly set to Excitatory or Inhibitory) will always maintain their polarity regardless of this setting.

Every connection strategy automatically respects the polarity of source neurons:
- Synapses from Excitatory neurons are always positive
- Synapses from Inhibitory neurons are always negative  
- Synapses from Both polarity neurons (default) follow the excitatory/inhibitory ratio

When all source neurons have Both polarity (the default), the ratio straightforwardly sets what percentage of weights will be positive (excitatory) vs negative (inhibitory). Most workflows use non-polar neurons, where the excitatory/inhibitory ratio setting controls the balance of positive and negative weights.

When source neurons have explicit Excitatory or Inhibitory polarity, the strategy attempts to achieve the requested ratio while respecting individual neuron polarities. Pre-polarized neurons always maintain their sign, and the ratio is achieved using only Both polarity neurons. For example, if you have 5 Excitatory neurons, 5 Inhibitory neurons, and 10 Both neurons, and set the ratio to 60% excitatory, the 5 Excitatory neurons contribute 5 positive connections, the 5 Inhibitory neurons contribute 5 negative connections, and the 10 Both neurons are split 7 excitatory, 3 inhibitory to achieve 12/20 = 60% overall.

## Handling Duplicate Connections

Connection strategies handle existing connections differently depending on the context:

**Free Weights:**
When applying a connection strategy to free neurons, existing connections are not overwritten. The strategy creates new connections without checking for duplicates. If you want to replace existing connections, you must manually delete them first. This gives you control to incrementally add connections and fine-tune your network.

**Synapse Groups:**
When applying a connection strategy to a synapse group, all existing synapses in the group are deleted first, and the strategy is applied fresh. This ensures the synapse group always reflects the current strategy settings.

**Sparse Strategy (Special Case):**
The Sparse strategy is designed to allow incremental adjustments to connection density while preserving existing weights:

- Free weights: Sparse can add new connections or remove existing ones as needed to reach the target density. This is the only strategy that may remove existing free weights.
- Synapse groups: Sparse maintains awareness of current connections and adjusts them incrementally rather than replacing everything. When increasing density, it adds only the additional connections needed. When decreasing density, it removes connections to reach the target.

This special behavior makes Sparse ideal for iteratively tuning network connectivity without losing carefully configured weights.
