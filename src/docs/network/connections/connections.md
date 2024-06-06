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