---
title: Neurons
layout: default
parent: Networks
has_children: true
nav_order: 20
---

# Neurons

Neurons or "nodes" are represented by circles. The numbers inside the neurons corresponds to their "activation level." (What this level represents varies with neuron type: in many cases it can be thought of as representing the rate of a firing of a neuron.) Visibly, these numbers are rounded; functionally, however, double precision floating point values are used. This double-precision value can be seen by lingering over a neuron or double clicking on it.

## Neuron Update Rules (or "Neuron Types")

There are a variety of different neuron types in Simbrain, each of which has numerous parameters that can be set. This page addresses properties common to all of the different neuron types. Details on particular neuron types can be found on their respective pages. Beyond those provided, custom types and behaviors can be created using [simulations](../../simulations)).

## Neuron Colors

The color of a neuron represents the overall state of the neuron depending upon its update rule. Loosely-speaking neuron models can be broken up into two classes: **spiking** and non-spiking, and this distinction accounts for many of the differences between the meanings of different colors. In general, blue corresponds to a quiescent or inhibitory state, white corresponds to a 0 or neutral state, and red corresponds to an active or excitatory state. For neuron models which have explicit action potentials (spiking neurons), red indicates the neuron is near its threshold, a yellow flash indicates an action potential. A comparison of the two can be seen in the image to the left.

These color conventions can be customized, as described in the **preference dialog**. The closeness of the neuron's activation level to the neuron's upper or lower bound is visualized by the intensity of the color.

- **Nodes**. Colored circles represent neurons or "nodes." 
- **Synapse**. The lines between nodes represent synaptic connections between neurons which direct the flow of activity in the network. The smaller blue and red discs at the ends of these lines represent synaptic connections. Each node and synapse can be individually adjusted by selecting it, pressing the up and down errors, or double clicking to reveal a dialog. 
- **Zero neuron**: a neuron with a value of 0 represents a non-active neuron, which is either not firing or is firing at a very low rate. In terms of voltages, this can be thought of as a neuron which is at its resting potential, that is, which has its baseline electrical charge, which is actually typically around -70mV (millivolts). In Simbrain this corresponds to the color 0.
- **Positive activation**: a neuron with positive activation can be thought of as firing at above its normal rate. In terms of voltages, this can be thought of as a neuron which is above its resting potential, e.g. -50mV. Such a neuron is sometimes said to be "excited" or "depolarized." In Simbrain this corresponds to a shade of red by default.
- **Negative activation**: it is hard to say what a neuron with negative activation corresponds to in terms of firing rates. In terms of voltages, this can be thought of as a neuron which is below its resting potential, e.g. -50mV. Such a neuron is sometimes said to be "inhibited" or "hyperpolarized." In Simbrain this corresponds to a shade of blue by default.
- **Net input**: the net input to a neuron represents, roughly, the summation of excitatory and inhibitory signals, from excitatory and inhibitory synapses, at the cell body.
- **Bias**: the bias of a neuron can be thought as its base-line firing rate or its resting potential.
- **Clipping / Upper and Lower Bounds**: There are upper and lower limits on the firing rate (in hertz) or voltage potential (in mV) of a neuron.


<!-- TODO: Add GIF -->

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
- **Clear**: Press the "c" key or the "eraser" button on the toolbar to set the activations of all selected neurons to 0.

## Neuron Dialog / Editing Neurons

More detailed adjustments parameters can be adjusted using the neuron dialog. The dialog contains several sections, including a section for adjusting common neuron properties, described below, and a section specific to the neuron update rule (these parameters are discussed in the relevant sub-pages).

The neuron dialog can be invoked in the following ways:

- **Setting single neurons**: Double click on a neuron or right click on it and select set properties.

- **Setting multiple neurons**: Select more than one neuron, and either double click on one of the neurons, select set properties from the popup or network menu, or use press command-E**.** A multiple neuron dialog box will appear. If the selected neurons are of different types, only the common properties appear. Otherwise all properties appear. Consistent properties are shown, inconsistent properties are marked by a null string: ". . ." Changes you make will apply to all selected neurons.

## Common Neuron Properties

- **Activation**: The current level of activity of this neuron. How this should be interpreted is dependent on the neuron type and application (e.g. firing rate, voltage potential, etc.). This is represented by the neuron's color, and can be seen exactly by lingering over the neuron or observing the value in the neuron's properties.
- **Label**: Label neuron with a name.
- **Clamped**: See [Clamped](#clamping)
- **Clipping**: If a neuron uses clipping, then if its activation exceeds its upper or lower bound, the activation is set to the upper or lower bound that it exceeds. Similarly with weights and their strength.
- **Upper bound**: This field plays different roles depending on the type of the neuron (documented accordingly) but in general it determines the maximum level of activity of a node. It also determines what the most "active" color possible for the neuron is. The upper and lower bound also determine the bounds of randomization.
- **Lower bound**: This field plays different roles depending on the type of the neuron but in general it determines the minimum level of activity of a node. It also determines the "least active" color for a neuron.
- **Priority**: The priority of a given neuron, used in **priority based update**. Lower numbers correspond to higher priority (think of first priority, second priority, etc.), and will be updated first when the network's update method is set to priority based update. Priorities can be viewed in the GUI using the **view** menu.
- **Increment**: This sets the amount that a neuron is incremented when it is manually adjusted. For example, if increment is set to .1, then each time the up arrow is pressed the neuron will increase its activation by .1. This feature does not affect the neuron while the network is being iterated.
- **Polarity**: See [Polarity](#polarity).


## Clamping

Clamped items are not updated on update. However even if clamped, manualy adjustment and adjustvement via input tables (as in training dialogs) is possible. This can be important because without clamping nodes will zero on update. 

In general, a clamped neuron will not change over time; it is "clamped" to its current value. The clamped neuron does not consult its update rule in order to update it's activation. It sits on whatever value it's had. It holds on to current activation. Note: However the clamped neurons values can still be changed by external sources. Manually pressing the up and down buttons will force them to change. Also, **testing input tables**, used in many **subnetworks**, can modify clamped neurons. The clamp neurons button in **neuron group** clamps all the neurons in that group.

## Popup Menu (Selected Neurons)

When right clicking on a neuron a popup-menu appears whose actions will usually apply to selected neurons. Most of these actions are described in the **menu documentation**. The following actions only appear in the popup menu:

- **Send Scalar Coupling To**: Create a **coupling** from selected source nodes' activation to a target consumer.
- **Receive Scalar Coupling From**: Create a **coupling** from a target producer elsewhere in Simbrain to the selected node, which treats them as an external **input** to the neuron.


# Activity Generators

Activity generators are like neurons (in fact in the **code** they just are neurons which implement a special interface), except they don't respond to inputs, but only produce outputs. They are thus activity or output generators. They are represented by squares rather than circles in the GUI.

Activity generators behave almost identically to neurons so for information on how to build and edit them see the [building and editing](../building_editing/buildingBasics.html) docs.

For example, to create an activity generator go the `Network > Insert menu` and select activity generator.