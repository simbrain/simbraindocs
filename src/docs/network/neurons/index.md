---
title: Neurons
layout: default
parent: Networks
has_children: true
nav_order: 50
---

# Neurons

Neurons or "nodes" are represented by circles. The numbers inside the neurons corresponds to their "activation level." What this activation represents varies with neuron type: in some cases it represent a neuron firing rate in other cases it is a more abstract quantity. 

## Neuron Update Rules 

There are a variety of different neuron types in Simbrain. The update rule of a neuron corresponds to what kind of neuron it is: linear, sigmoidal, etc. This page addresses properties common to all of the different neuron types. Details on particular neuron types can be found on their respective pages. Even more custom behaviors can be defined using [simulations](../../simulations).

Some rules produce **activity generators**, which don't respond to inputs, but only produce outputs. They are represented by squares rather than circles in the GUI.

Some more neuraly realistic rules involve [spiking](../spikingneurons).

## Graphical Conventions

The color of a neuron generally represents the activation of a neuron, with red for "hot" activation above 0, blue for "cool" activation below 0, and white for no activation. The number shown is rounded activation; functionally, however, double precision floating point values are used. This value can be seen by lingering over a neuron for a tooltip or double clicking on it.

More detail on these conventions, in particular for more neurally realistic simulations:

- **Zero neuron**: a neuron with a value of 0 represents a non-active neuron, which is either not firing or is firing at a very low rate. In terms of voltages, this can be thought of as a neuron which is at its resting potential, that is, which has its baseline electrical charge, which is actually typically around -70mV (millivolts). In Simbrain this corresponds to the color 0.
- **Positive activation**: a neuron with positive activation can be thought of as firing at above its normal rate. In terms of voltages, this can be thought of as a neuron which is above its resting potential, e.g. -50mV. Such a neuron is sometimes said to be "excited" or "depolarized." In Simbrain this corresponds to a shade of red by default.
- **Negative activation**: it is hard to say what a neuron with negative activation corresponds to in terms of firing rates. In terms of voltages, this can be thought of as a neuron which is below its resting potential, e.g. -50mV. Such a neuron is sometimes said to be "inhibited" or "hyperpolarized." In Simbrain this corresponds to a shade of blue by default.

## Net Input 

The input to a neuron is generally a weighted input, but in Simbrain to accomodate both regular and spiking nodes, it is more generally a sum of PSRs.

PSR is usually just weighted inputs, a weighted sum over the neuron's incoming synapses:

$$ net_{i} \;=\; \sum\limits_{j = 1}^N w_{ij}a_j$$ $$ a_i \;=\; f(net_{i})$$

Where $$f$$ represents the neuron's update rule, and $$net_{i}$$ is the weighted or "net" input to neuron $$i$$. Oftentimes the confectionist literature refers to the weighted input to a neuron as its net input.

Note that a sensory input term I is also added to the weighted input if the node has a [coupling](../../workspace/couplings) attached to it.

**Tip**: To make a neuron whose activation value equals its weighted input, use a [linear neuron](linear) with slope = 1 and bias = 0. Linear neurons are great for quickly displaying unfiltered values.


## Polarity

Neurons can be designated as excitatory or inhibitory. When neurons are polarized in this way, their outgoing synapses are set in a way that respects their polarity.

- **Excitatory neurons**: Boundary of the neuron is red. When outgoing weights are set to a negative value, that value is flipped to become positive (i.e. strength is set using absolute value of whatever value it is set to, for example -5 becomes 5).
- **Inhibitory neurons**: Boundary of the neuron is blue. When outgoing weights are set to a positive value, that value is flipped to become negative (i.e. strength is set using the negative absolute value of whatever value it is set to, for example 5 becomes -5).
- **None**: A standard neuron with a black boundary.

## Neuron Timing Types and the Time Step Field

Different neuron types are updated in different ways. See the discussion of continuous vs discrete time in [update logic](../updateLogic)

## Quick Keyboard Adjustment of Neuron Properties

