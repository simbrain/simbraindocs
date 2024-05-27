---
title: Building basics
layout: default
parent: Networks
has_children: false
nav_order: 50
---

# Building basics

## BUILDING AND EDITING BASICS

For an overview of networks and how to build them in Simbrain, see the [building networks](https://www.youtube.com/watch?v=dvJvY1zVQUE) video. Below the video is a set of links to specific clips describing all the main operations reqiured to build a network.

Network editing in Simbrain is modeled on a familiar "draw" interface which involves creating screen elements, copying, and pasting. This page focuses an adding nodes and configuring screen objects. There are special techniques for connecting neurons with synapses described on the **connections page**. Group level operations, for connecting neuron groups to each other are described in the **group pages**.

Be sure to familiarze yourself with Simbrain's **key commands**, which make a lot of things go faster!

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

## Setting Properties

Some detailed properties are set using a dialog box. Other properties, e.g. activation values for neurons and strengths for weights, can be set using keyboard and toolbar commands.

- Calling set properties dialog: Select the neurons or weights you want to change and:

1) Double-click on of the selected items
2) Right-click and select *set properties* in the popup menu
3) Clicking command-E or selecting *network > edit > set neurons or network > edit > set weights*

- Setting properties of multiple objects. Select the objects you want to modify. If you select both weights and neurons, which preference dialog comes up depends on which kind of item you click on.

- Set activation values: The activation value (and hence color) of neurons and the excitatory or inhibitory strength (and hence color and size) of weights can be manually adjusted. To do so, select one or more neurons and weights (both can be adjusted at the same time), and press the up and down arrow keys to increase or decrease these values. The amount increased or decreased is set by the "increment" field. Right and left arrow keys can also be used to increase or decrease these value.

- Clearing and randomizing values: Note that while screen items are selected, neuron values can also be set to zero by pressing "C" on the keyboard (weight values are not then set to zero, because this is equivalent to deleting them, which can be done with the delete key). Pressing "R" will randomize all selected screen items, neurons and weights.

## Copy and Paste

Selected items (including neuron groups, but not yet subnetworks) can be copied, cut, and paste similarly to the way they are on most contemporary GUI's. Lasso select groups of items, then fine tune your selection using Shift to add or remove items.

- Copy, cut, and paste in one of the following ways

1. Use standard keyboard shortcuts: control-C (copy), control-X (cut), control-V (paste).
2. Use the network menu and select copy, cut, or paste.
3. Right-click on one of the selected items and select copy or cut

- Smart copy/paste: Copy neurons, paste, move, and re-paste, and the new paste’s follow the rule. In this way you can quickly build big networks.