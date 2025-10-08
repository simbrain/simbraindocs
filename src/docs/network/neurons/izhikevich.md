---
title: Izhikevich
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Izhikevich Neuron

The Izhikevich model neuron was developed as an efficient, powerful alternative to the [integrate and fire](integrateAndFire.html) model. This is a spiking neuron, so when the voltage passes a threshold value a spiking event occurs, and the neuron and outgoing connection turns yellow.

The model uses two variables, a variable representing voltage potential $$v$$ and another variable $$u$$ representing membrane recovery (activation of potassium currents and inactivation of sodium currents). The voltage potential $$v$$ corresponds to the "activation" of the neuron that determines what color it is represented as. 

The variables $$u$$ and $$v$$ are governed by these differential equations:

$$
\begin{align*}
\dot{v} &= .04 v^2 + 5v + 140 - u + I \\[2mm]
\dot{u} &= a(bv - u) \\
\end{align*}
$$

Where $$I$$ is the total input (net input from other neurons plus background current). The other parameters are described below. Whenever $$v \geq v_{peak}$$ a spike occurs and the voltage and recovery variable are reset:

$$
\begin{align*}
v &\leftarrow c \\[2mm]
u &\leftarrow u + d \\
\end{align*}
$$

To explore this model, you can use the script *spikingNeuronDemo.bsh*, from the workspace script menu.

This version of them model is from Eugene Izhikevich (2004), "Which Model to Use For Cortical Spiking Neurons," *IEEE Transactions on Neural Networks.* He updates the model slightly in his book. [Dynamical Systems in Neuroscience](https://www.izhikevich.org/publications/dsn.pdf). Also see [his webpage about the model](http://www.izhikevich.org/publications/whichmod.htm).

## Parameters

- **A**: Controls the time scale of the recovery variable. Smaller values make recovery slower.
- **B**: Sensitivity of the recovery variable to voltage.
- **C**: Membrane potential reset value after a spike.
- **D**: Recovery variable increment after a spike.
- **Threshold**: Value of $$v$$ that triggers a spike and reset.
- **I bkgd**: Constant background current applied each time step.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)

## Some useful Parameter Settings

(See link above for more information)

|             | A    | B    | C   | D   | I (Input) |
|-------------|------|------|-----|-----|-----------|
| Tonic spiking      | 0.02 | 0.2  | -65 | 6   | 14 |
| Phasic spiking     | 0.02 | 0.25 | -65 | 6   | 0.5 |
| Tonic bursting     | 0.02 | 0.2  | -50 | 2   | 15 |
| Phasic bursting    | 0.02 | 0.25 | -55 | 0.05 | 0.6 |
| Mixed mode         | 0.02 | 0.2  | -55 | 4   | 10 |
| Spike frequency adaptation | 0.01 | 0.2  | -65 | 8   | 30 |
| Class 1            | 0.02 | -0.1 | -55 | 6   | 0 |
| Class 2            | 0.2  | 0.26 | -65 | 0   | 0 |
| Spike latency      | 0.02 | 0.2  | -65 | 6   | 7 |
| Subthreshold oscillations | 0.05 | 0.26 | -60 | 0   | 0 |
| Resonator          | 0.1  | 0.26 | -60 | -1  | 0 |
| Integrator         | 0.02 | -0.1 | -55 | 6   | 0 |
| Rebound spike      | 0.03 | 0.25 | -60 | 4   | 0 |
| Rebound burst      | 0.03 | 0.25 | -52 | 0   | 0 |
| Threshold variability | 0.03 | 0.25 | -60 | 4   | 0 |
| Bistability        | 1    | 1.5  | -60 | 0   | -65 |
| DAP                | 1    | 0.2  | -60 | -21 | 0 |
| Accomodation       | 0.02 | 1    | -55 | 4   | 0 |
| Inhibition-induced spiking | -0.02 | -1   | -60 | 8   | 80 |
| Inhibition-induced bursting | -0.026 | -1  | -45 | 0   | 80 |
