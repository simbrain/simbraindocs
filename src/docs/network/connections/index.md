---
title: Connection Strategies
layout: default
parent: Networks
has_children: true
nav_order: 180
---

# Connection Strategies

Connection strategies are rules used to create patterns of connections between source and target groups of neurons. They provide a systematic way to establish synaptic connections with specific properties and patterns. All connection strategies set an [excitatory/inhibitory ratio](../networkDialogs#Excitatory-Inhibitory-Ratio) and can randomize weight strengths using probability distributions.

## Quick Connection Workflow (1-2 Trick)

The fastest way to create connections is using the **1-2 trick**:

1. **Select source neurons** and press `1` to mark them as sources
2. **Select target neurons** and press `2` to connect using the default strategy
3. **Press `Shift+2`** to allow self-connections during the 1-2 trick

This uses the default connection strategy set in [Network Preferences](../networkDialogs#Network-Preferences). The default strategy is **All-to-All** but can be changed to any other strategy.

## Connection Methods

Connection strategies can be invoked in several ways:

- **1-2 Trick**: Press `1` then `2` for quick connections using the default strategy
- **Right-click menu**: Select neurons, right-click, and choose from the "Connect neurons" submenu
- **Keyboard shortcuts**: Press `2` for default connections, `3` for custom connection dialogs
- **Synapse groups**: Connection strategies are associated with synapse groups for organized connections

## Available Strategies

Simbrain provides seven connection strategies:

- **[All-to-All](allToAll)**: Connects every source neuron to every target neuron
- **[Distance-Based](distanceBased)**: Connects neurons based on spatial distance with probability decay
- **[One-to-One](oneToOne)**: Connects each source neuron to a single corresponding target neuron
- **[Fixed Degree](fixedDegree)**: Each source neuron connects to a fixed number of target neurons
- **[Radial Gaussian](radialGaussian)**: Gaussian probability distribution based on distance
- **[Radial Probabilistic](radialProbabilistic)**: Probabilistic connections with radial patterns
- **[Sparse](sparse)**: Creates connections with specified density (percentage of possible connections)

## Connection Properties

All connection strategies share common properties:

- **Excitatory/Inhibitory Ratio**: Percentage of excitatory vs inhibitory connections (default: 50%)
- **Weight Randomization**: Excitatory and inhibitory weights can be randomized separately
- **Self-Connections**: Most strategies allow or disallow connections where source equals target
- **Bidirectional Connections**: Some strategies support connections in both directions

## Post-Connection Behavior

After creating connections:
- **Selection**: New synapses are automatically selected for easy editing
- **Editing**: Press `Cmd/Ctrl+E` to edit selected synapses
- **Visibility**: Synapses may be hidden if they exceed the visibility threshold
- **Undo**: All connection operations can be undone using `Cmd/Ctrl+Z`
