---
title: Connection Methods
parent: Networks
layout: default
has_children: false
nav_order: 35
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


