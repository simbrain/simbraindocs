---
title: Rise and Decay
layout: default
grand_parent: Networks
parent: Spike Responders
has_children: false
nav_order: 30
---

# Rise and Decay

The response rises gradually to a maximum value proportional to the synaptic strength, and then decays back to baseline (0) at a rate proportional to the time constant. This responder models a slower, more gradual influence compared to jump and decay.

All spike responders use the incoming synaptic strength as the jump height.

- **Time Constant**: Time constant for rising decay (ms). Roughly the time it takes to rise to max value then decay to near-baseline. Larger time constants produce slower changes.

- **Recovery**: Internal state variable that tracks the recovery of the response. This variable is visible in the synapse property editor and can be monitored to understand the current state of the response.
