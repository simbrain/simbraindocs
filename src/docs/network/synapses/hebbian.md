---
title: Hebbian
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 30
---

# Hebbian

This type of synapse implements **Hebbian learning**, where the change of the synapse is proportional to the product of the activation of the source neuron *a<sub>s</sub>* and target neuron *a<sub>t</sub>*:

<!-- TODO --> Add image of equation or latex for equation  

The strength of this synapse is **clipped** so as to remain between the lower and upper bounds specified for this synapse.

In effect, neurons that "fire together, wire together."

Note that in most cases synapses of this type will rapidly achieve their maximum or minimum value. To prevent this, a very small learning rate can be used, or after sufficient training the weights can be **clamped**. Other learning rules and networks attempt to overcome this limitation of Hebbian learning.

## Learning Rate

This value changes the rate of the change of the synapse, denoted by epsilon in the equation above.