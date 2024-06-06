---
title: Networks
layout: default
has_children: true
nav_order: 15
---

# Network

The network component of Simbrain represents a simulated neural circuit. Networks are the core component of a Simbrain simulation. They are built using a simple graphical interface.

For things to quickly get started, see the [quick start](../quickstart.html).  Also see [this video](https://www.youtube.com/watch?v=dvJvY1zVQUE), which contains a series of links to short clips describing common network operations (adding neurons, connecting neurons, editing neuron groups, etc.)

Networks are built by creating neurons and connecting them with synapses. They are run by pressing the `play` or `step` buttons. For a sense of what the colors, circles, etc. signify see [visual conventions](#visual-conventions)

Networks contain a variety of objects (we call them ``network models''), including free-floating neurons and synapses, but also neuron arrays and weight matrices for array-based network, and a wide array of other more complex structures. Most objects can be linked to one another with different types of adapters. By combining these together you can create indefinitely many different kinds of networks. Many tools exist for organizing, arranging, training, and linking these objets together. Some of these objects have many subtypes, such as neurons (many kinds of neuron update rule). On this page we give general information about networks in Simbrain, and the sub-menus give more specific information for objects with subtypes.

TODO [point Mike to source code for this]:
- Neuron Groups: SOM, Competitive, WTA, etc.
- Synapse Rules: Long list.
- Synapse Groups [one page?]
- Training
- Update actions [where? and link to workspace level]

# Main Object Types

<!-- TODO: Make this a list and move all detail here to subpages -->

## Free neurons and synapses

Free neurons and synapses are part of ``classic'' Simbrain, allowing networks of arbitrary topology to be organized together. Both Neurons or nodes and synpases or weights are associated with update rules.

Simbrain has two kinds of rules: activation-based neurons, and **spiking neurons**, and also allows the two to co-exist. Activation-based neurons are used in more traditional, connectionst types of application, which abstract from biological details, while spiking neurons are used in more biologically realistic simulations. Since spikes are discrete events without a numerical value, some way of converting them into numbers is required (e.g. when a spike arrives at a synapse). This is handled using **spike responders**. See [computational neuroscience].


[Add image] For details on what they represent see [visual conventions](#visual-conventions). 

## Neuron Groups, Synapse Groups, and Neuron Collections

Free neurons and weights can be aggregated in various ways but are rather adjusted *as a group*, typically by double clicking or right-clicking on a yellow interaction box. Shown here is a cortical bursting network, which is a single neuron group and recurrent synapse group. Brief information on the visualization is here.

Neuron collections are a lightweight alternative to neuron groups. They can overlap. They have a green interaction box. Create by selecting nodes and pressing shift-G.

In sum: neuron groups 
- contains neurons as children
- They have their own layout object
- Deleting deletes all neurons
- Subclasses like SOM, Competitive, have custom update

Neuron Collections:
- Neuron collections are loose associations mainly for labeling
- No custom update
- Deleting does not delete neurons
- Can overlap each other and neuron groups even in subnetworks


## Neuron Arrays and Weight matrices

An alterantive to free nodes and weights is neuron arrays and weight matrices, which  support array based operations, as is standard in modern neural networks. These are much faster and more conventional.

Neuron collections and groups can be linked to neuron arrays with weight matrices or synapse groups.

## Subnetworks

These are customized collections of neurons, synapses, and neuron groups and sometimes training algorithms.

## Connection Managers

These are rules that control how source and target neurons are linked together.

## Layout objects

These can be used to organized free nodes and weights

## Smile objects

Using the smile ML library.


# Overview of System Logic

When Simbrain is first opened nothing happens. When the user "runs" the network it comes to life--an **update algorithm** is repeatedly called, which is visible in the form of spreading activity in network's nodes and other changes. These changes have a logic that is described here.  

For each network model (each type of object), inputs are updated first in one pass, then states in another. In this “buffered” scheme network update is independent of the order in which network models are updated.

1. UpdateInputs: For each network model, update an input data structure corresponding to “inputs” to that component .  E.g. a scalar input value for neurons, an array for layers, or nothing for synapses (which don’t use this). The paradigm case is summing weighted inputs. These computations can refer to other components (e.g. source neurons and intervening weights, or source layers and intervening weight matrices) as long as they don’t update other components.
1. Update: Update all network model states, using the input data structure if needed

In the figure below, the region below the horizontal lines shows the input, and how it can be updated in one pass, and then state updated in another. Thus update is independent of order.

![Update logic](/assets/images/updateLogic.png)


Inputs aggregate from multiple sources, including couplings. They should not be set directly.  

Outputs are usually the same as activations, except in some cases, like DLNetwork, where there are many activations.
So in many neuron and layer computations outputs are set, rather than activations, since in those contexts outputs just are activations


Neuron.updateInputs
- Add weighted input, which is summed outputs from fan-in synapses
- Synapse output can be connectionist or spiking
- If no spike-responder outputs are weights times  source activation
- If spike responder outputs are output of spike responder
- Either can be delayed

PSR is like output but for neurons. 

![Neuron logic](/assets/images/simbrainNeuron.png)





# Visual Conventions

Colored circles represent neurons or "nodes." 

The lines between nodes represent synaptic connections between neurons which direct the flow of activity in the network. The smaller blue and red discs at the ends of these lines represent synaptic connections. Each node and synapse can be individually adjusted by selecting it, pressing the up and down errors, or double clicking to reveal a dialog. 


Run / stp / stop: The network can be run by pressing pressing the play button in the tool-bar to repeatedly iterate the network. Note that the image on the button becomes that of a "stop" button . Pressing this button will stop the network. Thus the play/stop button acts as a toggle switch. You can also press the step button (or press "space") to iterate the network a single time. Sometimes repeatedly hitting the space bar is useful way to test a network.

Zooming: To zoom use the mouse-wheel or the pinch-to-zoom gesture on trackpads.

Panning: To pan press the command /ctrl key while left-clicking and dragging. Note that by default **auto-zoom** is turned on; if you plan to zoom in and pan a lot it should be turned off by double-clicking on the auto-zoom icon. To fit all objects on screen hit while panning the "F" key to invoke the **zoom to fit** command.

To begin create a **selection**--usually by left-click dragging a lasso around what you want. Then drag or nudge these items:

Basic moving: Simply left click and drag the selected items.

Nudging: For fine tuning, users can also use the arrow keys (with Shift held down) to "nudge" selected items. The nudge amount in pixels can be set in the **network preferences** dialog.

Placement manager. This controls how objects are placed in the network window.

