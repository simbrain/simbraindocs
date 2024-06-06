---
title: Building basics
layout: default
parent: Networks
has_children: false
nav_order: 10
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

# Weight Visualization & Manipulation

Tools for visualizing and adjusting weights can be invoked by selecting an arbitrary set of weights and invoking the **synapse adjustment dialog** (from the edit menu or using command-R), or in the various tabs of the **synapse group** dialog, which is invoked by double clicking on a synapse group's interaction box or right-clicking on it and selecting Adjust Synapses from the menu.

This page describes most of the tabs of the **synapse group** dialog, except for the first properties tab.

## Synapse Values Tab

<!-- TODO --> Add Image

### Synapse Statistics

The top part of the adjust synapses tab shows basic statistics about a populations of synapses. Basic numerical statistics, as well a **histogram** can be made to display weight statistics and values for synapses of both or only one polarity, and optionally can overlay the two for a direct comparison.Which polarities are viewed is set using the combo box:

Both: Values are calculated using both polarities, assigning negative values to inhibitory weights.

Overlay: If "Overlay" is selected, it will display these values for all synapses in the group, using the absolute value of all inhibitory weight values.

Excitatory / Inhibitory: If a single polarity is selected it will display those statistics only for the synapses of that polarity, again using absolute values for inhibitory synaptic weights.

### Revalidate

Occasionally outside entities like **scripts** or **trainers** will alter synaptic weights in a way which changes their polarity without alerting the synapse group. This is easy to spot as the histogram will show that some "excitatory" synapses have a negative value and/or some "inhibitory" synapses have a positive value. In order to reconcile this, the user is given access to a "Revalidate" button located in this panel. Revalidating a synapse group will cause it to iterate over all the synapses in the group and assign them to the correct set based on their polarity (the sign of their strength/weight).

### Excitatory / Inhibitory Ratio

It is also possible to change the ratio of excitatory and inhibitory synapses in the group from here. The ratio can be set in three ways. Setting it one way will updated the other displays.

Main slider bar: Slide to determine percentage of excitatory synapses.

Percent Excitatory / Inhibitory: Text field to set the value more precisely.

### Excitatory and Inhibitory Distributions

The probability distributions used to determine the strengths of excitatory and inhibitory synapses can be set at the bottom of the synapse values tab, using **randomizer** panels.

## Excitatory and Inhibitory Synapse Types

In this tab the basic properties of the inhibitory and excitatory synapses can be separately set. The basic dialog is the same as that used for **synapses**.

Note: *Although it is not in the GUI as of 3.0, neurons can also possess a polarity. If that is the case then all efferent synapses from that neuron must be of the same polarity as the neuron. In these cases editing the ratio of excitatory to inhibitory synapses is impossible from this panel.*

<!-- TODO --> Add Image

# WEIGHT MATRIX VIEWER

The weight matrix viewer allows weights connecting two sets of neurons to be viewed in a tabular format. They can be used either for **loose neurons** or within **synapse groups**.

One can manipulate the strength of connections through the weight matrix viewer. Clicking on a cell allows one to manipulate the synaptic strength of the connection represented by the cell. Cells can also be selected (e.g. using command-A) or shift-selected, and then groups of them randomized or otherwise altered. Values can also be loaded from a .csv file. Their values can also be saved to a .csv file (see toolbar below)

### Loose Neuron Weight Matrix Viewer

To view the synapses connecting two sets of loose neurons set **source and target neurons** and then select Show Weight Matrix from the insert menu or by right clicking on any of the relevant neurons. Cells in the table correspond to connections between source (red) neurons as rows and target (green) neurons as columns. Values in these cells represent the strengths of connections. Non-existent connections are represented by gray boxes (see the image below).

### Synapse Group Weight Matrix Viewer

In this context the matrix represents the weights of a **synapse group**, which connects a source and target neuron group. Cells in the table correspond to connections between neurons in the source neuron group (rows) and target neuron group (column). Values in these cells represent the strength of connections.

Note: Currently the weight matrix viewer is disabled for synapse groups with more than 10,000 synapses. This is due to the fact that a table of that size would be unnavigable, and of dubious use. At that size individual synapses are much less important. This is also to prevent users from accidentally attempting to view *extremely* large tables (much greater than 10,000 entries), which can cause the JVM to run out of memory.

<!-- TODO --> Add Image

### Weight Matrix Viewer Toolbar

- Randomize: Pressing the Random button will uniformly randomize the strength of all connections represented in the weight matrix viewer between two numbers (default (1,-1))

- Preferences: Pressing the Preferences button will allow one to set the upper and lower bounds on the viewer's randomize function.

- Open: Pressing the Open button allows one to open a .csv file and set the values of the connections represented by the viewer to the values specified in the file. The .csv being loaded must have the same dimensions as the weight matrix of the synapse group.

- Save: Pressing the Save button allows one to save the weight matrix as a .csv file.

## Synapse Adjustment Dialog

The top part of this dialog shows **synapse statistics** about the selected set of synapses. The bottom part contains tabs that can be used to adjust the synapses, by pressing the Apply button. Changes are immediately shown in the top statistics area.

<!-- TODO --> Add Image

The dialog is invoked in the same way the weight matrix viewer is, by selecting **source and target** neurons and then using a right-click menu.

### Randomizer

Use a **randomizer** to set the weight strengths.

### Perturber

Add random values to weight strengths, using a **randomizer**.

### Pruner

Remove all synapses with a value below the indicated threshold by pressing the button.

### Scaler

Scale all synapse values up or down by changing their strengths as much as the indicated percentage.