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

Sparse  has two options for variable density connections: probabilistic connections and fixed number of efferents. 
<!-- TODO: Add Image --> 


**Density**. What percentage of the total possible connections should be created (0 = no connections; 1 = all possible connections). 

**Equalize Efferents.** 
- True (Probabilistic case). In this case connections will be generated with some probability. Consider the neuron $$s_i \in S_N$$ where $$S_N$$ is the set of neurons given as the source of the to be generated connections (the synapses that will be generated would be considered to be the axons of these neurons), and where $$i \in { 1, ... , N }$$ for $$N$$ members of set $$S_N$$. Likewise consider the neuron $$t_j \in TM$$ where $$T_M$$ is the set of neurons given as the targets of the to be generated connections, and where $$j \in { 1, ... , M }$$ for $$M$$ members of set $$T_M$$. The connection density parameter $$ρ \in (0, 1]$$, simply represents the probability that a connection will be generated between the neurons $$s_i$$ and $$t_j$$ for all $$i, j$$. Because the selection process is stochastic, there is no guarantee that the number of synapses generated between $$S_N$$ and $$T_M$$ will exactly reflect what would be expected given the density parameter, i.e. it **is not** guaranteed that this algorithm will generate exactly $$\rho \times N \times M$$ connections. If $$S_N ≡ T_M$$, and it has been specified that self connections (synapses where the source and target neurons are the same) are not allowed, then this value would be $$\rho \times N \times (N -1)$$.
- False (fixed case). This method also has a connection density parameter, as well as another parameter $$k \in { 1, \dots , M}$$, which is directly tied to $$\rho$$. This $$k$$ parameter determines the exact number of efferent (outgoing) connections which will be generated for each source neuron and comes into play when the equalize efferents parameter is set to true, which will connect the neuron such that each source neuron has the exact same number of outgoing connections. This algorithm is guaranteed to generate $$k \times M$$ synaptic connections $$(k \times (N - 1)$$ connections if $$S_N ≡ T_M$$ and self connections are not allowed) between $$S_N$$ and $$T_M$$.

**Self Connection**. If checked, self connections are allowed.
