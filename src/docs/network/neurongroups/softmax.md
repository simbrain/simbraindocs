---
title: Softmax
layout: default
grand_parent: Networks
parent: Neuron Groups and Collections
has_children: false
nav_order: 80
---

# Softmax Group

A softmax group is a convenience neuron group that provides an alternative way to achieve softmax behavior. Unlike using the [softmax rule](../neurons/softmax) on a neuron array, the softmax group applies its neurons' individual update rules first (typically linear), then normalizes the results using softmax.

The group does not use the softmax rule internally. Instead, it implements its own softmax normalization as a post-processing step. For details on the softmax algorithm and temperature parameter, see the [softmax rule](../neurons/softmax) page.

## How It Works

On each update, the softmax group:
1. Accumulates inputs for all neurons
2. Applies each neuron's individual update rule (typically linear)
3. Applies softmax normalization across all neuron activations as a post-processing step

This ensures the final activations sum to 1 and can be interpreted as a probability distribution. This approach allows you to use regular neurons with their own update rules while still getting softmax normalization.

## Parameters

- **Temperature:** Controls how sharply peaked the softmax distribution is. See the [softmax rule](../neurons/softmax#temperature-parameter) for detailed explanation of this parameter.

## Right Click Menu

Generic right-click items are described on the [neuron group](.) page.
