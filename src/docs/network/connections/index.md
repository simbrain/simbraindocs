---
title: Connection Methods
layout: default
parent: Networks
has_children: true
nav_order: 30
---

# Connection Methods

There are three main ways to connect neurons to other neurons (or to themselves) with synapses.

## Quick-Connect (1-2 keyboard method)

To perform the 1-2 method: Select your desired source neuron(s), designate them as source by pressing `1`. Select your desired target neuron(s) then designate them as target by pressing `2`. 

## Menu Commands

To use menu commands: Select your desired source neuron(s), designate them as source by right-clicking on one of the selected neurons (if more than one is selected) and connect (all-to-all) by right-clicking on one of the selected neurons and clicking `Connect Neurons`. This will open up a window that gives you the option of customizing your connection preferences.

## Network Groups

To connect a whole neuron group to itself or to another group, you can use either the 1-2 keyboard method or menu commands. But instead of selecting individual neurons, you will select the group header on the upper left of the network. When connecting a group to itself, a second group header should appear, this doesn’t create a new group, but rather a subgroup representing all the connections made. By selecting the second group, you are able to make edits and update your connection preferences. Synapses are invisible by default, to make visible,  right-click on the second group and check the toggle synapse visibility button.

# Connection Strategies

## General Information on Making Connections

A red square should appear around every source neuron. After making a connection, a line connecting each source neuron to their target neuron should appear, as well as a weight attached to the target neuron. A source neuron will remain selected unless cleared or until a new source neuron is designated. To deselect a source neuron without having to create another, click on an empty space in the network and press ‘1.’ 

## Connection types

There are five different types of synapse group connections offered in Simbrain. To access and use these connection types, create a synapse group connecting one neuron group to another or self-connect a single group, open the edit menu, then click on the “Connection Manager” tab. Select the “Connection Manager” dropdown then select a connection type.

## Types of Synapse Connections

### All-to-All

When a neuron group is self-connected, an All-to-All connection creates a synapse connection between every neuron so that each neuron is directly connected to the other neurons in the group. 

### One-to-One

When a group is connected to itself, a One-to-One connection type will connect each neuron to itself. 

### Radial (Simple)

This connection type connects neurons in succession from a starting point. This creates weights in a directed manner and activation radiates outward from the starting point or initial site of activation. This type of radial connection is termed “simple” as it is the most basic radial pattern of activation.

### Radial

This connection type is like the Radial (Simple) type, but with more variations in how synapses radiate outward. This pattern is less predictable the the simple model.

### Sparse

This connection type creates synapse connections in such a way that not all neurons are connected to each other, hence the connections produced are “sparse” as opposed to complete (i.e like in All-to-All). Unlike in radial connections, where neurons also aren’t completely connected, sparse connections do not follow a particular pattern of activation. 



# Connecting Neurons
Video instruction on connecting neurons is [here](https://www.youtube.com/watch?v=dvJvY1zVQUE) (6:36 in the building networks video).

Perhaps one of the most essential parts of building a network aside from creating the neurons is connecting those neurons to other neurons (and sometimes the same neurons). Connections embody the GUI component of **synapses** in Simbrain, and therefore graphically allow the one to manipulate the parameters of the synapses connecting one set of neurons to another. In addition to granting access to underlying synapses, connections and their related GUI components allow one to determine the topology of how (out of a multitude of ways) one set of neurons can connect to another. In the side menu are pages dedicated to each of the standard ways neurons can be connected in Simbrain.

The quick and easy way to connect loose neurons is with the **quick 1 2** method!

## Source and Target Items

Various commands in Simbrain (e.g: connecting nodes, training weights, viewing weight matrices) require you to specify a set of source and target neurons (or neuron groups). Source neurons are surrounded by red squares and target neurons are surrounded by the standard green selection squares. Here is an example.

<!-- TODO --> Add Image

The same ideas and visual conventions apply to neuron groups, which can be selected via their **interaction boxes** and connected with **synapse groups**.

The main actions required to set up source and target neurons are as follows:

- To set source neurons: select a group of neurons and either (1) press the "1" key, (2) right click and select Connect > Set Source Neuron(s), or (3) use the Edit menu and *select Connect > Set Source Neuron(s)*.

- To set target neurons: simply select neurons as usual.

- To clear all source neurons: unselect all neurons (by clicking outside of any neuron), and (1) press the "1" key or (2) right click and select Connect > Set Source Neuron(s), or (3) use the Edit menu and select *Connect > Set Source Neuron(s)*.

- To clear specific source neurons: select the neurons of interest and (1) right click and select *Connect > Clear Source Neuron(s)*, or (2) use the Edit menu and select *Connect > Clear Source Neuron(s)*.

Note that when creating recurrent connections the same neurons will be both sources and targets.

## Main Connection Methods

Neurons can be connected by synapses in several different ways:

- The Quick Keyboard 1-2: Select source neurons, designate them as source by pressing "1", select target neurons, and connect (all to all) by pressing "2". Repeat as needed to connect series of neurons. This tends to be easy to get the hang of, and once the commands are familiar, many neurons can be quickly connected in this way.

- Menu Commands: Sam as the keyboard 1-2 but using the relevant menu commands to set as source and make the connections.

- Connection Objects: At the point that a connection is made using the "2" button, one can opt to create a special type of set of connections (not just all to all), and can also customize what the synapse strengths will be, using one of the built-in connection objects. See the pages in the sub-menu above.

- Scripts: Highly customized connections (e.g. those used in the cortical branching script) can be created using **scripts**.

## Editing Connections

Synapses are usually created as simple excitatory synapses with no special properties. Once created, synapses can be edited by double-clicking or using the synapse adjustment panel. Synapses in **synapse groups** have a complex suite of tools for viewing and customizing.

## View Connections as a Weight Matrix

See **weight matrix viewer** documentation.

# Synapse Adjustment Dialog

<!-- Separate page? -->

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

# Weight Visualization & Manipulation

TODO: Move this?

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

# Weight Matrix Viewer

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

