---
title: Distance Functions
layout: default
parent: Networks
has_children: false
nav_order: 185
---

# Distance Functions

Distance functions (also called decay functions) control how connection probability or effect strength varies with spatial distance between neurons or objects in Simbrain. They are used in distance-based connections, odor world sensors, and other spatially-organized components.

## How Distance Functions Work

Distance functions take a spatial distance as input and return a scaling factor between 0 and 1. This scaling factor can represent:

- **Connection probability** in distance-based network connections
- **Signal strength** in odor world sensors and effectors
- **Interaction strength** between spatially distributed elements

All distance functions have two key parameters:

- **Peak Distance**: The distance where the function reaches its maximum value (usually 1.0)
- **Dispersion**: The effective range of the function - beyond this distance, the scaling factor is typically 0

## Available Distance Functions

### Linear Decay Function

The linear decay function provides a straight-line decrease from peak to zero.

**Formula**: `scaling = max(0, 1 - distanceFromPeak / dispersion)`

**Characteristics**:
- Linear decrease from peak value to zero
- Reaches zero exactly at the dispersion distance
- Simple and predictable behavior
- Good for uniform neighborhood effects

**Use Cases**:
- Uniform connection neighborhoods
- Simple spatial relationships
- Braitenberg vehicle sensors

### Gaussian Decay Function

The Gaussian (exponential) decay function provides smooth, bell-curve-style decay.

**Formula**: `scaling = exp(-0.5 * ((distance - peakDistance) / (dispersion/2))^2)`

**Characteristics**:
- Smooth, bell-shaped curve
- Standard deviation = dispersion / 2
- Never quite reaches zero (asymptotic)
- Most natural-looking spatial decay

**Use Cases**:
- Natural spatial relationships
- Smooth connection probability gradients
- Biological modeling where smooth falloff is important

### Step Decay Function

The step function provides binary on/off behavior based on distance.

**Formula**: `scaling = distanceFromPeak <= dispersion ? 1.0 : 0.0`

**Characteristics**:
- Binary output: either 1.0 or 0.0
- Sharp cutoff at dispersion distance
- No gradual transition
- Simple binary spatial regions

**Use Cases**:
- Discrete spatial regions
- Binary connection neighborhoods
- Sharp boundaries in spatial effects

## Mathematical Properties

### Distance Calculation

Distance is calculated as Euclidean distance in pixels:
```
distance = sqrt((x2 - x1)^2 + (y2 - y1)^2)
```

### Distance from Peak

The actual input to decay functions is the distance from the peak:
```
distanceFromPeak = abs(distance - peakDistance)
```

When peak distance is 0 (default), this simplifies to just the distance.

## Parameter Guidelines

### Choosing Peak Distance
- **0 (default)**: Maximum effect at the same location
- **Positive values**: Maximum effect at a specific distance away
- **Use cases**: Surround inhibition, ring-shaped effects

### Choosing Dispersion
- **Small values (< 50)**: Tight, local effects
- **Medium values (50-200)**: Moderate neighborhoods
- **Large values (> 200)**: Wide-reaching effects

### Function Selection
- **Linear**: When you want predictable, uniform decay
- **Gaussian**: When you want natural, smooth transitions
- **Step**: When you want discrete regions or binary effects

## Usage Examples

### Distance-Based Connections
```kotlin
val distanceConnection = DistanceBased(
    decayFunction = GaussianDecayFunction(dispersion = 100.0)
)
```

### Odor World Sensors
```kotlin
val sensor = ObjectSensor().apply {
    decayFunction = LinearDecayFunction(dispersion = 70.0)
}
```

### Custom Decay Application
```kotlin
// Apply decay to synapse strengths based on spatial distance
synapses.decayStrengthBasedOnLength(GaussianDecayFunction(80.0))
```

## Applications in Simbrain

Distance functions are used throughout Simbrain for spatial modeling:

- **Network Connections**: Distance-based and radial connection strategies
- **Odor World**: Smell source decay, sensor ranges, effector ranges
- **Weight Decay**: Spatial decay of synapse strengths
- **Spatial Simulations**: Any simulation requiring distance-dependent effects

Understanding distance functions is essential for creating realistic spatial models and networks in Simbrain.
