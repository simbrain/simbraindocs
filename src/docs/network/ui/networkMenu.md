---
title: Network Menus and Toolbars
layout: default
parent: UI and Tools
grand_parent: Networks
has_children: false
nav_order: 10
---

# Network Menus and Toolbars

This page describes the menu items, keyboard shortcuts, and toolbar actions available in the network component. Many actions are conditionally enabled based on the current selection and network state.

## File Menu

- **Import**: Import a network file
- **Export**: Export the network to a file
- **Rename**: Rename this network component
- **Edit Update Sequence**: Opens the dialog for editing the network update sequence
- **Network Preferences**: Open network preferences (Cmd/Ctrl-,)
- **Close**: Close this network window

## Edit Menu

- **Undo**: Undo last [structural change](../buildingBasics#undoredo-capabilities) (Cmd/Ctrl-Z)
- **Redo**: Redo last undone action (Cmd/Ctrl-Shift-Z)
- **Undo History**: Show undo history dialog with all undo and redo operations, allowing you to jump to any previous state
- **Cut**: Cut selected network elements (Cmd/Ctrl-X)
- **Copy**: Copy selected network elements (Cmd/Ctrl-C)
- **Paste**: Paste network elements from buffer (Cmd/Ctrl-V)
- **Duplicate**: Duplicate selected elements (Cmd/Ctrl-D)
- **Delete**: Delete selected elements (Backspace or Delete)
- **Clear Source Neurons**: Deselect neurons that are set as source neurons
- **Set Source Neurons**: Set the selected neurons as source neurons (1)
- **Connect Neurons**: Submenu with various connection options (2 to connect, 3 for custom connection dialog, Shift-2 to allow self-connections)
- **Randomize Selection**: Assign random values to selected elements  
- **Show Synapse Adjustment Panel**: Show the synapse adjustment dialog for free synapses (Cmd/Ctrl-R)
- **Connect with Weight Matrix**: Connect selected source and target neurons with a weight matrix
- **Connect with Synapse Group**: Connect selected source and target neurons with a synapse group
- **Layout**: Apply a layout to selected neurons (see [layouts](layouts))
- **Create Supervised Model**: Create a supervised learning model from selected network elements
- **Add neurons to collection**: Add selected neurons to a neuron collection (G)
- **Align**: Submenu with horizontal and vertical alignment options
- **Space**: Submenu for horizontal and vertical spacing options
- **Edit Selected Models**: Edit properties of selected models (Cmd/Ctrl-E)
- **Select**: Submenu with various selection options
  - Select all (A or Cmd/Ctrl-A)
  - Select all neurons (N)
  - Select all weights (W)
  - Select incoming weights (6)
  - Select outgoing weights (7)

## Insert Menu

- **Add Neuron**: Add a single neuron to the network (P)
- **Add Neurons**: Add multiple neurons with configurable layout and update rule (N)
- **Add Neuron Group**: Add a neuron group to the network (G)
- **Add Neuron Array**: Add a neuron array to the network (Y)
- **Add Classifier**: Add a classifier network
- **Add Subnetwork**: Submenu with various subnetwork types including:
  - Backprop network
  - Competitive network
  - Feed-forward network
  - Hopfield network
  - Self-organizing map (SOM)
  - Simple recurrent network (SRN)
  - Restricted Boltzmann machine (RBM)
- **Add Text**: Add a text annotation to the network (T)

## Actions Menu

The Actions menu contains special utility operations for networks:

- **Create Layered Free Neurons**: Create layers of free neurons with specified parameters
- **Decay Weights**: Decay all weight values in the network
- **Export Simbrain Web Format**: Export the network to web format
- **Fast 100**: Quickly create 100 neurons for testing
- **Fast Grid**: Quickly create a grid of neurons
- **Fast Sparse**: Create sparse connections between neurons
- **Prune Weights**: Remove weights below a threshold
- **Randomize Polarity**: Randomize the polarity of selected neurons

## View Menu

- **Toolbars**: Submenu to toggle toolbar visibility
  - Main Toolbar
  - Edit Toolbar
- **Free Weights Visible**: Toggle visibility of free weights (synapses not in synapse groups) (5)
- **<span id="only-show-synapses-when-spiking">Only show synapses when spiking</span>**: When enabled, synapses are hidden by default and only appear when their source neuron fires. Synapses briefly appear with a highlight color when spiking, making it easy to see which connections are actively transmitting signals. This is useful for visualizing large spiking networks where showing all connections would clutter the display. This feature is enabled by default in the spiking network simulation (`Simulations > Neuroscience > Spiking Network`).
- **Show Weight Matrix**: Display the weight matrix viewer
- **Show Priority Table**: Display the priority table showing neuron update order

## Help Menu

- **Network Help**: Open network documentation at https://docs.simbrain.net/docs/network/

## Context Menus

The network panel provides context-sensitive menus that appear when right-clicking on different elements.

### Empty Canvas Context Menu

When right-clicking on an empty area of the network panel:

- **Add Neuron**: Create a new neuron at clicked location (P)
- **Add Neurons**: Create multiple neurons (N)
- **Add Neuron Group**: Create a neuron group (G)
- **Add Neuron Array**: Create a neuron array (Y)
- **Add Classifier**: Create a classifier network
- **Add Subnetwork**: Submenu with various subnetwork types
- **Add Text**: Add a text annotation (T)
- **Cut, Copy, Paste, Duplicate**: Standard clipboard operations (only appear when applicable)
- **Clear Source Neurons**: Deselect source neurons
- **Set Source Neurons**: Set selected neurons as source neurons
- **Network Preferences**: Opens network preferences dialog

### Neuron Context Menu

When right-clicking on selected neurons:

- Standard editing operations (Cut, Copy, Paste, Duplicate, Delete)
- **Clear Source Neurons** / **Set Source Neurons**: Manage source neurons for connections
- **Connect Neurons**: Submenu with connection options
- **Layout**: Apply a layout to selected neurons
- **Align** and **Space**: Alignment and spacing options (when multiple neurons are selected)
- **Neuron Properties**: Edit properties of selected neurons (Cmd/Ctrl-E)
- **Select**: Submenu to select incoming or outgoing weights
- **Create input table**: Create an [input table](testInputs) for selected neurons
- **Show Weight Matrix**: Display weight matrix viewer

### Synapse Context Menu

When right-clicking on selected synapses:

- Standard editing operations (Cut, Copy, Paste, Duplicate, Delete)
- **Synapse Properties**: Edit properties of selected synapses (Cmd/Ctrl-E)

## Toolbars

Toolbars can be toggled on and off using the `View > Toolbars` menu.

### Main Toolbar

The Main Toolbar controls the edit mode and zoom level:

- **Selection Mode**: Select nodes and weights by clicking or lassoing (default mode)
- **Wand Mode**: Paint activation patterns on neurons and synapses for testing (D). Press repeatedly to cycle through wand actions. See [wand tool](../wand/)
- **Pan Mode**: Pan the view by clicking and dragging
- **Zoom In**: Zoom in on the network view
- **Zoom Out**: Zoom out from the network view
- **Auto-zoom**: Toggle auto-zoom mode. When enabled, the view automatically fits objects as they are created and moved

### Edit Toolbar

The Edit Toolbar provides quick access to common editing operations:

- **Undo**: Undo the last [structural change](../buildingBasics#undoredo-capabilities) (Cmd/Ctrl-Z)
- **Redo**: Redo the last undone action (Cmd/Ctrl-Shift-Z)
- **Add Neuron**: Create a neuron at the last clicked position (P)
- **Delete**: Delete currently selected items (Backspace or Delete)
- **Clear**: Set all selected object activations to 0 (C). Works on neurons, neuron groups, and subnetworks. For weights, use Shift-C
- **Randomize**: Randomize selected objects (R). Works on neurons, weights, neuron groups, and subnetworks. Some subnetworks (like Hopfield, Restricted Boltzmann Machine) use their own built-in randomizers; others use the default randomizers from [network preferences](networkPreferences#randomizers)

## Additional Keyboard Shortcuts

Beyond the shortcuts listed above, the following keyboard shortcuts are available:

- **Arrow Keys (Up/Down/Right/Left)**: Increment or decrement selected neuron activations
- **Shift + Arrow Keys**: Nudge selected objects in the arrow direction
- **Escape**: Clear all selections and clear source neurons
- **Shift-F**: Toggle clamping on selected neurons
- **Alt-R**: Toggle vertical/horizontal layout for selected neuron arrays

For a complete reference of all network shortcuts and shortcuts for other components, see the [Keyboard Shortcuts](../../shortcuts) page.

