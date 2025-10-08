---
title: Non Responder
layout: default
grand_parent: Networks
parent: Spike Responders
has_children: false
nav_order: 5
---

# Non Responder

The non responder is a null spike responder that produces standard connectionist dynamics where the post-synaptic response is simply the weight times the source activation. When this spike responder is selected, no special spike response processing occurs, and synapses behave like typical weighted connections in non-spiking networks.

This responder is useful when you want to mix spiking and non-spiking dynamics in the same network, or when you want synapses from spiking neurons to behave like standard weighted connections without temporal dynamics.
