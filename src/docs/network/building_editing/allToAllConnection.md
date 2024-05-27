---
title: All To All Connection
layout: default
grand_parent: Networks
parent: Connecting Neurons
has_children: false
nav_order: 60
---

# All to All connection

All to All connects every source neuron to every target neuron. This is the most standard class of connections when dealing with feed-forward and fully recurrent neural networks. Optionally the user can set the percentage of connections which are excitatory (complimentary to the number of inhibitory connections), the type of **synapse** (distinct between excitatory and inhibitory connections), and whether or not the weights are randomized (including range, distribution, etc.).

<!-- TODO --> Add Image

## Dialog Properties

- Allow Self-Connections: If checked, self-connections will be created for each neuron which is designated both as source and target.

- Excitatory/Inhibitory Properties: See **Excitatory/Inhibitory Sub-Panel** page.