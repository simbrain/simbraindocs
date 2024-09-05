---
title: Building Networks
layout: default
parent: Networks
has_children: false
nav_order: 1
---

# Building Networks

This page gives intuitions about the Simbrain interface. More details on the underlying logic are in [updateLogic](updateLogic.html) For an overview of networks and how to build them in Simbrain, see the [building networks](https://www.youtube.com/watch?v=dvJvY1zVQUE) video. This page focuses an adding nodes and configuring screen objects. Be sure to familiarize yourself with Simbrain's [key commands](../quickstart.html), which were carefully designed to allow for fast editing.

# Basics

Basic editing is straightforward, and most actions are meant to be intuitive relative to any standard draw program which involves selecting, copying, and editing with double clicks etc. For the most part you simply left click and drag the selected items (more on selection below). Network models can be lasso selected and the selection edited using the shift key to toggle selection.

- Nudging: For fine tuning a selection, users can also use the arrow keys (with Shift held down) to "nudge" selected items. The nudge amount in pixels can be set in the network preferences dialog.

- Zooming: To zoom use the mouse-wheel or the pinch-to-zoom gesture on trackpads, or the toolbar buttons, which include zoom to fit (fit everything on the page automatically) or reset, which places the zoom level at 1:1. Auto-zoom mode makes things always zoom to fit.

- Panning: To pan press the command /ctrl key while left-clicking and dragging. Note that by default auto-zoom is turned on; if you plan to zoom in and pan a lot it should be turned off by dclicking on the auto-zoom icon. 

# Creating Objects

Primarily nodes are discussed here, but similar ideas apply for text objects, neuron groups, and other Simbrain objects. 

- Creating a node: Nodes are created by pressing "P" or by pressing the new node button  in the toolbar. Any new nodes will be created at the last position clicked on-screen.

- Creating a line of nodes: Repeatedly pressing "P" or the new node button results in a line of nodes being created beginning at the last clicked position.
 
- Creating specific types of neurons: By default, new nodes are linear. The default node type cannot currently be changed, though this is planned. To create a node of a specific type, simply create a new node, double click or right click the node and edit (or click command-E). From there one can select any neuron type in Simbrain from a dropdown menu. The same thing can be done for groups of nodes: select them all and double clcik on one
 
- Add neurons dialog: To create many nodes at once one can go to `Insert > Add Neurons` and instantly create an arbitrary number of neurons specified in the `Add Neurons` window. You can determine what type of neurons will be created (this part of the dialog is the same as the neuron dialog) and how they will be layed out (see layouts). There is also a checkbox which will make these neurons be created as a group.
 
- Copy / Paste / Duplicate: Create a node, set its type (as specified above), and then copy and paste or duplicate (command-D) repeatedly.
 
- Creating subnetworks or groups of nodes: Subnets are created using *Insert > Add Network*. Subnetworks and small groups of neurons can be created, copied, and repeatedly pasted to quickly create many sets of similar elements. Neuron groups can be created using the G command; existing loose nodes can be added to a network with Shift-G.
 
- Creating synapses or synapse groups: See the connections documentation.

# Selecting Objects

Neurons, weights, groups, and textboxes can be selected so that operations can be performed on the selected group of items (e.g., randomizing selected items, nudging them up or down, etc.). Selecting neurons and weights is important, because many Simbrain operations apply to selected sets of weights and/or nodes. Groups are selected by their interaction boxes. The selection interface basically works the way most computer drawing programs work. Use the left-click button to "lasso" or "rubberband" screen items. Once some items are selected, you can hold down the shift key and single-click to fine tune your selection.

Note that most selection operations must be done in selection mode, the default mode, which is entered by pressing "S" or the selection button.

- Lasso: Left-click and drag the lasso around screen items you want to select. As items are selected a box appears around them.

- Lassoing weights: It can be hard to click on individual weights directly, so they can also be selected by dragging the lasso across the line associated with a weight, which is much easier.

- Single click: Single left-click on nodes and weights to select individual screen items. Zooming in on items can facilitate this.

- Shift key : Once some items are selected, you can hold down the shift key to add more items to your selection. Hold down Shift while lassoing to add or remove groups items; hold down Shift while single-clicking to add or remove single items.

- Key Shortcuts : "n" to select all nodes; "w" to select all weights; "a" to select nodes and weights. These are super useful! (Also, once selected: "r" to randomize, "c" to clear, and arrows to increment activation.)

# Source and Target Objects

One common motif used for several operation in Simbrain is a source-target operation, where one set of models is designated as source (red), and the other as target (green). 

Here are some source and target neurons which are about to connected in a feed-forward way.

<img src="/assets/images/sourceTarget.png" alt="source-target format" style="width:400px;"/>

This technique is used in connecting neurons, neuron groups, and neuron arrays together, in using immediate learning, and in other ways. It is one of the few cases where we had to come up with our own new UI innovation, but in our experience it's quite easy to learn and get used to.

Generally there are three things to do, which we call the "1-2 trick"

1. To designate objects as source select them and press the `1` key. They will be surrounded by a red border. You can also use menu command like right click select `Set Source(s)`.

2. To designate objects as target select them as usual.

3. Followup actions also use number keys like `2` and `3` to connect thigns.

4. To deselect source objects click on an empty space in the network and press `esc` or `1` . You can also use menu command like right click select `Clear Source(s)`.


# Connection Methods


There are three main ways to connect neurons to other neurons (or to themselves) with synapses.

Video instruction on connecting neurons is [here](https://www.youtube.com/watch?v=dvJvY1zVQUE) (6:36 in the building networks video).

Note that these methods are designed to respect neuron polarity, if it is used. 

## Quick-Connect (1-2 trick)

The quick and easy way to connect neurons is with the "1-2 trick"

To use this method: Select your desired source neuron(s), designate them as source by pressing `1`. Select your desired target neuron(s) then designate them as target by pressing `2`. 

Note that when creating recurrent connections the same neurons will be both sources and targets.  A quick way to make a recurrent network is to make a bunch of nodes and use keyboard commands: `N > 1 > 2 > A > R`


## Menu Commands

To use menu commands: Select your desired source neuron(s), designate them as source by right-clicking on one of the selected neurons (if more than one is selected) and connect (all-to-all) by right-clicking on one of the selected neurons and clicking `Connect Neurons`. This will open up a window that gives you the option of customizing your connection preferences.

## Groups and Collections

<!-- Links -->
1-2 can be used on interaction boxes for groups and collections to make a weight matrix connecting two groups. 

1-3 can be used to make a synapse group rather than a weight matrix.

## Connection Strategies and Custom Scripts

More customized methods include application of our highly developed set of [connection strategies](connections) and even more custom approaches using [simulations](../simulations).

## Editing weights

Several dialogs exist for setting and polarizing weights according to our built-in distributions and visualizing the results with histograms. See [synapse adjustment dialog](otherDialogs#Synapse-Adjustment-Dialog).


# Setting Properties

Many properties are set using a [property dialog](../utilities/propertyEditor.html). For most items you can select in one of these ways:

1. Double-click on of the selected items
2. Right-click and select `set properties` in the popup menu
3. Clicking command-E or selecting `network > edit > set neurons or network > edit > set weights`

This works for single or in some cases multile objects of the same type. For multiple nodes

Examples:

- Set activation values for nodes: The activation value (and hence color) of neurons and the excitatory or inhibitory strength (and hence color and size) of weights can be manually adjusted. To do so, select one or more neurons and weights (both can be adjusted at the same time), and press the up and down arrow keys to increase or decrease these values. The amount increased or decreased is set by the "increment" field. Right and left arrow keys can also be used to increase or decrease these value.
- Clearing and randomizing values: Note that while screen items are selected, neuron values can also be set to zero by pressing "C" on the keyboard (weight values are not then set to zero, because this is equivalent to deleting them, which can be done with the delete key). Pressing "R" will randomize all selected screen items, neurons and weights.
- To clear nodes you select them and press `C`
- To clear weights you select them and press `Shift-C` (this prevents accidentally clearing them)
- To clamp or freeze nodes or weights use `Shift-F`

# Copy and Paste

Selected items (including neuron groups, but not yet subnetworks) can be copied, cut, and paste similarly to the way they are on most contemporary GUI's. Lasso select groups of items, then fine tune your selection using Shift to add or remove items.

Copy, cut, and paste in one of the following ways

1. Use standard keyboard shortcuts: control-C (copy), control-X (cut), control-V (paste).
2. Use the network menu and select copy, cut, or paste.
3. Right-click on one of the selected items and select copy or cut

Smart copy/paste: Copy neurons, paste, move, and re-paste, and the new paste’s follow the rule (see placement manager and paste trails below). In this way you can quickly build big networks.

# Wand Tool

The wand is used to create patterns of activation on sets of neurons. It can be thought of as a kind of virtual electrode, a way of injecting current in a network.

Some ways it can be used are to set the patterns to be learned by a Hopfield Network or to dynamically inject activation in to a running simulation.

As of the current version of Simbrain the wand only injects activation. Other uses for the wand tool are planned for future releases.

## Using the wand

To use the wand:

1. Click on the wand icon
2. Pass the wand over neurons while left-clicking
3. All neurons will reach their maximum level (the “upper bound” value), as shown in the image.

## Adjusting the wand

To adjust the size of the wand in pixels (and thus how many neurons are affected by the wand) set the wand radius field in the network preferences dialog.

# Placement Manager and Paste Trails

Manages intelligent placement of network models in the GUI. Often we want to create sets of neurons in a line from a specific points. This can be customized in Simbrain.

The system works via two modes:

1. Click mode: Objects are placed wherever you last clicked on screen.

2. Offset mode. Additional objects are at an offset from the last placed object. This allows "paste trails" to be created.

Offsets differ sepending on what type of object it is, so that objects are placed at a nice offset from one another.

## Custom offsets for paste trails

The default offsets are horizontal and so paste trails occur from left-to right creating horizontal lines of neurons, neuron groups, etc. However, sometimes it's desirable to create, say, a vertical line.  To set a custom offset use option drag. Click on a model, hold down option, and move the model to a custom location relative to the last-created model. A red line is shown indicating what the custom offset will be.

## State diagram

Here is a state diagram explaining how the system works:

```mermaid
graph TD;
    click_mode["Click Mode"]
    offset_mode["Offset Mode"]
    
    click_mode --"place object at last clicked location"---> offset_mode
    offset_mode --"click canvas/copy object"---> click_mode
    offset_mode --"place object using offset"--> offset_mode
```

