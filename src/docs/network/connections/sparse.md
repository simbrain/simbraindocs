---
title: Sparse Connection
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 100
---

# Sparse Connection

Sparse connections create a subset of all possible connections between source and target neurons, controlled by a density parameter. This is useful for creating networks with controlled connectivity that is neither fully connected nor completely random.

## How It Works

Sparse connections work by:
1. **Calculating total possible connections** (source × target neurons)
2. **Applying density percentage** to determine how many to create
3. **Randomly selecting** which specific connections to make
4. **Optionally equalizing** the number of connections per source neuron

## Dialog Properties

### Density
**What percentage of total possible connections to create:**
- **0.0** = No connections
- **0.1** = 10% of possible connections (sparse)
- **0.5** = 50% of possible connections (moderate)
- **1.0** = All possible connections (same as All-to-All)

### Equalize Efferents
**If true, each source neuron gets exactly the same number of outgoing connections:**

**Example 1: Equalized**
- 10 source neurons, 10 target neurons, 50% density
- Each source connects to exactly 5 targets
- Total: 50 connections

**Example 2: Not Equalized**
- 10 source neurons, 10 target neurons, 50% density  
- Each source connects to ~5 targets on average
- Some sources may have 3, others 7 connections
- Total: ~50 connections

### Self Connection
**Whether connections where source = target are allowed:**
- **Checked**: Self-connections possible
- **Unchecked**: No self-connections

## Examples

### Sparse Feed-Forward Network
- **Input layer**: 100 neurons
- **Hidden layer**: 50 neurons  
- **Density**: 20%
- **Result**: 1,000 connections (20% of 5,000 possible)

### Sparse Recurrent Network
- **Layer**: 20 neurons
- **Density**: 30%
- **Self-connections**: Allowed
- **Result**: 120 connections (30% of 400 possible)

## Advanced Features

### Dynamic Density Changes
- **Increase density**: New connections added to existing ones
- **Decrease density**: Connections removed randomly
- **Preserves existing**: Current connections remain intact

### Equalization Benefits
- **Balanced connectivity**: Each source has same outgoing degree
- **Predictable performance**: Consistent computation per neuron
- **Structured randomness**: Random but fair distribution

## Related Strategies

- **[All-to-All](allToAll)**: For complete connectivity (density = 1.0)
- **[Distance-Based](distanceBased)**: For spatially-biased sparse connections
- **[Fixed Degree](fixedDegree)**: For exact connection counts per neuron
