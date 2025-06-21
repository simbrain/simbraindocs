---
title: Morris Lecar
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 140
---

# Morris-Lecar Neuron

The [Morris Lecar](https://en.wikipedia.org/wiki/Morris%E2%80%93Lecar_model) neuron model (also see this [Scholarpedia](http://www.scholarpedia.org/article/Morris-Lecar_model) article) is a 2-dimensional neuron model which models neural dynamics based on calcium and potassium conductances. A simplification of Hodgkin-Huxley dynamics without the sodium channels. Potassium and calcium can capture many of the core dynamics.

Part of a family of 2-variable neuron activation models.

As a family tree, Hodgkin-Huxley came first, then FitzHugh-Nagumo, then Morris-Lecar.

Membrane potential is what shows as activation.

Parameter descriptions are given here though it may help to simply think of these as the parameters of a complex dynamical system. More detailed description of similar parameters are in the **[AdEx](adaptiveExIntegAndFire.md)** docs.

The model tracks membrane voltage $$V$$ and a potassium gating variable $$w_K$$:

$$
\frac{dV}{dt} = \frac{I_{bg} - I_{ion} + I_{syn} + I_{noise}}{C}
$$

$$
\frac{dw_K}{dt} = \phi \cdot \lambda(V) \cdot \left(K_{\infty}(V) - w_K\right)
$$

Where:

- $$I_{ion} = I_{Ca} + I_K + I_L$$ is the total ionic current.
- $$I_{Ca} = g_{Ca} \cdot m_{\infty}(V) \cdot (V - V_{Ca})$$
- $$I_K = g_K \cdot w_K \cdot (V - V_K)$$
- $$I_L = g_L \cdot (V - V_L)$$
- $$m_{\infty}(V) = 0.5 \cdot (1 + \tanh((V - V_{m1}) / V_{m2}))$$
- $$K_{\infty}(V) = 0.5 \cdot (1 + \tanh((V - V_{w1}) / V_{w2}))$$
- $$\lambda(V) = \cosh((V - V_{w1}) / 2V_{w2})$$

A spike is recorded if the membrane potential exceeds a fixed **threshold**.

## Parameters

**Ion Properties**
- **Ca²⁺ Conductance (µS/cm²)**: Maximal calcium conductance.
- **K⁺ Conductance (µS/cm²)**: Maximal potassium conductance.
- **Leak Conductance (µS/cm²)**: Maximal leak conductance.
- **Ca²⁺ Equilibrium (mV)**: Reversal potential for calcium current.
- **K⁺ Equilibrium (mV)**: Reversal potential for potassium current.
- **Leak Equilibrium (mV)**: Reversal potential for leak current.

**Membrane Properties**
- **Capacitance (µF/cm²)**: Affects the rate of membrane voltage change.
- **Voltage Const. 1, 2**: Shape the voltage dependence of calcium activation.
- **Threshold (mV)**: Spike occurs when voltage exceeds this threshold.
- **Background Current (nA)**: Constant applied input current.

**Potassium Constants**
- **K⁺ Const. 1, 2**: Shape the voltage dependence of potassium gating.
- **K⁺ φ**: Time constant for potassium gating variable dynamics.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)


