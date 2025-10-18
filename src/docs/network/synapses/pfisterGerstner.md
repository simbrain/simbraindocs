---
title: Pfister Gerstner
published: false
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 70
---

# Pfister and Gerstner (2006)

The [Pfister and Gerstner (2006) rule](https://pmc.ncbi.nlm.nih.gov/articles/PMC6674434/) is a triplet-based [spike-timing dependent plasticity (STDP)](https://en.wikipedia.org/wiki/Spike-timing-dependent_plasticity) learning rule, specifically designed to capture complex temporal interactions in spike trains beyond traditional pair-based STDP. It updates the synaptic strength using the following principles:

- Spike traces: Four spike traces are maintained:
  - $$r_1$$ and $$r_2$$ for presynaptic spikes
  - $$o_1$$ and $$o_2$$ for postsynaptic spikes
- Trace decay: Each trace decays exponentially at rates defined by their respective time constants:
  - $$\tau_+$$, $$\tau_x$$, $$\tau_-$$, and $$\tau_y$$
- Amplitude terms: Weight updates depend on amplitude terms for pairs ($$A2+$$ and $$A2-$$) and triplets ($$A3+$$ and $$A3-$$).

At each update:
- When a presynaptic spike occurs, the traces $$r_1$$ and $$r_2$$ are set to 1.
- When a postsynaptic spike occurs, the traces $$o_1$$ and $$o_2$$ are set to 1.
- In the absence of spikes, the traces decay exponentially.

The weight update rules are:
- For a presynaptic spike:
  $$
  \Delta w = -o_1 (A2- + A3- \cdot r_2)
  $$
- For a postsynaptic spike:
  $$
  \Delta w = r_1 (A2+ + A3+ \cdot o_2)
  $$

The decay of each trace is calculated as:
$$
r_1 \leftarrow r_1 - r_1 \cdot \frac{1}{\tau_+} \cdot dt
$$
$$
r_2 \leftarrow r_2 - r_2 \cdot \frac{1}{\tau_x} \cdot dt
$$
$$
o_1 \leftarrow o_1 - o_1 \cdot \frac{1}{\tau_-} \cdot dt
$$
$$
o_2 \leftarrow o_2 - o_2 \cdot \frac{1}{\tau_y} \cdot dt
$$

This model is based on:
Pfister, J-P, and Gerstner, W. "Triplets of Spikes in a Model of Spike Timing-Dependent Plasticity." *J. Neurosci.* 26 (2006): 9673-9682.

# Parameters

- **Tau+**: Decay rate for $$r_1$$ trace.
- **Tau x**: Decay rate for $$r_2$$ trace.
- **Tau-**: Decay rate for $$o_1$$ trace.
- **Tau y**: Decay rate for $$o_2$$ trace.
- **A2+**: Amplitude of weight change for a pre-post spike pair.
- **A2-**: Amplitude of weight change for a post-pre spike pair.
- **A3+**: Amplitude of triplet term for potentiation.
- **A3-**: Amplitude of triplet term for depression.
