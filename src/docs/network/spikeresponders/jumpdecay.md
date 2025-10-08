---
title: Jump and Decay
layout: default
grand_parent: Networks
parent: Spike Responders
has_children: false
nav_order: 20
---

# Jump and Decay

This response function produces an instantaneous jump in the post-synaptic response equal to the synaptic strength, followed by an exponential decay back to a baseline response at a rate proportional to the time constant.

$$
\large PSR(t)_{ij} = w_{ij}e ^ \left({\Delta_t} / {\tau} \right) + b
$$

Where $$PSR(t)_{ij}$$ is the post-synaptic response of the synapse connecting neuron $$j$$ to $$i$$, $$w_{ij}$$ is the synaptic strength, $$\Delta_t$$ is the difference between time of the last spike at neuron $$j$$ and the current time, $$\tau$$ is the decay time constant, and $$b$$ is the baseline value that $$PSR_{ij}$$ decays to over time.

All spike responders use the incoming synaptic strength as the jump height.

- **Base-Line**: The post-synaptic response value when no spikes have occurred. Alternatively, the post-synaptic response to which the spike responder decays over time.

- **Time Constant**: Time constant of decay (ms). Roughly the time it takes to decay to near-baseline. Larger time constants produce slower decay.

- **Use Convolution**: If true the current spike response adds the PSR from the previous iteration, which smoothes out the response.
