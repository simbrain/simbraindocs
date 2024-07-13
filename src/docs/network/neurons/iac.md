---
title: IAC
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 80
---

# IAC Neuron

These nodes get their name from the IAC or ["Inter-Active Competition"](https://en.wikipedia.org/wiki/Interactive_activation_and_competition_networks) network which John McClelland and David Rummelhart developed in the 1980's and featured later as a prominent example in their book Parallel Distributed Processing (1988). IAC networks continue to be used today, in particular to study psychological processes. Activation of these nodes is often interpreted as degree of belief in some hypothesis, while connection strengths represent evidentiary relationships between these beliefs.

The basic dynamics of an IAC neuron are similar to the [decay neurons](decay.html). The user sets a resting value and a decay rate, and the neuron will decay towards that resting value proportionally to the decay rate. IAC neurons change activation as follows:

<!-- TODO --> Add equation

where activation level is *a*, *W* is **weighted inputs**, *u* is upper bound, *l* is lower bound, *r* is the resting value, and λ is the decay rate.

## Decay Rate

The rate at which activation decays to its resting value, denoted by λ.

## Rest

The resting value *r* which the activation decays to.

## Add Noise

If this is set to true, random values are added to the activation via a noise generator. The random values are added after the sigmoidal activation function is applied. For details on how the noise generator works, click **here**.


