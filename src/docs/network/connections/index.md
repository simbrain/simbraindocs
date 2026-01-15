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

## Common Properties

All connection strategies share these properties:

### Weight Initializer

Determines how synapse weights are initialized after connections are created. Available options include Constant (fixed values), Random (probability distributions), and Distance-Based (scales by neuron distance). See [Weight Initialization](../weightInitialization) for detailed information about each type.

### Excitatory/Inhibitory Ratio

The percentage of connections that should be excitatory vs inhibitory. This setting only affects neurons with Both polarity (the default). Pre-polarized neurons (explicitly set to Excitatory or Inhibitory) will always maintain their polarity regardless of this setting.

How it works:
- **Non-polar neurons (default)**: The ratio determines how many connections will have positive (excitatory) vs negative (inhibitory) weights
- **Pre-polarized neurons**: Excitatory neurons always create positive weights; Inhibitory neurons always create negative weights, ignoring the ratio
- **Mixed populations**: The strategy attempts to achieve the requested ratio using only the non-polar neurons

The [Distance Based](distanceBased) strategy can optionally use neuron polarity in its connection logic (polarity mode), where different decay functions are applied based on source and target neuron polarity.

Individual strategies may have additional parameters specific to their connection patterns, such as radius, density, or probability settings.

## Understanding Neuron Polarity

Connection strategies interact with neuron [polarity](../neurons/#polarity) in two ways:

### All Strategies Respect Polarity

Every connection strategy automatically respects the polarity of source neurons:
- Synapses from Excitatory neurons are always positive.
- Synapses from Inhibitory neurons are always negative.  
- Synapses from Both polarity neurons (default) follow the excitatory/inhibitory ratio

This happens automatically at the synapse level. You cannot override a neuron's polarity by changing the excitatory/inhibitory ratio.

### Some Strategies Use Polarity

The [Distance Based](distanceBased) strategy can optionally use neuron polarity in its connection logic when polarity mode is enabled. In this mode, separate decay functions are used for each polarity combination (EE, EI, IE, II), affecting not just weight signs but also connection topology.

### Default Behavior (Non-Polar)

Most workflows use non-polar neurons (Both polarity), where the excitatory/inhibitory ratio setting controls the balance of positive and negative weights. This is the simplest and most common usage pattern.

## Excitatory / Inhibitory Ratio Details

The excitatory/inhibitory ratio interface provides a slider and text fields to set the percentage of excitatory connections. 

**Simple Case (Non-Polar Neurons):**
When all source neurons have Both polarity (the default), this straightforwardly sets what percentage of weights will be positive (excitatory) vs negative (inhibitory).

**Complex Case (Pre-Polarized Neurons):**
When source neurons have explicit Excitatory or Inhibitory polarity, the strategy attempts to achieve the requested ratio while respecting individual neuron polarities:
- Pre-polarized neurons always maintain their sign
- The ratio is achieved using only Both polarity neurons
- If the requested ratio is impossible (e.g., 100% excitatory when all neurons are Inhibitory), the pre-polarized neurons take precedence

For example, if you have 5 Excitatory neurons, 5 Inhibitory neurons, and 10 Both neurons, and set the ratio to 60% excitatory, the 5 Excitatory neurons contribute 5 positive connections, the 5 Inhibitory neurons contribute 5 negative connections, and the 10 Both neurons are split 7 excitatory, 3 inhibitory to achieve 12/20 = 60% overall.
