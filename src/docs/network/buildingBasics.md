---
title: Building Networks and Visual Conventions
layout: default
parent: Networks
has_children: false
nav_order: 10
---

This page gives intuitions about the Simbrain interface. More details on the underlying logic are in [updateLogic](updateLogic.html)

For an overview of networks and how to build them in Simbrain, see the [building networks](https://www.youtube.com/watch?v=dvJvY1zVQUE) video. Below the video is a set of links to specific clips describing all the main operations reqiured to build a network.

Network editing in Simbrain is modeled on a familiar "draw" interface which involves creating screen elements, copying, and pasting. This page focuses an adding nodes and configuring screen objects. Be sure to familiarize yourself with Simbrain's [key commands](../quickstart.html), which were carefully designed to allow for fast editing.

# Terminology

We refer to neurons and synapses even though in many cases these are not modelnig neurons and synapses and are what would often be called nodes or weights.

In a situation like this, the neuron on the left is a source neuron and the neuron on the right is a target neuron reative to the synapse.


<img src="/assets/images/sourceTarget.png" alt="basic terminology" style="width:300px;"/>


# Visual Conventions

Colored circles represent neurons or "nodes." 

The lines between nodes represent synaptic connections between neurons which direct the flow of activity in the network. The smaller blue and red discs at the ends of these lines represent synaptic connections. Each node and synapse can be individually adjusted by selecting it, pressing the up and down errors, or double clicking to reveal a dialog. 

Clamping bold faces items. Then  hey are not updated on update. However even if clamped, manualy adjustment and adjustvement via input tables (as in training dialogs) is possible. This can be important because without clamping nodes will zero on update. 

Zooming: To zoom use the mouse-wheel or the pinch-to-zoom gesture on trackpads.

Panning: To pan press the command /ctrl key while left-clicking and dragging. Note that by default **auto-zoom** is turned on; if you plan to zoom in and pan a lot it should be turned off by double-clicking on the auto-zoom icon. To fit all objects on screen hit while panning the "F" key to invoke the **zoom to fit** command.

To begin create a **selection**--usually by left-click dragging a lasso around what you want. Then drag or nudge these items:

Basic moving: Simply left click and drag the selected items.

Nudging: For fine tuning, users can also use the arrow keys (with Shift held down) to "nudge" selected items. The nudge amount in pixels can be set in the **network preferences** dialog.

Placement manager. This controls how objects are placed in the network window.

## More conventions (to integrate)

**Zero neuron**: a neuron with a value of 0 represents a non-active neuron, which is either not firing or is firing at a very low rate. In terms of voltages, this can be thought of as a neuron which is at its resting potential, that is, which has its baseline electrical charge, which is actually typically around -70mV (millivolts). In Simbrain this corresponds to the color 0.

**Positive activation**: a neuron with positive activation can be thought of as firing at above its normal rate. In terms of voltages, this can be thought of as a neuron which is above its resting potential, e.g. -50mV. Such a neuron is sometimes said to be "excited" or "depolarized." In Simbrain this corresponds to a shade of red by default.

**Negative activation**: it is hard to say what a neuron with negative activation corresponds to in terms of firing rates. In terms of voltages, this can be thought of as a neuron which is below its resting potential, e.g. -50mV. Such a neuron is sometimes said to be "inhibited" or "hyperpolarized." In Simbrain this corresponds to a shade of blue by default.

**Excitatory synapse**: a weight with a positive value corresponds to an excitatory synapse. When these synapses are activated the post-synaptic neuron is more likely to fire, they "heat things up," as it were. An excitatory synapse is one which releases excitatory neurotransmitters, which bind to channels post-synaptically which cause currents that lead to an increase in the post-synaptic voltage potential. AMPA synapses are a common type of excitatory synapse. Excitatory synapses are shown as red discs in Simbrain.

**Inhibitory synapse**: a weight with a negative value corresponds to an inhibitory synapse. When these synapses are activated the post-synaptic neuron is less likely to fire, they "cool things down," as it were. An inhibitory synapse is one which releases inhibitory neurotransmitters, which bind to channels post-synaptically which cause currents that lead to a decrease in the post-synaptic voltage potential. GABA synapses are a common type of inhibitory synapse. Inhibitory synapses are shown as blue discs in Simbrain.

**Zero synapse**: a weight with a value of 0 is a way of mathematically representing the absence of a connection. In Simbrain this is currently represented as blue, inhibitory.

**Net input**: the net input to a neuron represents, roughly, the summation of excitatory and inhibitory signals, from excitatory and inhibitory synapses, at the cell body.

**Bias**: the bias of a neuron can be thought as its base-line firing rate or its resting potential.

**Clipping / Upper and Lower Bounds**: There are upper and lower limits on the firing rate (in hertz) or voltage potential (in mV) of a neuron.

# Run Network

Run / stp / stop: The network can be run by pressing pressing the play button in the tool-bar to repeatedly iterate the network. Note that the image on the button becomes that of a "stop" button . Pressing this button will stop the network. Thus the play/stop button acts as a toggle switch. You can also press the step button (or press "space") to iterate the network a single time. Sometimes repeatedly hitting the space bar is useful way to test a network. 

On the logic involved see [update logic](updateLogic.html)


## Creating Objects

Here is how to create single objects and groups of objects. Primarily nodes are discussed here, but similar ideas apply for text objects, neuron groups, and other Simbrain objects.

- Creating a node: Nodes are created by pressing "P" or by pressing the new node button  in the toolbar. Any new nodes will be created at the last position clicked on-screen.

- Creating a line of nodes: Repeatedly pressing "P" or the new node button results in a line of nodes being created beginning at the last clicked position.
 
- Creating specific types of neurons: By default, new nodes are **Linear**. The default node type cannot currently be changed, though this is planned. To create a node of a specific type, simply create a new node, double click or right click the node and edit (or click command-E). From there one can select any neuron type in Simbrain from a dropdown menu. The same thing can be done for groups of nodes: select them all and double clcik on one
 
- Add neurons dialog: To create many nodes at once one can go to *Insert > Add Neurons* and instantly create an arbitrary number of neurons specified in the Add Neurons window. You can determine what type of neurons will be created (this part of the dialog is the same as the **neuron dialog**) and how they will be layed out (see **layouts**). There is also a checkbox which will make these neurons be created as a group.
 
- Copy / Paste / Duplicate: Create a node, set its type (as specified above), and then **copy and paste** or duplicate (command-D) repeatedly.
 
- Creating subnetworks or groups of nodes: Subnets are created using *Insert > Add Network*. **Subnetworks** and small groups of neurons can be created, copied, and repeatedly pasted to quickly create many sets of similar elements. Neuron groups can be created using the G command; existing loose nodes can be added to a network with Shift-G.
 
- Creating synapses or synapse groups: See the **connections** documentation.

## Selecting Objects

Neurons, weights, groups, and textboxes can be selected so that operations can be performed on the selected group of items (e.g., randomizing selected items, nudging them up or down, etc.). Selecting neurons and weights is important, because many Simbrain operations apply to selected sets of weights and/or nodes. Groups are selected by their **interaction boxes**.

The selection interface basically works the way most computer drawing programs work. Use the left-click button to "lasso" or "rubberband" screen items. Once some items are selected, you can hold down the shift key and single-click to fine tune your selection.

Note that most selection operations must be done in selection mode, the default mode, which is entered by pressing "S" or the selection button.

- Lasso: Left-click and drag the lasso around screen items you want to select. As items are selected a box appears around them.

- Lassoing weights: It can be hard to click on individual weights directly, so they can also be selected by dragging the lasso across the line associated with a weight, which is much easier.

- Single click: Single left-click on nodes and weights to select individual screen items. Zooming in on items can facilitate this.

- Shift key : Once some items are selected, you can hold down the shift key to add more items to your selection. Hold down Shift while lassoing to add or remove groups items; hold down Shift while single-clicking to add or remove single items.

- Key Shortcuts : "n" to select all nodes; "w" to select all weights; "a" to select nodes and weights. These are super useful! (Also, once selected: "r" to randomize, "c" to clear, and arrows to increment activation.)
- 

## Setting Properties

Some detailed properties are set using a [property dialog](../utilities/propertyEditor.html). Other properties, e.g. activation values for neurons and strengths for weights, can be set using keyboard and toolbar commands.

Calling set properties dialog: Select the neurons or weights you want to change and:
1. Double-click on of the selected items
2. Right-click and select `set properties` in the popup menu
3. Clicking command-E or selecting `network > edit > set neurons or network > edit > set weights`

- Setting properties of multiple objects. Select the objects you want to modify. If you select both weights and neurons, which preference dialog comes up depends on which kind of item you click on.
- Set activation values: The activation value (and hence color) of neurons and the excitatory or inhibitory strength (and hence color and size) of weights can be manually adjusted. To do so, select one or more neurons and weights (both can be adjusted at the same time), and press the up and down arrow keys to increase or decrease these values. The amount increased or decreased is set by the "increment" field. Right and left arrow keys can also be used to increase or decrease these value.
- Clearing and randomizing values: Note that while screen items are selected, neuron values can also be set to zero by pressing "C" on the keyboard (weight values are not then set to zero, because this is equivalent to deleting them, which can be done with the delete key). Pressing "R" will randomize all selected screen items, neurons and weights.
- To clear nodes you select them and press `C`
- To clear weights you select them and press `Shift-C` (this prevents accidentally clearing them)
- To clamp or freeze nodes or weights use `Shift-F`

## Copy and Paste

Selected items (including neuron groups, but not yet subnetworks) can be copied, cut, and paste similarly to the way they are on most contemporary GUI's. Lasso select groups of items, then fine tune your selection using Shift to add or remove items.

Copy, cut, and paste in one of the following ways

1. Use standard keyboard shortcuts: control-C (copy), control-X (cut), control-V (paste).
2. Use the network menu and select copy, cut, or paste.
3. Right-click on one of the selected items and select copy or cut

Smart copy/paste: Copy neurons, paste, move, and re-paste, and the new paste’s follow the rule. In this way you can quickly build big networks.


# Wand Tool

The wand is used to create patterns of activation on sets of neurons. It can be thought of as a kind of virtual **electrode**, a way of injecting current in a network.

Some ways it can be used are to set the patterns to be learned by a **Hopfield Network** or to dynamically inject activation in to a running simulation.

As of the current version of Simbrain the wand only injects activation. Other uses for the wand tool are planned for future releases.

<!-- TODO --> Add GIF

## Using the wand

To use the wand:

1. Click on the wand icon
2. Pass the wand over neurons while left-clicking
3. All neurons will reach their maximum level (the “upper bound” value), as shown in the image.

## Adjusting the wand

To adjust the size of the wand in pixels (and thus how many neurons are affected by the wand) set the wand radius field in the **network preferences dialog**.

# Placement Manager

Manages intelligent placement of new objects in a NetworkPanel

It is based on two concepts. First, an anchor point. Second, a delta between the current anchor point and previous anchor point.  

The anchor point is reset when you click on the screen, to the point you clicked on.

Repeatedly adding an object (using new Neuron, etc.) adds them at a fixed offset from the anchor point using `DefaultOffsets`. With each addition, the current and previous anchor points are updated. See `placeObject`.

Adding an object using copy-paste or duplicate adds them using the delta between the current anchor point and the previous anchor point. This allows custom "paste trails" to be created.

To set the offset use `option-drag`. A red line is shown indicating what the offset will be.

