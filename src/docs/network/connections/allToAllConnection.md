---
title: All To All Connection
layout: default
grand_parent: Networks
parent: Connection Strategies
has_children: false
nav_order: 60
---

# All to All connection

All to All connects every source neuron to every target neuron. This is the most standard class of connections when dealing with feed-forward networks.  When source and target nodes are the same this produces a fully recurrent neural network. 

## Dialog Properties

**Self-Connections Allowed**. Whether or not connections where the source and target are the same neuron are allowed. Only applicable if the source and target neurons overlap.
