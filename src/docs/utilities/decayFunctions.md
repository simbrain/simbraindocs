---
title: Decay Functions
layout: default
parent: Utilities
has_children: false
---

# Decay Functions

Decay functions determine how the influence of an object decreases as the distance from its peak increases. They are typically used in spatial or network-based simulations where entities exert less effect the farther they are from a central point or peak.

Decay functions return a scaling factor between 0 and 1 based on a given distance. This factor can be interpreted as a probability or as a strength multiplier. Each decay function defines a different shape for this falloff.

## Common Properties


All decay functions in Simbrain share the following parameters:

- **Dispersion**: The radius beyond which the object has no effect on the network. If the distance is outside this radius, the scaling factor becomes zero. This defines the effective range of the decay.

- **Peak Distance**: The center of the decay function where it takes its maximal value. The function is evaluated relative to this distance. 


## Step Decay Function

The Step Decay function maintains full strength until a cutoff point, after which it drops to zero. This makes it useful for modeling binary influence zones where an object either has full effect or no effect at all. The function returns 1.0 for distances less than or equal to peakDistance + dispersion and returns 0.0 beyond that range, with no gradual falloff in between.

## Linear Decay Function

The Linear Decay function decreases linearly from its peak to zero across the dispersion radius. It is often used when a smooth, predictable drop-off in strength is desired. The function reaches its maximum value at peakDistance, then falls off linearly to 0 at peakDistance + dispersion. This linear relationship makes it easy to visualize and compute.

## Gaussian Decay Function

The Gaussian Decay function models influence using a bell curve, making it ideal for simulating natural falloff patterns such as those found in biology or physics. The function creates a symmetric bell curve centered at peakDistance with smooth, continuous decay and no abrupt cutoffs.

The dispersion parameter equals 2 standard deviations of the Gaussian curve. At distance peakDistance + dispersion, the scaling factor is approximately 0.135 (13.5% of peak). At distance peakDistance + dispersion/2 (1 standard deviation), the scaling factor is approximately 0.606 (60.6% of peak). This parameterization provides an intuitive way to control the spread of the decay.
