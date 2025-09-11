---
title: Distance Based
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 20
---

# Distance Based Connection

Distance-based connections create synapses between neurons with a probability that depends on their spatial distance. This is useful for spatially-organized networks where nearby neurons should be more likely to connect than distant ones.

## How It Works

The connection probability is determined by a **decay function** that takes the Euclidean distance between neurons as input:

- **Peak probability = 1.0** at distance 0 (same location)
- **Probability decays** as distance increases
- **Zero probability** beyond the dispersion radius

## Dialog Properties

**Distance Function**: The decay function that determines connection probability based on distance. Common options include:

- **Gaussian**: Smooth bell curve with peak at distance 0
- **Linear**: Linear decay from 1 to 0
- **Exponential**: Exponential decay function
- **Custom**: User-defined decay functions

## Decay Function Parameters

Most decay functions have these parameters:

- **Peak**: Maximum connection probability (usually 1.0)
- **Dispersion**: Distance at which probability reaches 0
- **Shape**: Controls the curve shape (Gaussian sigma, linear slope, etc.)

## Examples

### Gaussian Decay
- **Peak = 1.0** at distance 0
- **Dispersion = 100 pixels**
- **Result**: Smooth probability curve, most connections within 100 pixels

### Linear Decay  
- **Peak = 1.0** at distance 0
- **Dispersion = 50 pixels**
- **Result**: Linear drop-off, no connections beyond 50 pixels

## Spatial Network Examples

### 2D Grid Network
```
A---B---C
|   |   |
D---E---F
|   |   |
G---H---I
```
- **Neuron E** connects to immediate neighbors (A,B,C,D,F,G,H,I)
- **Neuron A** connects to B and D with high probability
- **Neuron A** connects to F and I with low probability

### Radial Pattern
- **Center neuron** connects to all others with decreasing probability
- **Outer neurons** connect mainly to nearby neighbors
- **Creates hub-and-spoke** connectivity pattern

## Related Strategies

- **[Sparse](sparse)**: For density control without spatial bias
- **[Radial Gaussian](radialGaussian)**: Specialized Gaussian distance function
- **[All-to-All](allToAll)**: For complete connectivity regardless of distance
