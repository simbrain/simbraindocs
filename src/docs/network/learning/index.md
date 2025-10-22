---
title: Learning
layout: default
parent: Networks
has_children: true
nav_order: 40
---

# Learning

This section covers the various approaches to training and evolving neural networks in Simbrain. Networks can learn through multiple mechanisms, from local synaptic learning rules to global optimization algorithms.

## Overview

Simbrain supports several learning paradigms:

- **[Supervised Learning](supervisedLearning)**: Training networks using input-output pairs with algorithms like backpropagation. Networks learn to map specific inputs to desired outputs through iterative weight adjustments. See also [Training Parameters](trainingParameters) for details on configuring training algorithms, and [Supervised Models](supervisedModels) for a flexible approach to training arbitrary network structures.

- **[Unsupervised Learning](unsupervisedLearning)**: Networks learn patterns and structure from input data without explicit target outputs through competitive learning, self-organizing maps, and other approaches.

- **Local Learning Rules**: Synaptic plasticity rules like [Hebbian learning](https://en.wikipedia.org/wiki/Hebbian_theory), STDP, and Oja's rule that operate locally at individual [synapses](../synapses/) based on pre- and post-synaptic activity. These rules provide biologically plausible learning mechanisms.

- **[Evolutionary Algorithms](evolution)**: Genetic algorithms that evolve network structures and weights across generations to optimize fitness functions. These methods can discover novel solutions and optimize complex behaviors.

- **Scripting**: Other learning paradigms such as reinforcement learning can be implemented using [scripting](../../simulations).

Each approach has different strengths and use cases. Supervised learning excels at function approximation and pattern recognition. Unsupervised learning discovers hidden structure in data. Local rules capture biological plausibility and self-organization. Evolutionary methods can discover novel solutions without explicit programming.

