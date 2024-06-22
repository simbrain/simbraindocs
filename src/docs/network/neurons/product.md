---
title: Product
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 110
---

# Product Neuron

Activation is some variant of a product of incoming activations. They are used in **Long Short Term Memory** networks. Also see the discussion of Sigma Pi units in the original **PDP Volumes**.

<!-- TODO --> Use math package to make this nice

## Use Weights

If false (the default case), activation is a product of incoming activations.
If true, activation is a product of incoming activation / weight products, or (in the case of **spiking neurons**) post-synaptic-responses (see **the spike responder** docs).

## Add Noise

If this is set to true, random values are added to the activation via a noise generator. The random values are added after the Product activation function is applied. For details how the noise generator works, click [here](../../utilities/randomizers.html).
