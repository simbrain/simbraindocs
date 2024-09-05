---
title: Fixed Degree
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 30
---

# Fixed Degree

For each source neuron, create a fixed number of connections to or from target neurons.

**Degree**. Maximum number of connections a source neuron can make to a target neuron.

**Indegree / Outdegree**. If set to indegree then the fixed number of connections are made 'inward' from target to source neurons. If set to outdegree then the fixed number of connections radiate out from each neuron.

**Use radius**. If true, only connect within a radius specified in pixels.

**Allow self connections**. Allow synapses from neurons to themselves.