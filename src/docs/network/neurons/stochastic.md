---
title: Stochastic Generator
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 210
---

# Stochastic Generator

This generator (a type of **spiking unit**) fires a spike randomly with a fixed probability, ignoring input. When a Stochastic Neuron fires, its activation becomes equal to its **upper bound**, otherwise resting at its **lower bound**.

## Firing Probability

This parameter determines the probability that the generator will fire, causing it to have an activation equal to its upper bound, given an iteration.