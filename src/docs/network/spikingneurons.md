---
title: Spiking Neurons
layout: default
parent: Networks
has_children: false
nav_order: 150
---

# Spiking Neurons

Some types of neuron [update rule](neurons)s  produce discrete "spikes," that is, instantaneous firing events. When they do, the neuron and the lines leading out from it (the "axon") turn a different color (by default yellow). This framework is used to create more biologically realistic simulations. In these neurons, the activation--the number in the neuron--is usually interpreted as a voltage potential, and when that number passes a threshold the neuron "fires," and typically the activation then drops to a lower value.

Since spikes are discrete events without a numerical value, some way of converting them into numbers is required (e.g. when a spike arrives at a synapse). This is handled using [spike responders](spikeresponders).

<img src="/assets/images/spikingNonSpiking.gif" alt="spiking vs. nonspiking" style="width:500px; border: 2px solid black;"/>

When the non-responder is used then whatever counts as "activation" in the spiking neuron (whatever shows in the circles representing a node) is treated as a regular activation as multipled by the weight strength to generate a [PSR](/docs/network/updateLogic.html#PSR).

# History and General Comments

Historically, there has been a progression from one-dimensional (1D) to two-dimensional (2D) neuron models.

**Hodgkin-Huxley:** This is the original model, which is quite complex, involving four or five state variables.

**Integrate-and-Fire:** A simpler model, often 1D, though some versions extend to 2D.

**FitzHugh-Nagumo:** Designed as a simplification of the Hodgkin-Huxley model, this 2D dynamical system captures much of the variability and behavior seen in Hodgkin-Huxley. It effectively models voltage traces and spike timings, demonstrating that simpler models can approximate the more complex original.

Following these models, there were attempts to not only model voltage traces but also capture spike dynamics and timings using 2D simplifications. These models can reproduce bursting behavior. The second variable in these models usually represents some form of adaptation.

## Spike Timing Emphasis

Models with a spike timing emphasis aim to reproduce accurate spike timings and realistic voltage traces. They are designed to diverge to infinity, a feature of their construction. Examples include **Izhikevich**, **Integrate-and-Fire (IntFire)**, **Adaptive Exponential Integrate-and-Fire (AdEx)**, and **Morris-Lecar**.

**AdEx** is considered a gold standard for spike timing. It excels at predicting when spikes will occur in response to input and can produce realistic voltage traces. However, these are unstable dynamical systems, often requiring "reset" mechanisms to handle divergence. Among these models, AdEx is the best at predicting the exact timing of spikes after an input, whereas Izhikevich and quadratic Integrate-and-Fire models may not diverge to infinity quickly enough, resulting in delayed spikes. IntFire models, on the other hand, may produce spikes too soon.

## Membrane Trace Emphasis

Models focusing on membrane potential traces include **FitzHugh-Nagumo**, **Hodgkin-Huxley**, and **Morris-Lecar**. These models are good at producing accurate voltage traces and do not diverge to infinity. Instead, they treat spikes as certain values and reset afterward.

These models include recovery variables that simulate the depletion and replenishment of certain chemicals in the neuron. After reaching a threshold, sodium ions rush into the cell, and the gradient diffusion follows an exponential curve—initially rapid but then saturating as equilibrium is approached. This process is not limited by the depletion of ions but by the rate at which they can be replenished. The response to this saturation often involves the opening of calcium channels, allowing calcium ions to exit the cell. The energy expended is primarily in resetting the neuron rather than firing the spike itself, often involving active pumps.

**Morris-Lecar** is closely related to FitzHugh-Nagumo and focuses on modeling calcium dynamics. It can generate accurate voltage traces without directly modeling sodium dynamics. FitzHugh-Nagumo models ion saturation effects, particularly sodium, and captures the general behavior of ion influx and efflux.

## Background Currents

Without some background current, a neuron requires a significant amount of input to reach the threshold needed to fire a spike, which is unrealistic. Excessive input can push the neuron into an unstable state, leading to seizure-like activity.

Neurons naturally maintain a sub-threshold excited state due to the averaged activity from other neurons. This background activity keeps them close to the boundary between quiescence and excitability, facilitating synaptic transmission.

- Without any input, a neuron must be blasted with a significant current to reach its threshold.
- Excessive current can easily push the neuron into an overexcited state, leading to seizures.
- The range of input that produces brain-like activity is small.
- Background currents keep neurons near the threshold where interesting activity occurs, preventing them from being too far from this boundary.

## Avoiding Instability

Some tips to avoid instability in neuron models:

- The time step should be small, but 0.1 is usually sufficient.
- Be careful with time constants—they must be positive and non-zero.
- The time constant should be significantly larger than the time step. Lower time constants increase instability; values below 1 can be particularly problematic. Ideally, the time constant should be at least 10.
- A time constant of around 3 is acceptable for spike responders, as neurotransmitters are quickly cleared from the synaptic cleft, ensuring transmission. The rise and decay of these signals require careful consideration.

# List of Spiking Neurons
- [Adaptive Integrate and Fire](/docs/network/neurons/adaptiveExIntegAndFire.html)
- [FitzHugh-Nagumo Neuron](/docs/network/neurons/fitzhughNagumo.html)
- [Integrate-and-Fire](/docs/network/neurons/integrateAndFire.html)
- [Izhikevich Neuron](/docs/network/neurons/izhikevich.html)
- [Morris-Lecar Neuron](/docs/network/neurons/morrisLecar.html)
- [Spiking Threshold](/docs/network/neurons/spikingThreshold.html)
- [Stochastic Generator](/docs/network/neurons/stochastic.html)

<!-- NOTE: Allostatic and Timed Accumulator empty pages -->

