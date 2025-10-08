---
title: Step
layout: default
grand_parent: Networks
parent: Spike Responders
has_children: false
nav_order: 10
---

# Step

The step responder produces a simple, constant post-spike effect. Before a spike, the response is at baseline (0). After a spike, the response immediately jumps to the synaptic strength and remains constant for the specified response duration. After the response time has passed, the function returns to baseline.

All spike responders use the incoming synaptic strength as the response height.

- **Response Time**: Response duration (ms). The amount of time the post-synaptic response remains at the maximum value before returning to baseline.