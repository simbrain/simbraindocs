---
title: Learning
layout: default
parent: Networks
has_children: true
nav_order: 30
---

# Learning

This section covers the various approaches to training and evolving neural networks in Simbrain. Networks can learn through multiple mechanisms, from local synaptic learning rules to global optimization algorithms.

## Overview

Simbrain supports several learning paradigms:

- **Supervised Learning**: Training networks using input-output pairs with algorithms like backpropagation. Networks learn to map specific inputs to desired outputs through iterative weight adjustments.

- **Supervised Models**: A flexible framework for training arbitrary collections of neuron arrays, groups, or collections linked by weight matrices or synapse groups. Supports immediate learning for real-time experimentation.

- **Local Learning Rules**: Synaptic plasticity rules like Hebbian learning, STDP, and Oja's rule that operate locally at individual synapses based on pre- and post-synaptic activity.

- **Evolutionary Algorithms**: Genetic algorithms that evolve network structures and weights across generations to optimize fitness functions.

Each approach has different strengths and use cases. Supervised learning excels at function approximation and pattern recognition. Local rules capture biological plausibility and self-organization. Evolutionary methods can discover novel solutions and optimize complex behaviors.

