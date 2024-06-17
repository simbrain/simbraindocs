---
title: Adaptive Exponential Integrate and Fire
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 10
---

# Adaptive Exponential Integrate and Fire

The Adaptive Exponential Integrate and Fire or AdEx model is a spiking neuron model governed by two coupled differential equations. The first equation defines the behavior of the neuron's membrane potential over time, while the second equation defines the behavior of an adaptation parameter which broadly speaking acts to hyperpolarize the membrane potential in response to successive spikes. The AdEx model is capable of simulating many different kinds of observed spiking behavior including (but not limited to) bursting, fast-spiking, regular spiking, delayed spiking, and chaotic spiking. For more information see the **Scholarpedia article on the AdEx model**.

## Membrane Voltage

$$V$$: Membrane potential (mV): The current electrical potential across the membrane. This value is used to determine the overall behavior of the neuron.

$$V_{peak}$$: Peak Voltage (mV): The peak voltage after which we say with certainty that an action potential has occurred (mV). In most models this is usually referred to as the threshold as it is the (somewhat) arbitrarily chosen voltage above which we officially count the neuron to have fired an action potential.

$$V_T$$: Threshold Voltage (mV): This determines when a neuron will start a divergent change in voltage that will tend toward infinity and is not the voltage at which we consider the neuron to have spiked. External factors can cause an action potential to fail even if its membrane potential surpasses this threshold value.

$$V_{Reset}$$: Reset Voltage (mV): This represents the voltage to which the membrane potential will be reset after an action potential has fired. This reset value strongly determines the overall behavior of the neuron. At a constant 0.8 nA of input current the reset voltage will determine whether or not the neuron fires in singletons (< -49 mV), bursts of 2 (-48.5 mV) or 4 spikes (-47.2 mV), or chaotically (-48 mV). Other behaviors are possible, feel free to experiment with these parameters!

$$\Delta_T$$: Slope Factor: A value which regulates the overall effect of the exponential term on the membrane potential equation. Usually this is set to 1, but it can be set to other values to enhance or mitigate the effect of the exponential effect of the difference between $$V$$ and $$V_T$$

$$C$$: Capacitance (&mu;F): A paramter designating the overall ability of the neuron's membrane to retain a charge. Includes the membrane time constant since the Farad in SI units is $$s^4 \times A^2 \times m^{-2} \times kg^{-1}$$

## Input Currents

- $$\overline{g}_L$$: Leak Conductance (nS): The inverse of the resistance of the channels through which current leaks from the neuron.

- $$\overline{g}_e$$: Max Excitatory Conductance (nS): The excitatory conductance if all excitatory channels are open. Essentially this scales the effect of excitatory afferents.

- $$\overline{g}_i$$: Max Inhibitory Conductance (nS): The inhibitory conductance if all inhibitory channels are open. Essentially this scales the effect of inhibitory afferents.

- $$g_e$$ and $$g_i$$: Excitatory/Inhibitory Conductance (nS): Represents the ratio of open excitatory and inhibitory channels. Excitatory/Inhibitory inputs act to open some ratio of these channels.

- $$E_L$$: Leak Reversal (mV): The membrane potential at which leak currents would no longer have any effect on the neuron's membrane potential. This is the voltage toward which leak pulls the membrane potential. This can also be thought of as the leak's equilibrium point.

- $$E_e$$: Excitatory Reversal: The membrane potential at which impinging excitatory (depolarizing) inputs reach equilibrium. That is to say, the voltage excitatory inputs pull the membrane potential toward.

- $$E_i$$: Inbitatory Reversal: The membrane potential at which impinging inhibitory (hyperpolarizing) inputs reach equilibrium. That is to say, the voltage inhibitory inputs pull the membrane potential toward.

- $$I_{bg}$$: Background Current (nA): A tunable parameter in some ways similar to a bias parameter for non-spiking neurons. The idea here is to subject the neuron to a small constant input to represent the high-conductance state found in real neural tissue, which is the result of contant noisy bombardment from other brain regions. However the background current parameter can also be used to inject a coherent current that is, as an entry point for any non-synaptic inputs to the neuron.

## Adaptation

- $$w$$: Main Parameter (nA): The adaptation value which regulates membrane potential in response to successive spikes.

- $$b$$: Increment (nA): The value by which the adaptation parameter is incremented each time an action potential is fired.

- $$a$$: Coupling Constant: This value regulates how quickly the adaptation term exponentiall decays and its value relative to the membrane potential.

- $$\tau_w$$: Time Constant: Controls the rate at which the neuron attains its resting potential. As one increases this value (ms), things become relatively slower; conversely, as one decreases this value, things become relatively faster.