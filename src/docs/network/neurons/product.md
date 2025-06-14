---
title: Product
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 160
---

# Product

The **Product** rule computes a neuron's activation as the product of its inputs. This type of multiplicative interaction is used in certain neural architectures, including **Sigma-Pi** and **Long Short-Term Memory** (LSTM) networks.

The update equation depends on whether weights are used:

- Without weights:
  $$
  a = \prod_{i=1}^{N} x_i
  $$

- With weights:
  $$
  a = \prod_{i=1}^{N} x_i \cdot w_i
  $$

Alternatively, in networks using spiking neurons, the post-synaptic response (PSR) is used in place of $$x_i \cdot w_i$$.

If a neuron has no incoming connections, its activation is set to zero. Optional noise can be added to the result.

## Parameters

- **Use Weights**: If enabled, activation is computed using weighted inputs (or post-synaptic responses for spiking neurons). If disabled, raw activations are multiplied.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)

## Add Noise

If this is set to true, random values are added to the activation via a noise generator. The random values are added after the Product activation function is applied. For details how the noise generator works, click [here](../../utilities/randomizers.html).
