---
title: STDP
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 90
---

# Spike Timing Dependent Plasticity (STDP)

**Spike Timing Dependent Plasticity** is a variant on the **Hebb rule** for synapses between spiking neurons, where the relative timing of pre and post-synaptic spikes determines whether the synapse is strengthened or weakened. When a pre-synaptic neuron spikes before the post-synaptic neuron, the weight is strengthened (this is **long term potentiation** or "LTP"). When the pre-synaptic spike occurs after the post-synaptic spike, the weight is weakened (this is **long term depression** or "LTD").

$$
\Delta w_{ij} = \eta W_{+/-} \exp \left( -\frac{|u|}{\tau_{+/-}} \right)
$$

where:

$$
u = t_{post} - t_{pre}
$$

Such that LTP occurs when the post-synaptic cell fires after the pre-synaptic cell and vice versa for LTD. The sign of $\Delta w_{ij}$ in this case depends on the sign of $w_{ij}$ such that inhibitory synapses also increase in absolute value under the same conditions as excitatory synapses. This window can be reversed if the anti-Hebbian flag is set to true, i.e., anti-causal relationships will produce LTP and causal relationships will produce LTD.

Note that if the post and/or pre-synaptic neuron is not spiking, then this behaves like a clamped synapse. However, this is not recommended and can harm performance. STDP assumes that both the source and target neurons are spiking neurons.

## Time constant ($$\tau_{+/-}$$)

Time course of plasticity for LTP and LTDP, determines how quickly LTP/LTD decays relative to the temporal distance between the pre and post-synaptic spikes.

## W +/-

Magnitude of change in synaptic efficacy for LTP and LTD. Also called A+/A-.

## Learning rate ($$\eta$$)

Multiplied by delta-w in every time step to control how quickly the synapse changes.

## Sources

Source: Jean-Philippe Thivierge and Paul Cisek (2008), **Nonperiodic Synchronization in Heterogeneous Networks of Spiking Neurons**. *Journal of Neuroscience.*  
Also drew on this **Scholarpedia article on STDP**.