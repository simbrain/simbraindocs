---
title: Decay
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Decay

The Decay rule models neurons that return toward a baseline over time, either by a fixed amount or by a fraction of the remaining distance. At each time step, the neuron's activation is updated based on input and then decayed. The direction of decay is determined by whether the current activation is above or below the baseline.

Let $$a$$ be the current activation and $$b$$ the baseline. The decay behavior follows:

- Relative decay:

  $$
  \Delta a = \text{decayFraction} \cdot |a - b|
  $$

- Absolute decay:

  $$
  \Delta a = \text{decayAmount}
  $$

The value $$\Delta a$$ is added or subtracted as needed to bring activation closer to the baseline. If noise is enabled, random perturbation is applied after decay. Clipping can be enabled to constrain the activation within a fixed range.

## Parameters

- **Update Type**: Selects between relative and absolute decay behavior.
- **Decay Amount**: The fixed amount subtracted from the activation each step if absolute decay is used.
- **Decay Fraction**: The proportion of the distance to the baseline used for each decay step if relative decay is used.
- **Base Line**: The value the neuron decays toward.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)

