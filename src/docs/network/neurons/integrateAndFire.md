---
title: Integrate and Fire Rule
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Integrate-and-Fire

The linear, leaky integrate-and-fire model is perhaps the most prevalent [biologically realistic model neuron](https://en.wikipedia.org/wiki/Biological_neuron_model) currently in use owing to its simplicity, computational efficiency, and the presence of a closed-form solution. The term "integrate-and-fire" actually refers to any neuron model (of varying complexity) which aims to simulate the integration of synaptic inputs specifically as they pertain to the membrane voltage and production of action potentials, that is, how neurons *integrate their inputs and fire in response*. The underlying assumption is that this relationship represents the most important aspect of how neurons function making it an ideal abstraction when considering the interactions between neurons in large groups or networks (as opposed to simulating individual or small numbers of neurons in detail). Here we follow the convention of referring to linear, leaky, integrate-and-fire models simply as "integrate-and-fire" due to their ubiquity and simplicity among the greater class of integrate and fire models (other examples include [Izhikevich's](./Izhikevich.html) adaptive version of the quadratic integrate and fire model and Brette and Gerstner's [Adaptive exponential integrate-and-fire [AdEx] model](./AdExIntegrateandFire.html)).

Integrate-and-fire simulates how the combination of external currents (synaptic or otherwise), which are not tied to any specific ion channel (excitatory or inhibitory only), alter a membrane potential whose only dynamics consist of the exponential decay or growth toward some pre-determined resting state. This makes the form of the derivative linear, and therefore the simplest way to represent/simulate a neuron's return to a resting state after perturbation of the voltage. The simple simulation of voltage is then used to determine when an action potential is fired through comparison to some threshold value. After an action potential is fired the voltage is maintained at a reset value for some set refractory period regardless of external currents impinging on the neuron.

Simbrain's Integrate and Fire neuron is a [spiking neuron](../spikingnetworks.html). The displayed "Activation value" of this type of neuron represents its membrane potential. A yellow flash indicates the occurrence of a spike at that time, indicating that the membrane potential exceeded the threshold.

Activation is computed by integrating the following differential equation using Euler's method:

$$
\frac{dV_m}{dt} = \frac{-(V_m - V_{rest}) + R_m (I_{syn} + I_{bg})}{\tau}
$$

Where:

- $$V_m$$: membrane potential (activation),
- $$V_{rest}$$: resting potential,
- $$R_m$$: membrane resistance,
- $$I_{syn}$$: total synaptic input,
- $$I_{bg}$$: background current,
- $$\tau$$: time constant.

If the membrane potential reaches or exceeds a fixed **threshold**, the neuron emits a spike and its potential is reset to the **reset potential**. The neuron ignores inputs during the **refractory period**.

Noise can optionally be added to the synaptic current.

## Parameters

- **Threshold (mV)**: Membrane voltage at which the neuron fires a spike.
- **Reset Potential (mV)**: Voltage to which the neuron resets immediately after spiking.
- **Resting Potential (mV)**: Voltage that the neuron decays toward in the absence of input.
- **Resistance (MΩ)**: Scales how strongly current inputs affect the voltage.
- **Background Current (nA)**: Constant injected current that shifts baseline activity.
- **Time Constant (ms)**: Determines how quickly the voltage returns toward rest.
- **Refractory Period (ms)**: Minimum time after a spike before the neuron can spike again.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)