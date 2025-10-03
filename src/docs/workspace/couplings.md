---
title: Couplings
layout: default
parent: Workspace
has_children: false
nav_order: 20
---

# Couplings

A coupling is a one-way informational link between two objects in a Simbrain simulation. Couplings allow information to flow between components in the Simbrain [workspace](index.html) (e.g. from a network to a bar chart). A coupling consists of a producer and a consumer. Producers and consumers are [attributes](couplings.html#attributes).

There are several ways to create couplings:

## Quick Coupling via Context Menus

The easiest way to create couplings is through context menu shortcuts:
- **Right-click on a neuron group** and select `plot activation > bar chart` to couple a neuron group to a bar chart
- **Right-click on components** to see available coupling options in the context menu
- **Select coupling targets** directly from popup menus without needing to understand attribute details

## Manual Coupling Creation

For more control over coupling creation:
- **Create coupling menus**: Right-click on components to access "create coupling" options
- **Source-target selection**: Choose source and target components using popup menus  
- **Vector couplings**: Right-click on neuron arrays or image worlds to create vector couplings
- **Scalar couplings**: Right-click on individual neurons for scalar time series couplings

## Coupling Manager Interface

The coupling manager provides comprehensive coupling control:
- **Custom couplings**: Create couplings between any compatible attributes
- **Visibility settings**: Control which attributes are visible for coupling
- **Many-to-many couplings**: Create multiple couplings simultaneously
- **Advanced features**: Access specialized coupling options not available in context menus

Couplings can also be made programmatically in [simulations](../simulations).


# How Couplings Work

A coupling contains a *producer* and *consumer* attribute. These two attributes must be of the same type. The purpose of the coupling is to pass information from the producer to the consumer. A producer gathers information from a source object and then passes the result to a target object.

![Basic coupling](/assets/images/Coupling_General.png)

> In the underlying java code, the producer is generally calling a `getter` function on a Simbrain object and passing the result to a `setter` function on another object, as in `consumer.setValue(producer.getValue())`.

## Attributes

An attribute is any part of a component which has a value that may be sent to or recieved from another component, i.e. something that produces values or consumes values. Examples are neuron activations, weight strengths, or bars on a bar chart, or sensor values for an agent in a virtual world. A coupling is a pair that contains one producing attribute and one consuming attribute.

Most windows in Simbrain (i.e. workspace [components](components.html)) are wrappers around other objects (e.g. neurons), whose values can be linked to one another. These values are [attributes](couplings.html#attributes) and can (for instance) include such values as the activation of a given neuron in the workspace, or a value of a line on a time-series. Attributes can be thought of as the "hooks" or "anchor points" that make up couplings, and couplings represent the uni-directional data flow between these hooks. For example, a simulation might involve coupling neurons whose neurons are producers to a bar chart whose bars are consumers (to see this, try bar chart test in the script menu).

When coupling to neurons it is often suggested to use **add inputs**, because each node accumulates input values (see [network update](/docs/network/updateLogic)). Coupling into an activation overwrites the activation, and is not additive, so it is not reccomended. However coupling _from_ an activation (for example when using plots) is fine.

Each attribute has a data type, as described above: currently scalar (double), vector (array of doubles), and String.

The attributes in a component can be viewed in the coupling manager dialog.

## Attribute Visibility

Not all attributes are automatically "visible" in the relevant gui components (coupling manager, menus, etc. described below). The reason is that there are so many things that can be attributes (every numerical property of every neuron and synapse in a neural network, for example), that it would overwhelm the gui. Each component has some attributes visible by default. To modify what the visible attributes are, use the set attribute visibility dialog, accessible from the coupling manager. For example, in this dialog, we see available attributes for the currently selected network component. Only neuron activations are visible in this component. When clicking on the visibility checkboxes notice that attributes appear and disappear in the producer list window.

TODO: Add Image


# Coupling Types

Currently Simbrain has three types of attributes, and thus tyree types of coupling:

- Scalar (doubles in the underlying code).
- Vector (double-arrays). These are shown as green in the coupling manager.
- Text (strings). These are shown as blue in the coupling manager.

[Smile matrix](https://haifengl.github.io/) objects are converted into arrays.

Coupling can be theoretically any datatype in scripts and in the code, but these are the ones currently supported in the GUI.


# Scalar Couplings

An easy way to get a feel for how couplings work is through the example of scalar couplings. An example is shown below that links a [Network](../network/network.html) to an [OdorWorld](../worlds/odorworld.html). In this example one of the couplings in the pursuer simulation is shown (the simulation has 5 couplings total, one for each neuron). The coupling shown takes the current activation of the "turn right" neuron (the producer) and sends it to the turn right action on the mouse (the consumer). Note that in this example, the mouse will turn right when the workspace is updated, because there is more right turning activation than left turning activation.

There are many examples of scalar couplings that can be made. Here are some examples where the producer is a neuron:

- A coupling from a single neuron to a single neuron in another network.
- A coupling from a neuron's activation to a bar in a bar chart.
- A coupling from a neuron's activation to an agent's "motor" (turn left, turn right, go straight)
- A coupling from a neuron's activation to a specific column in a [Data World](../worlds/dataworld.html). If the data world is in iteration mode, then with each iteration of the workspace the current neuron activation is "logged" in a specific column of the dataworld.
- A coupling from a neuron's activation to text in a [Text World](../worlds/textworld.html). For example, when the neuron is active above .5 make the word "hello" appear in the text world

# Vector Couplings

The basic idea with vector couplings is the same as with scalar couplings, but they involve lists of numbers. In the image shown below, we see that the producer is the whole neuron group (which is interfaced with via the interaction box), and the consumer is the whole histogram component. The coupling takes an activation vector, consisting of the 9 activation values of the network, and sends it to the the histogram. As can be seen, two neurons have activations below 0, three have activations betwen .5 and 1, three have activations of 2, and one has an activation above 2.

These vectors can get huge! Tens of thousands of neuron activations! As with scalar couplings, there are many types of activations that can be made.Here are some examples where the producer is a neuron group:

- A coupling from one neuron group to another.
- A coupling from a neuron groups' activations to most types of chart.
- A coupling from a neuron group to a data world. On each iteration of the workspace the current activations of the neuron group are used to set the value of the current row of the data world. In this way activations can be logged and viewed in realtime.
- A coupling from a neuron group's activation to text in a [Text World](../worlds/textworld.html). For example, when a vector is close enough to a specific vector (in a vector space) make the word "hello" appear in the text world.

# Coupling Manager

The most comprehensive graphical access to couplings in Simbrain is via the coupling manager. It can be used to view attributes and couplings, and to create couplings. To open the manager, press the coupling manager button coupling icon on the Simbrain [toolbars](toolbars.html) or use the menu Couplings > Coupling Manager. The coupling manager allows you to create and delete couplings, set attribute visibility, and view workspace attributes.

The coupling manager is organized in to three columns. Multiple items in each of these three columns can be selected by holding the shift key while selecting items or ranges of items.

**Producer / Consumer lists**: these are the columns on the left and right side of the coupling manager: producers on the left; consumers on the right. Intuitively you are connecting a consumer to a producer to produce a coupling, which is displayed in the middle. The drop down box at the top of each column shows all current workspace components. Selecting that component shows what producing or consuming attributes are currently visible in that component.

**Coupling list**: this is the middle column of the coupling manager and it shows all current couplings in the workspace. The type of the coupling is color coded, as described above. The same view is also available in the coupling tab of the [property tabs](propertyTabs.html).

The following commands are possible in the coupling manager:

**Add coupling(s)**: This button creates new couplings between selected producers and consumers. The coupling creation process:

## Enhanced Coupling Features

The modern coupling system includes several advanced features:

**Priority-Based Coupling**: Attributes have priority values that determine automatic coupling preferences when multiple options are available (this feature applies to scripting notthe GUI )

**Attribute Filtering**: The coupling manager can filter attributes by type, visibility, and other criteria.

**Delete Couplings**: This button deletes all selected couplings from the coupling list.


**Set Attribute Visibilities**: This button opens up the **attribute visibility** dialog for the currently selected consumer or producer list.

