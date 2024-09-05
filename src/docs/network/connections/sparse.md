---
title: Sparse Connection
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 100
---

# Sparse Connection

This connection type creates synapse connections in such a way that not all neurons are connected to each other, hence the connections produced are “sparse” as opposed to complete (in [All-to-All](allToAll)).

Density corresponds to a percentage of the total possible connections (0% being no connections and 100% being the same as connecting every neuron to every other neuron). It might be more accurate to call this algorithm a  "variable density connection" since it permits any density of connectivity including those which would not normally be considered "sparse".

The density of a set of connections can be changed "on top of" existing connections. That  is, when the density of a set of weights associated with a connection strategy (for example in a synapse group) is increased, the existing weights are kept and new weights are added. 

<!-- TODO: Add Image --> 

**Density**. What percentage of the total possible connections should be created (0 = no connections; 1 = all possible connections). 

**Equalize Efferents.**  If true, each source neuron will have exactly the same number of outgoing "efferent" synapses. That is, each source will connect to the same number of targets. If you have 10 source neurons and 10 target neurons, and 50% sparsity, then each source neuron will connect to exactly 5 targets.
- True (Fixed case): Each neuron has the same, predetermined number of outgoing connections (efferents), ensuring uniformity.

**Self Connection**. If checked, self connections are allowed.
