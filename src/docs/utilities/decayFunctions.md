---
title: Decay Functions
layout: default
parent: Utilities
has_children: false
---

# Decay Functions


Decay functions determine how the influence of an object decreases as the distance from its peak increases. They are typically used in spatial or network-based simulations where entities exert less effect the farther they are from a central point or "peak."

Decay functions return a scaling factor between 0 and 1 based on a given distance. This factor can be interpreted as a probability or as a strength multiplier. Each decay function defines a different shape for this falloff.

## Common Properties

All decay functions in Simbrain share the following parameters:

- **Dispersion**: The radius beyond which the object has no effect on the network. If the distance is outside this radius, the scaling factor becomes zero. This defines the effective range of the decay.

- **Peak Distance**: The center of the decay function where it takes its maximal value. The function is evaluated relative to this distance. 


## Step Decay Function

The Step Decay function maintains full strength until a cutoff point, after which it  drops to zero. It's useful for modeling binary influence zones.

- Returns 1.0 for distances less than or equal to `(peakDistance + dispersion)`
- Returns 0.0 beyond that range
- No gradual falloff

## Linear Decay Function

The Linear Decay function decreases linearly from its peak to zero across the dispersion radius. It is often used when a smooth, predictable drop-off in strength is desired.

- Maximum value at `peakDistance`
- Falls off linearly to 0 at `peakDistance + dispersion`
- Easy to visualize and compute

## Gaussian Decay Function

The Gaussian Decay function models influence using a bell curve. This function is ideal for simulating natural falloff patterns, such as those found in biology or physics.

- Symmetric bell curve centered at `peakDistance`
- Controlled by `dispersion`, which influences the "spread" of the curve
- Smooth, continuous decay with no abrupt cutoffs
