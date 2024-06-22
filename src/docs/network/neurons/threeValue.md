---
title: Three Value
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 140
---

# Three Value

The Three Value neuron-type is much like a **binary neuron**, in that its activation is determined by a threshold. In a Three Value neuron, however, there are two unique thresholds instead of just one. If the **weighted input** plus the bias term exceeds the Lower Threshold, the activation is set to the Lower Value. Likewise, if the Upper Threshold is exceeded, the activation is set to the Upper Value. If neither the Upper Threshold nor the Lower Threshold are exceeded, the activation is set to the Middle Value.

## Bias

A fixed amount of input to the node. This value is added to the weighted input when determining the activation.

## Lower Threshold

If the weighted input plus the bias is less than this value, the activation is set to the Lower Value.

## Upper Threshold

If the weighted input plus the bias is greater than this value, the activation is set to the Upper Value.

## Lower Value

The activation is set to this value if the weighted input plus the bias exceeds the Lower Threshold.

## Middle Value

If the weighted input plus the bias does not exceed the Upper or Lower Thresholds, then the activation is set to this value.

## Upper Value

If the weighted input plus the bias is greater than the Upper Threshold, then the activation is set to this value.