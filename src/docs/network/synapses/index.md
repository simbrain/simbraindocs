---
title: Synapses
parent: Networks
layout: default
has_children: true
nav_order: 70
---

# Synapses

In Simbrain, synapses, also known as weights, exist either as **free synapses** or within **synapse groups**. This page describes general synapse properties, the synapse dialog, and how to edit free synapses.

# Graphical Conventions

<!-- Picture with an arrow -->

Synapses are represented as lines between nodes that channel the flow of activity in a network. 
Free synapses are represented by colored semicircles at the ends of these lines. The size of the semicircle is proportional to how far the synaptic strength is between 0 and its upper or lower bound. The exact strength can be determined by lingering over a synapse or double-clicking on it. The color of a synapse represents whether the strength is: greater than 0 (red), less than 0 (blue), or equal to 0 (white). The last case represents, as it were, the absence of a weight. These conventions can be adjusted in the **preference dialog**.

**Excitatory synapse**: a weight with a positive value corresponds to an excitatory synapse. When these synapses are activated the post-synaptic neuron is more likely to fire, they "heat things up," as it were. An excitatory synapse is one which releases excitatory neurotransmitters, which bind to channels post-synaptically which cause currents that lead to an increase in the post-synaptic voltage potential. AMPA synapses are a common type of excitatory synapse. Excitatory synapses are shown as red discs in Simbrain.

**Inhibitory synapse**: a weight with a negative value corresponds to an inhibitory synapse. When these synapses are activated the post-synaptic neuron is less likely to fire, they "cool things down," as it were. An inhibitory synapse is one which releases inhibitory neurotransmitters, which bind to channels post-synaptically which cause currents that lead to a decrease in the post-synaptic voltage potential. GABA synapses are a common type of inhibitory synapse. Inhibitory synapses are shown as blue discs in Simbrain.

**Zero synapse**: a weight with a value of 0 is a way of mathematically representing the absence of a connection. In Simbrain this is currently represented as blue, inhibitory.

<!-- TODO: Add Image -->

## Common Synapse Properties

These are properties common to all synapses, regardless of type. All of them have some reflection in the GUI interface, but some of them only matter to the GUI interface (e.g., increment). For some synapses, upper bound and lower bound do not have a significant role other than to limit how large the graphical representation of the synapse can be.

- **Strength**: The strength is how "strong" this synapse is. This is represented by the size of the weight. Once a synapse has been selected, strength can be incremented by the up and down arrows or can be randomized.
- **Learning Rule**: Rule which determines how synapse strength changes, usually based on the neurons it is connected to. See individual [learning rule pages](index) for details on specific rules.
- **Spike Responder**: How this synapse responds when the presynaptic neuron (which must be spiking) spikes. See [spike responders](../spikeresponders) for details.
- **Enabled**: An enabled synapse operates as usual, transmitting information from a source neuron to a target neuron. If disabled, the synapse will no longer do this. Functionally, the synapse does not exist.
- **Clamped**: If clamped, a synapse's strength will not be changed by learning. Local synapse update rules won't be called when the network is updated, and supervised learning is also prevented from adjusting synapses. Compare clamping in neurons. However, a clamped synapse's strength can still be set externally, via the keyboard and [input tables](../ui/testInputs).
- **Increment**: The increment field sets the amount that a synapse is incremented when it is manually adjusted. For example, if increment is set to .1, then each time the up arrow is pressed the synapse will increase its strength by .1 (range: 0 and up).
- **Upper Bound**: This field plays different roles depending on the type of the synapse, but in general, it determines the maximum strength of a weight. It also determines the range of colors which a neuron can take on. This, along with the lower bound field, determines the bounds of randomization (range: 0 and up).
- **Lower Bound**: This field, like the upper bound, plays different roles depending on the type of the synapse, but in general, it determines the minimum strength of a weight. It also determines the range of colors which a neuron can take on. This, along with the upper bound, determines the bounds of randomization (range: 0 and down).
- **Delay**: A positive integer that delays how many iterations, or time-steps, must occur before the pre-synaptic signal, or the activation of the pre-synaptic neuron, is delivered (range: 0 and up).

## Quick Keyboard Adjustment of Synapse Properties

By [selecting](../buildingBasics#selecting-objects) a set of weights (e.g., by pressing "w", or by lassoing over a group of lines) and pressing certain buttons, those weights' properties can quickly be adjusted.

- **Increment / Decrement**: Press the up and down buttons to adjust synapse strengths. If the up key is pressed, the `increment` amount of a given synapse is added to the current strength. The size of the weight should be visibly changing. Similarly for the down key.
- **Randomize**: Press the `r` key or the "dice" button on the toolbar to randomize all selected synapses.
- **Clear**: Press `c` key or the "eraser" button on the toolbar to clear the post-synaptic response (psr) and delay queue of all selected synapses. This does NOT set synapse strengths to 0.
- **Hard Clear**: Press `Shift-c` to "hard clear" selected synapses, which clears the psr and delay queue AND sets the strengths to 0.

## Synapse Dialog / Editing Synapses

More detailed adjustments parameters can be adjusted using the synapse dialog by selecting and [setting properties](../buildingBasics#setting-properties). The dialog contains several sections, including a section for adjusting common synapse properties, described below, a section specific to the synapse update rule (these parameters are discussed in the relevant sub-pages), and a section for setting [spike responders](../spikeresponders), if any.

## Popup Menu (Selected Synapses)

When right-clicking on a synapse, a popup-menu appears whose actions will usually apply to selected synapses. Most of these actions are described in the **menu documentation**. The following actions only appear in the popup menu:

- **Send Scalar Coupling To**. Creates a coupling such that this synapse's strength is forwarded to some other scalar consumer in Simbrain, e.g., a time-series graph. See the [couplings](../../workspace/couplings) page.

- **Receive Scalar Coupling from**. Creates a coupling such that this synapse's strength is set by the value of some other scalar producer in Simbrain.
