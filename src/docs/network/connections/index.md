---
title: Connection Strategies
layout: default
parent: Networks
has_children: true
nav_order: 70
---

# Connection Strategies

Connection strategies are one way of [connecting neurons](../buildBasics#Connection_Methods) They rules used to create rule-based patterns of connections between source and target groups of neurons. The connection strategies generally also set an [excitatory / inhibitory ratio](../otherDialogs#Excitatory-Inhibitory-Ratio). All weights strenghts are simply 1 or -1 by default. To set a distribution on weights strengths the [synapse adjustment panel](../otherDialogs#Synapse-Adjustment-Dialog) should be used.

Connection strategies can be invoked in these ways:

- Use the default strategy that is set in network preferences when using the 1-2 trick. Then when pressing 1 then 2 this strategy will be invoked.
- Right click and select a strategy from the `connect neurons` submenu.
- Synapse groups are associated with connection strategies that can be applied
