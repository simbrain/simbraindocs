---
title: Morris Lecar
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 90
---

# Morris-Lecar Neuron

The [Morris Lecar](https://en.wikipedia.org/wiki/Morris%E2%80%93Lecar_model) neuron model (also see this [Scholarpedia](http://www.scholarpedia.org/article/Morris-Lecar_model) article) is a 2-dimensional neuron model which models neural dynamics based on calcium and potassium conductances. A simplification of Hodgkin-Huxley dynamics without the sodium channels. Potassium and calcium can capture many of the core dynamics.

Part of a family of 2-variable neuron activation models.

As a family tree, Hodgkin-Huxley came first, then FitzHugh-Nagumo, then Morris-Lecar.

Membrane potential is what shows as activation.

Parameter descriptions are given here though it may help to simply think of these as the parameters of a complex dynamical system. More detailed description of similar parameters are in the **AdEx** docs.

## Membrane Properties

- Capacitance (µF/cm²): Behaves like a time constant. Higher capacitance leads to slower changes in the cell.
- Voltage const. 1: How does calcium respond to voltage.
- Voltage const. 2: How does calcium respond to voltage.
- Threshold (mV): Voltages above this make the neuron spike.
- Background current (nA): A constant level of current that can be set.
- Add Noise: Whether to add noise to

## Ion Properties

- Ca²⁺ Conductance (µS): Calcium conductance. If higher, voltage pulled more quickly to Ca²⁺ equilibrium.
- K⁺ Conductance (µS): Potassium conductance. If higher, voltage pulled more quickly to K⁺ equilibrium.
- Leak Conductance (µS): Leak conductance. If higher, voltage pulled more quickly to Leak equilibrium.
- Ca²⁺ Equilibrium (mV): Calcium equilibrium.
- K⁺ Equilibrium (mV): Potassium equilibrium.
- Leak Equilibrium (mV): Leak equilibrium.

## K⁺ Consts.

- K⁺ Const. 1: V3 on the Scholarpedia page, which roughly corresponds to how potassium current responds to membrane voltage.
- K⁺ Const. 2: V4 on the Scholarpedia page.
- K⁺ ϕ: Potassium channel time constant/decay rate. If higher, potassium changes more slowly.

## Noise

See **here**.
