---
title: Log-STDP
published: false
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 95
---

# Log-STDP Rule

An implementation of Log-STDP (Logarithmic Spike-Timing Dependent Plasticity) as introduced by Gilson and Fukai (2011). Log-STDP is a variant of [STDP](stdp) that pushes weight values toward a log-normal distribution, addressing weight divergence issues common in standard STDP implementations.

## Overview

Log-STDP helps with weight stability while allowing for synaptic specialization. Unlike standard additive or multiplicative STDP, Log-STDP:

- Prevents weight divergence by pushing weights toward a log-normal distribution
- Allows for specialization of synapses
- Fits well with experimental data concerning synaptic efficacy
- Uses different LTD rules depending on weight magnitude

## How It Works

The rule uses a small weight threshold ($$ J_0 $$) that determines how LTD is applied:

- **For weights below the threshold**: LTD linearly approaches 0 as the weight approaches 0
- **For weights above the threshold**: LTD is logarithmically related to synapse strength

The weight change depends on the spike timing difference $$ \Delta t = t_{\text{pre}} - t_{\text{post}} $$:

**For positive weights:**

When $$ \Delta t < 0 $$ (pre before post, LTP):
$$
\Delta w = \eta \cdot c_+ \cdot e^{-|\Delta t|/\tau_+} \cdot e^{-|w|/(\beta J_0)} \cdot (1 + \text{noise})
$$

When $$ \Delta t > 0 $$ (post before pre, LTD):
$$
\Delta w = -\eta \cdot c_- \cdot e^{-|\Delta t|/\tau_-} \cdot f(|w|) \cdot (1 + \text{noise})
$$

where $$ f(|w|) $$ depends on weight magnitude relative to $$ J_0 $$.

**For negative weights:** 
The rule uses a simplified anti-hebbian approach.

## Requirements

Log-STDP only works with spiking neurons. Both the source and target neurons must use spiking update rules for the learning rule to function properly.

## Parameters

Log-STDP inherits the standard STDP parameters:

- **Tau plus**: Time constant for LTP.
- **Tau minus**: Time constant for LTD.
- **W+**: Learning rate constant for LTP ($$ c_+ $$)
- **W-**: Learning rate constant for LTD ($$ c_- $$)
- **Learning rate**: Global learning rate $$ \eta $$.
- **Hebbian**: If true, use hebbian learning, else anti-hebbian

## Applications

Log-STDP is particularly useful for:

- Long-term stable learning without weight divergence
- Networks requiring specialized synapses with diverse strengths
- Models attempting to match biological weight distributions
- Avoiding the instability common in standard STDP implementations

## Reference

Gilson M, Fukai T (2011) Stability versus Neuronal Specialization for STDP: Long-Tail Weight Distributions Solve the Dilemma. PLoS ONE 6(10): e25339. [doi:10.1371/journal.pone.0025339](https://doi.org/10.1371/journal.pone.0025339)
