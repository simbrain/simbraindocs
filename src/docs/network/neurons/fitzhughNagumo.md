---
title: Fitzhugh Nagumo
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
nav_order: 70
---

# FitzHugh-Nagumo Neuron

The [FitzHugh-Nagumo](https://en.wikipedia.org/wiki/FitzHugh%E2%80%93Nagumo_model) neuron model (also see this [Scholarpedia](http://www.scholarpedia.org/article/FitzHugh-Nagumo_model) article; note that our notation here follows the Scholarpedia article, not the wikipedia article), is a 2-d simplification of the 4-d Hodkin-Huxley model (the variables are voltage and internal recovery variable w). A close and simpler cousin of Moris-Lecar models. Based on the idea that a non-linear voltage term and a recovery term will capture most observed spiking dynamics.

As a family tree, Hodkin-Huxley came first, then FitzHugh-Nagumo, then Moris-Lecar.

Parameter descriptions are given here though it may help to simply think of these as abstract parameters of a complex dynamical system. More detailed description of similar parameters are in the **AdEx** docs.

<!-- link for ADEX docs from simbrain3 docs does not work -->

## A (Recovery Rate)

Abstract measure of how much "resource" a cell is depleting in response to large changes in voltage. A time constant for V and the recovery variable w.

## B (Rec. Voltage Dependence)

How much the recovery variable w depends on voltage.

## C (Rec. Self Dependence)

How quickly the recovery variable recovers to its baseline value.

## Background Current (nA)

Background current to the cell.

## Add Noise

If set to true, **random noise** is added to the activation after each update. The noise is generated from a distribution (by default, a uniform distribution). This can be useful for simulating stochastic neural activity. See [Randomizers](/docs/utilities/randomizers) for more detail.
