---
title: STDP
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 90
---

# STDP Rule

**[Spike Timing Dependent Plasticity (STDP)](https://en.wikipedia.org/wiki/Spike-timing-dependent_plasticity)** is a variant of the **[Hebbian rule](hebbian.md)** specifically for synapses between spiking neurons. In STDP, the relative timing of pre- and post-synaptic spikes determines whether the synapse is strengthened ([long-term potentiation](https://en.wikipedia.org/wiki/Synaptic_plasticity#Long-term_potentiation), LTP) or weakened ([long-term depression](https://en.wikipedia.org/wiki/Synaptic_plasticity#Long-term_depression), LTD).  

When the pre-synaptic neuron spikes before the post-synaptic neuron, the synapse is strengthened (LTP). When the pre-synaptic neuron spikes after the post-synaptic neuron, the synapse is weakened (LTD).  
The update depends on the spike timing difference $$ u = t_{post} - t_{pre} $$:  

$$
\Delta w = \eta W_{+/-} \exp \left( -\frac{|u|}{\tau_{+/-}} \right)
$$  

where:  
- *η* is the learning rate  
- *W<sub>+/−</sub>* are the learning rates for LTP and LTD  
- *τ<sub>+/−</sub>* are the time constants for LTP and LTD  
- The sign of $$ \Delta w $$ depends on the sign of the weight, so inhibitory synapses also increase in absolute value under the same conditions as excitatory ones.

This window can be reversed (anti-Hebbian behavior) by setting the Hebbian parameter to false, meaning anti-causal relationships produce LTP and causal ones produce LTD.

STDP only applies to spiking neurons. Using non-spiking neurons with this rule is not recommended and can harm performance. If either the pre- or post-synaptic neuron is not spiking, the synapse behaves like a clamped synapse.

Source: Jean-Philippe Thivierge and Paul Cisek (2008), *Nonperiodic Synchronization in Heterogeneous Networks of Spiking Neurons*, Journal of Neuroscience; and the **[Scholarpedia article on STDP](http://www.scholarpedia.org/article/Spike-timing_dependent_plasticity)**.

Also on anti-hebbian STDP: [https://journals.physiology.org/doi/pdf/10.1152/jn.00551.2006](https://journals.physiology.org/doi/pdf/10.1152/jn.00551.2006)

# Parameters
- **Tau plus**: Time constant $$ \tau_{+} $$ for LTP (weight strengthening when pre fires before post). Smaller values narrow the window within which LTP is applied.
- **Tau minus**: Time constant $$ \tau_{-} $$ for LTD (weight decay when post fires before pre). Smaller values narrow the window within which LTD is applied.
- **W+**: Learning rate for LTP case. Controls the magnitude of LTP changes.
- **W-**: Learning rate for LTD. Controls magnitude of LTD changes.
- **Learning rate**: Global learning rate $$ \eta $$.
- **Hebbian**: If true, use hebbian learning, else anti-hebbian