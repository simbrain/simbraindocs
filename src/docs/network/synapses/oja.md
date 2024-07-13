---
title: Oja
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 60
---

# Oja

**Hebbian learning** rules suffer from the fact that weights tend to achieve maximum or minimum values. Several variants of Hebbian learning have been introduced to address this issue; **Oja's rule** is one of them.

Oja's rule is a modified Hebbian learning where learning slows as the synapse strength approaches some value *η*. This is achieved by the following formula, in which *ε* is a learning rate, *a<sub>t</sub>* is the post-synaptic activation, *a<sub>s</sub>* is the pre-synaptic activation, *w* is the weight strength, and *η* is the value the sum of squared incoming weights is tending towards:

<!-- TODO --> Add image of equation or latex for equation  

In order for the effect of keeping the sum of squares of weights attaching to a neuron equal to *η*, those weights must all use this rule and have the same value for *η*.

The strength of this synapse is **clipped** so as to remain between the lower and upper bounds specified for this synapse. Note that clipping the values of this type of synapse could interfere with its intended effect. Clipping of the target neuron's activation value could also interfere.

See Peter Dayan and Larry Abbott, *Theoretical Neuroscience,* Cambridge, MA: MIT Press, pp. 290-291.

## Learning Rate

The learning rate *ε*.

## Normalize to

The value the sum of squared incoming weights will tend towards, denoted by *η* above.