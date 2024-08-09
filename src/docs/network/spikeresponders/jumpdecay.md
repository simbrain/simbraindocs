---
title: Jump and Decay
layout: default
grand_parent: Networks
parent: Spike Responders
has_children: false
nav_order: 20
---

This response function produces an instantaneous jump in the post-synaptic response equal to the *jump height*, followed by an exponential decay back to a *base-line* response at a rate which is proportional to the decay constant, *decay rate*.

$$
\large PSR(t)_{ij} = Jw_{ij}e ^ \left({\Delta_t} / {\tau} \right) + b
$$

Where $$PSR(t)_{ij}$$ is the post-synaptic response of the synapse connecting neuron $$j$$ to $$i$$, $$w_{ij}$$ is the absolute efficacy or ``weight/strength'' of the synapse connecting neuron $$j$$ to neuron $$i$$, $$J$$ is the jump height, $$\Delta_t$$ is the difference between time of the last spike at neuron $$j$$ ($$t_0$$) and the current time ($$t_0 - t$$), $$\tau$$ is the decay time constant, and $$b$$ is the baseline value that $$PSR_{ij}$$ will decay to as $$e^\left(\Delta_t / \tau \right) \rightarrow 0$$.

## Jump Height

This value is multiplied by the [strength](../../synapse.html#Strength) to determine the total instantaneous rise in a post-synaptic response to an action potential or spike.

## Base-Line

The post-synaptic response value when no spikes have occurred. Alternatively, the post-synaptic response to which the spike responder decays to over time.

## Time Constant

The time constant of decay and recovery (ms).