By selecting a neuron or set of neurons and pressing certain buttons, those neuron's properties can quickly be adjusted. This can be done while a network is running and can be useful for exploring a networks' properties.

- **Increment / Decrement**: Press the up and down buttons to adjust neuron activations. If the up key is pressed, the **increment** amount of a given neuron is added to the current activation, without regard to bounds or the nature of the neuron's update rule.
- **Contextual Increment / Decrement**: Press the up and down buttons with the option or alt key pressed. This adjusts the neuron's activation in a way that respects the parameters and boundaries of the update rules. Note that contextual increment / decrement is not implemented for all neuron types.
- **Randomize**: Press the "r" key or the "dice" button on the toolbar to randomize all selected neurons. How randomization is done varies by neuron type.
- **Clear**: Press the "c" key or the "eraser" button on the toolbar to set the activations of all selected neurons to 0. This also clears all fan-in synapses and their delay queues.

## Editing Neurons

More detailed adjustments parameters can be adjusted using the neuron properties dialog (select neurons and [set properties](../buildingBasics#setting-properties). The dialog contains several sections, including a section for adjusting common neuron properties, described below, and a section specific to the neuron update rule (these parameters are discussed in the relevant sub-pages).

## Common Neuron Properties

These fields are common to many different neuron update rules.

- **Activation**: The current level of activity of this neuron. How this should be interpreted is dependent on the neuron type and application (e.g. firing rate, voltage potential, etc.). This is represented by the neuron's color, and can be seen exactly by lingering over the neuron or observing the value in the neuron's properties.
- **Label**: Label neuron with a name.
- **Clamped**: See [Clamping](#clamping)
- **Clipping**: If a neuron uses clipping, then if its activation exceeds its upper or lower bound, the activation is set to the upper or lower bound that it exceeds. Similarly with weights and their strength.
- **Upper bound**: This field plays different roles depending on the type of the neuron (documented accordingly) but in general it determines the maximum level of activity of a node. It also determines what the most "active" color possible for the neuron is. The upper and lower bound also determine the bounds of randomization.
- **Lower bound**: This field plays different roles depending on the type of the neuron but in general it determines the minimum level of activity of a node. It also determines the "least active" color for a neuron.
- **Priority**: The priority of a given neuron, used in **priority based update**. Lower numbers correspond to higher priority (think of first priority, second priority, etc.), and will be updated first when the network's update method is set to priority based update. Priorities can be viewed in the GUI using the **view** menu.
- **Increment**: This sets the amount that a neuron is incremented when it is manually adjusted. For example, if increment is set to .1, then each time the up arrow is pressed the neuron will increase its activation by .1. This feature does not affect the neuron while the network is being iterated.
- **Polarity**: See [Polarity](#polarity).
- **Add Noise**: If set to true, random noise is added to the activation after each update. The noise is generated from a distribution (by default, a uniform distribution). This can be useful for simulating stochastic neural activity. See [Randomizers](/docs/utilities/randomizers) for more detail.

## Clamping

Clamped items are not updated on update. However even if clamped, manualy adjustment and adjustvement via input tables (as in training dialogs) is possible. This can be important because without clamping nodes will zero on update. 

In general, a clamped neuron will not change over time; it is "clamped" to its current value. The clamped neuron does not consult its update rule in order to update it's activation. It sits on whatever value it's had. It holds on to current activation. Note: However the clamped neurons values can still be changed by external sources. Manually pressing the up and down buttons will force them to change. Also, **testing input tables**, used in many **subnetworks**, can modify clamped neurons. The clamp neurons button in **neuron group** clamps all the neurons in that group.

## Popup Menu (Selected Neurons)

When right clicking on a neuron a popup-menu appears whose actions will usually apply to selected neurons. Most of these actions are described in the **menu documentation**. The following actions only appear in the popup menu:

- **Send Scalar Coupling To**: Create a **coupling** from selected source nodes' activation to a target consumer.
- **Receive Scalar Coupling From**: Create a **coupling** from a target producer elsewhere in Simbrain to the selected node, which treats them as an external **input** to the neuron.

