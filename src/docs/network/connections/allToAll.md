---
title: All To All
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 10
---

# All to All Connection

All-to-All connects every source neuron to every target neuron. This is the most standard class of connections for feed-forward networks and is the **default connection strategy** in Simbrain.

## When to Use All-to-All

- **Feed-forward networks**: Standard input-to-hidden-to-output connections
- **Fully connected layers**: Every neuron connects to every neuron in the next layer
- **Recurrent networks**: When source and target neurons are the same
- **Dense connectivity**: When you need maximum information flow between layers

## Quick Usage (1-2 Trick)

1. **Select source neurons** and press `1`
2. **Select target neurons** and press `2`
3. **All connections are created** using All-to-All strategy

## Dialog Properties

**Self-Connections Allowed**: Whether connections where the source and target are the same neuron are allowed. Only applicable if the source and target neurons overlap.

**Bi-directional**: If true, synapses are added in both directions (source→target and target→source).

## Examples

### Feed-Forward Network
- **Input layer** (3 neurons) → **Hidden layer** (4 neurons) = 12 connections
- **Hidden layer** (4 neurons) → **Output layer** (2 neurons) = 8 connections

### Recurrent Network
- **Same layer** (5 neurons) with self-connections = 25 connections
- **Same layer** (5 neurons) without self-connections = 20 connections

## Performance Considerations

- **Connection count**: Grows as source × target neurons
- **Large networks**: May become computationally expensive
- **Memory usage**: Each connection requires memory storage
- **Visualization**: Many connections can clutter the display

## Related Strategies

- **[Sparse](sparse)**: For partial connectivity with controlled density
- **[Distance-Based](distanceBased)**: For spatially-organized connections
- **[One-to-One](oneToOne)**: For direct neuron-to-neuron mapping
