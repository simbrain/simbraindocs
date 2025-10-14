---
title: Neuron Groups and Collections
layout: default
parent: Networks
has_children: true
nav_order: 90
---

# Neuron Groups and Collections

A neuron group is a logical grouping of neurons surrounded by a gray line and an [interaction box](/docs/network/buildingBasics.html#interaction-boxes). There are various types of neuron groups in Simbrain, each with parameters that can be set, and they are also constituents of [subnetworks](../subnetworks). 

<img src="/assets/images/neuronGroup.png" alt="neuron group" style="width:300px;"/>

## Creation

To create a neuron group:

- Use the `Insert` menu and select a neuron group type
- Use `Insert > Add neurons...` and check the option to create a group

When creating a group, you can specify the type from a dropdown menu that includes all available group types.

## Connecting Neuron Groups

Neuron groups can be connected using [Weight Matrices](../arraysMatrices) or [Synapse Groups](../synapsegroups):

- **Weight Matrices**: Use the [1-2 trick](../buildingBasics.html#source-and-target-objects) to connect groups with matrix-based connections
- **Synapse Groups**: Use the [1-3 trick](../buildingBasics.html#source-and-target-objects) to connect groups with individual synapse management

## Common Parameters

All neuron group types share these common parameters:

- **Number of Neurons**: The number of neurons to create in the group (only visible during creation)

Each specialized group type has additional parameters specific to its behavior. See the individual group type pages for details.


# Neuron Collections vs Neuron Groups

Understanding the distinction between neuron collections and neuron groups is crucial for effective network organization.

## Neuron Collections

Neuron collections are lightweight assemblages of neurons with minimal structural constraints:

Creation: Select neurons and press `Shift+G` or use the right-click menu

Characteristics:
- **Loose Associations**: Primarily for labeling and visual organization
- **Overlap Support**: Can share neurons with other collections and groups
- **Flexible Membership**: Neurons can belong to multiple collections simultaneously
- **No Custom Update**: Collections don't enforce specific update rules
- **Non-destructive Deletion**: Removing a collection doesn't delete its neurons
- **Green Interaction Box**: Visual distinction from neuron groups

Use Cases:
- Organizing neurons by functional role (e.g., "input layer", "hidden layer")
- Creating overlapping functional groups for analysis
- Temporary groupings for specific operations
- Labeling regions without structural constraints

## Neuron Groups

Neuron groups enforce structural consistency and provide specialized functionality:

Creation: Use Insert menu or create during neuron addition with the group checkbox

Characteristics:
- **Structural Containers**: Neurons are children of the group
- **Consistent Update Rules**: All neurons share the same update rule type
- **Exclusive Membership**: Neurons belong to only one group at a time
- **Custom Layouts**: Groups have their own layout management
- **Specialized Subclasses**: SOM, Competitive, WTA, and other specialized types
- **Destructive Deletion**: Removing a group deletes all its neurons
- **Yellow Interaction Box**: Visual distinction from collections

Use Cases:
- Layer organization in feed-forward networks
- Self-organizing maps and competitive learning structures
- Groups requiring uniform update rules
- Structured network architectures

## Relationship to Update Responsibilities

The choice between collections and groups affects network update behavior:

### Neuron Groups
- **Centralized Updates**: The group manages updates for all neurons
- **Consistent Timing**: All neurons update simultaneously
- **Specialized Processing**: Subclasses can implement custom group-level operations
- **Polarity Management**: Groups can enforce consistent excitatory/inhibitory properties

### Neuron Collections  
- **Individual Updates**: Each neuron updates independently
- **Heterogeneous Rules**: Neurons can have different update rules
- **Flexible Timing**: Update timing depends on individual neuron properties
- **Mixed Polarities**: Collections can contain both excitatory and inhibitory neurons

## Connection Compatibility

Both collections and groups can be connected via:
- **Weight Matrices**: Use the 1-2 trick for matrix-based connections
- **Synapse Groups**: Use the 1-3 trick for individual synapse management

The choice of connection type often depends on whether you need fine-grained control (synapse groups) or efficient computation (weight matrices).

<img src="/assets/images/neuronCollections.png" alt="neuron colletions" style="width:300px;"/>

## Creation/Edit Dialog

When creating or editing a neuron group, several common properties are available:

- **Group ID**: Unique identifier for the group
- **Label**: Display name for the group
- **Population**: Number of neurons in the group (read-only after creation)
- **Neuron Type**: The update rule governing neurons in the group
- **Parent**: The parent network or subnetwork, if any

Additional tabs provide access to:

- **Neurons**: Configure individual neuron properties
- **Layout**: Arrange neurons spatially
- **Input Data**: Set up input patterns for training or testing

Group-specific parameters vary by type. See individual group type pages for details on specialized parameters like learning rates, temperature, or winner values.

## Neurons

See the [neuron](../neurons) page.

## Layout

See the [layouts](../ui/layouts) page.

## Input Data

See the [test inputs](../ui/testInputs) page.

## Right Click Menu

The neuron group context menu provides access to common operations. Some specialized group types (like SOM) have additional custom menu items.

### Basic Operations
- **Edit**: Opens the group properties dialog (same as double-clicking the interaction box)
- **Rename**: Change the group's display name
- **Remove Neuron Group**: Delete the group and all its neurons
- **Apply Layout**: Rearrange neurons using different layout algorithms

### Selection
- **Select Internal Neurons**: Select all neurons in the group (keyboard shortcut: `S`)
- **Select Incoming Synapses**: Select synapses targeting this group
- **Select Outgoing Synapses**: Select synapses originating from this group

### Clamping
- **Clamp Neurons**: Clamp all neurons in the group (see [Clamping](../neurons#clamping))
- **Unclamp Neurons**: Unclamp all neurons in the group

### Connecting Groups
- **Connect Selected Objects with Weight Matrix**: Connect to other groups using weight matrices
- **Connect Selected Neuron Groups with Synapse Groups**: Connect using synapse groups
- **Set Group as Source**: Mark this group as source for connection operations
- **Clear Source Neuron Groups**: Clear source selection

### Training and Testing
- **Create Supervised Model**: Set up supervised learning using current activations as targets
- **Input Data**: Open dialog to configure input patterns
- **Add Current Pattern to Input Data**: Add current activations to the input data table

### Visualization and Analysis
- **Plot**: Create a plot of the group's activations over time
- **Add Coupled Image World**: Create an image world coupled to this group
- **Start/Stop Recording**: Record activation values to a CSV file

### Couplings
- **Send Vector Coupling To**: Send activations as a vector to other Simbrain components
- **Receive Vector Coupling from**: Receive vectors from other components to set activations

See the [couplings](../../workspace/couplings) page for more information on connecting neuron groups to other Simbrain components.




