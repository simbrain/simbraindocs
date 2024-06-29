---
title: Spike Responders
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 80
---

# Spike Responders

In Simbrain, all action potentials are modeled as **Dirac delta functions** (the Dirac delta function is 1 at exactly 0 and 0 for all other values on \([-∞, ∞]\)). This means that they are instantaneous in time and that, as far as the neuron that emitted the spike is concerned, no spike is more or less powerful than another. However, this is problematic because everything takes *some* amount of time, and so spike responders exist as a generic term for any function which assigns a temporally extended value to an instantaneous pre-synaptic spike. Generally speaking (and by default), all synapses originating at a **spiking neuron** have a spike responder and use that spike responder to determine how strongly they should impact their target neuron.

The top right neuron in the image here shows a spike responder in action. When the neuron that connects to it spikes, the spike responder produces a 1 which then decays to zero (see **Jump and Decay**).

<!-- TODO --> Add GIF

In biological settings, when a spike arrives at a post-synaptic cell (the target neuron of the spiking neuron), a "wave" of activation is created. This is modeled using a "response function" which characterizes a synaptic current, the influx of chemicals into a target cell which occurs when vesicles are released from a source neuron. In more formal terms, (most) spike responders perform a *convolution* of some function and the Dirac delta function representing spikes.

The input to a neuron using the synaptic input type uses the post-synaptic response as determined by the impinging synapses' post-synaptic response, as determined by the spike responder. This input takes many forms depending on the neuron type of the post-synaptic cell, but the general form of the input equation is as follows:

$$ 
x_{syn} = \sum\limits_{j = 1}^N PSR_j(\Delta_{spk}, w_{j}) 
$$

Where \(x_{syn}\) represents either pure synaptic current, the conductance (or fraction of open ion channels of a given type), or net input depending on the target neuron. \(PSR_{j}\) is the post-synaptic response of synapse \(j\) as determined by its spike responder. The spike responder determines the PSR using two variables: \(\Delta_{spk}\) or the time since the last spike of the pre-synaptic neuron, and \(w_{j}\), the absolute synaptic efficacy (also known as the "strength" or "weight") of the impinging synapse.

In sum, what is passed on to the post-synaptic neuron is the value of the response function scaled by the strength of the weight. That being said, there are a number of unique response functions that dramatically change the utility of the spike interaction. The response function can be thought of as the wave form of the response to a spike.

# Response Functions

<!-- TODO --> Mike's note: As Jekyll doesn't allow for more than 2 children/levels. Response functions will be within the same page as Spike Responder for now.

## Convolved Jump and Decay

<!-- TODO --> Add GIF

The convolved jump and decay spike responder produces a post-synaptic response (PSR) by convolving instantaneous trains of spikes (Dirac delta functions) with a simple exponential kernel. This yields the following equation for determining a post-synaptic response based on the absolute efficacy of the synapse (strength/weight), the time since the last spike, and the current state (spiking or quiescent) of the pre-synaptic cell.

$$ 
q_{ij}(t + 1) = q_{ij}(t)e^{-\left( \frac{\Delta_{t}}{\tau} \right)} + Jw_{ij}\delta(t)_j 
$$

$$ 
PSR(t)_{ij} = q(t)_{ij} + b 
$$

$$ 
\delta(t)_j = 
\begin{cases} 
1 & \quad \text{if } j \text{ spikes at time } t \\ 
0 & \quad \text{otherwise} 
\end{cases} 
$$

<!-- TODO --> Paragraph below needs to be fixed to accomdate for equations/formulas

Where \( q(t)_{ij} \) is an intermediate value determining the shape of the post synaptic response impinging on neuron \( i \) via the synapse connecting neuron \( j \) to neuron \( i \), \( \Delta_t \) is the difference between the current time and the time of the last action potential at neuron \( j \), \( J \) is the jump height, \( w_{ij} \) is the absolute synaptic efficacy of the synapse connecting neuron \( j \) to neuron \( i \), and \( b \) is the baseline of the curve, which determines the value of \( PSR(t)_{ij} \) as \( q(t)_{ij} \rightarrow 0 \).

**Jump Height**

This value is multiplied by the **strength** to determine the total instantaneous rise in a post-synaptic response to an action potential or spike.

**Base-Line**

The post-synaptic response value when no spike has occurred. Alternatively, the post-synaptic response to which the spike responder decays over time.

**Time Constant**

The time constant of decay and recovery (ms).


# Probabilistic

Emit a value of *response value* with probability *activation probability* whenever a pre-synaptic spike occurs.

**Response Value**

Amount by which the synapse's strength will be scaled to determine the post-synaptic response of the synapse in the event that this responder is actually active.

**Activation Probability**

Probability of producing an output; must be between 0 and 1.


# Jump and Decay

<!-- TODO --> Add GIF

This response function produces an instantaneous jump in the post-synaptic response equal to the *jump height*, followed by an exponential decay back to a *base-line* response at a rate which is proportional to the decay constant, *decay rate*. 

$$\large PSR(t)_{ij} = Jw_{ij}e^{\left(\frac{\Delta_t}{\tau}\right)} + b$$

Where $PSR(t)_{ij}$ is the post-synaptic response of the synapse connecting neuron $j$ to $i$, $w_{ij}$ is the absolute efficacy or "weight/strength" of the synapse connecting neuron $j$ to neuron $i$, $J$ is the jump height, $\Delta_t$ is the difference between the time of the last spike at neuron $j$ ($t_0$) and the current time ($t - t_0$), $\tau$ is the decay time constant, and $b$ is the baseline value that $PSR_{ij}$ will decay to as $e^{\left(\frac{\Delta_t}{\tau}\right)} \rightarrow 0$.

**Jump Height**

This value is multiplied by the **strength** to determine the total instantaneous rise in a post-synaptic response to an action potential or spike.

**Base-Line**

The post-synaptic response value when no spike has occurred. Alternatively, the post-synaptic response to which the spike responder decays over time.

**Time Constant**

The time constant of decay and recovery (ms).


# Step

Before the spike, the step function persists at base-line value, 0. After the spike, the waveform's *response height* increases by a constant amount for a specific number of iterations or time-steps called the *response time*. After the *response time* has passed, the function returns to its base-line value.

**Response Height**

The value by which the strength of the synapse is scaled to determine the post-synaptic response.

**Response Time**

The amount of time the post-synaptic response impinges on the post-synaptic cell.


# Rise and Decay

The response rises up to a maximum value, *maximum response*, and then decays back to a base-line value, 0, at a rate which is proportional to the *decay constant*. The global *time step* can be set when this function is selected.

**Maximum Response**

Maximum response value.

**Time Constant**

The time constant of decay and recovery (ms).