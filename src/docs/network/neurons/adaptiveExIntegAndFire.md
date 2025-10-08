---
title: Adaptive Exponential Integrate and Fire
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# AdEx Integrate and Fire

The AdEx (Adaptive Exponential Integrate-and-Fire) rule is a biologically grounded spiking neuron model that simulates membrane potential dynamics using an exponential term and an adaptation mechanism. It is governed by two coupled differential equations. The first equation defines the behavior of the neuron's membrane potential over time, while the second equation defines the behavior of an adaptation parameter which broadly speaking acts to hyperpolarize the membrane potential in response to successive spikes. The AdEx model is capable of simulating many different kinds of observed spiking behavior including (but not limited to) bursting, fast-spiking, regular spiking, delayed spiking, and chaotic spiking. For more information see the [Scholarpedia article on the AdEx model](http://www.scholarpedia.org/article/Adaptive_exponential_integrate-and-fire_model).

## Membrane Voltage 

Membrane potential $$v$$ evolves according to:

$$
C \frac{dv}{dt} = g_L \Delta_T e^{\frac{v - v_{th}}{\Delta_T}} + g_L (E_L - v) + I_{syn} + I_{bg} - w
$$

Adaptation variable $$w$$ follows:

$$
\frac{dw}{dt} = \frac{a(v - E_L) - w}{\tau_w}
$$

Where:

- $$v$$ is membrane voltage,
- $$w$$ is adaptation (metabolic variable),
- $$g_L$$ is leak conductance,
- $$E_L$$ is leak reversal potential,
- $$v_{th}$$ is exponential threshold,
- $$\Delta_T$$ is the slope factor,
- $$C$$ is membrane capacitance,
- $$I_{syn}$$ is total synaptic current (excitatory and inhibitory),
- $$I_{bg}$$ is background current.

When $$v$$ crosses a fixed peak voltage, the neuron emits a spike:

- $$v \leftarrow v_{reset}$$  
- $$w \leftarrow w + b$$

Refractory period can be optionally enforced to avoid consecutive spiking too close in time.

## Parameters

**Membrane Voltage**
- **Peak Voltage (mV)**: The maximum value used to detect a spike.
- **Threshold Voltage (mV)**: The membrane voltage at which the exponential current starts growing sharply.
- **Reset Voltage (mV)**: Voltage to which the neuron resets after spiking.
- **Slope Factor**: Sharpness of the exponential growth around the threshold.
- **Capacitance (μF)**: Controls how fast voltage integrates.
- **Background Current (nA)**: Constant input current into the cell.

**Input Currents**
- **Leak Conductance (nS)**: Governs the rate of passive decay of voltage.
- **Leak Reversal (mV)**: Voltage where leak current reverses.
- **Max Ex. Conductance (nS)**: Maximum excitatory channel conductance.
- **Max In. Conductance (nS)**: Maximum inhibitory channel conductance.
- **Excitatory Reversal (mV)**: Reversal potential for excitatory input.
- **Inhibitory Reversal (mV)**: Reversal potential for inhibitory input.

**Adaptation**
- **Adaptation Step Size (b)**: Amount added to the adaptation variable after each spike.
- **Time Constant (τw)**: Rate at which adaptation returns to baseline.
- **Coupling Constant (a)**: Degree of coupling between voltage and adaptation.

**Other**
- **Refractory Period (ms)**: Minimum time between spikes to enforce.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)