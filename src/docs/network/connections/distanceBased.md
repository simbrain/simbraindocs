---
title: Distance Based
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 20
---

# Distance Based

Connect source neurons to target neurons with a probability proportional to a distance function. The amount to decay connection probabilties is a function of pixel distance. At the `peak` of the decay function connections are made with probability 1, and this probabiliy decays to 0 after a radius of `dispersion` pixels. 

For example, with a linear decay function, target neurons on top of a source neuron will be guaranteed to make a connection and as target neurons are farther away from the source neuron the probability of making a connection drops off to 0.


<!-- Link to distance functions.  -->
