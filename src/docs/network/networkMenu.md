---
title: Network Menus and Toolbars
layout: default
parent: Networks
has_children: false
nav_order: 40
---

# Menus

This page contains actions that are available from the network menu. Many of these are associated with **keyboard shortcuts**. Many of them are also available from various right-click or popup menus, and from **toolbars**. As often as possible, they are conditionally enabled, that is, only enabled if the right conditions obtain in the network window (e.g. neurons are selected for operations on neurons).

## File

- **Open**: Open a network file.
- **Import from xml**: Open a network file from an xml file.
- **Export to xml**: Save a network file as an xml file.
- **Edit Update Sequence**: Opens the dialog for editing the **network update sequence**.
- **Network Preferences**: Open **Network Preferences**.

## Edit

- **Cut**: Cut selected network elements (nodes, weights, text items, some groups) to buffer.
- **Copy**: Copy selected network elements to buffer.
- **Paste**: Paste network elements in buffer to screen.
- **Delete**: Deletes selected screen items.
- **Clear Source Neurons**: Deselect neurons that are set as **source neurons**.
- **Set Source Neurons**: Set the selected neurons as source neurons.
- **Connect Neurons**: Link neurons together as a connection.
- **Connect Neurons Group with Synapse Group**: Connect source and target neurons with a synapse group.
- **Randomize Selection**: Assign random values to neurons.
- **Show Synapse Adjustment Dialog**: Show the **synapse adjustment dialog** for free neurons.
- **Layout**: Align neurons to a specific layout. See **Neuron Layouts** for list of layout options.
- **Convert neurons to Neuron Group**: Convert selected **free neurons** to a **neuron group**.
- **Align**: Aligns neurons horizontally or vertically.
- **Space**: The distance between two neurons.
- **Edit Selected Neuron(s)**: Configure neuron(s) properties.
- **Edit Selected Synapse(s)**: Configure synapse(s) properties.
- **Select**: Pick out an element.
- **Select all**: Select all screen elements (see selection).
- **Set selected neurons / weights**: Open properties window for selected neurons or weights.
- **Clamp Neurons/Weights**: Fixate neurons/weights value. See **clamping**.
- **Set properties**: Different depending on whether you are clicked on a node or weight. If multiple nodes or weights are selected, it sets properties of that set. For more see **neuron properties**.

## Insert

- **Add Neuron**: Add a new neuron to the network.
- **Add Neurons**: Add a collection of neurons to the network. The update rule of the neurons and their **layout** can be specified.
- **Insert Neuron Group**: Insert a set of neurons within one group.
- **Insert Network**: Add a **subnetwork** to the network.
- **Create Input Table**: Create a **test inputs** table whose rows provide input to selected neuron(s).
- **Display/Edit Weight Matrix**: Display a weight matrix viewer for the synapses between designated source and target neurons, showing connections in a tabular format where rows represent source neurons and columns represent target neurons.

## View

User can set whether or not to show network toolbars.

- **Toolbars**: User can set which toolbars to show in network interface. See **toolbars**.
- **Autozoom**: Checking the "autozoom" box causes the network display to automatically resize the current neural network so it fits within the screen. Un-checking autozoom thus allows users to zoom in on data and pan it arbitrarily.
- **Show Neuron Priorities**: Toggles whether neuron priorities (for use in priority **update**) are visible.
- **Free Weights Visible**: Toggle whether free weights are visible in the GUI.

## Scripts

To create customized simulations or behaviors not possible using the Simbrain GUI, you can customize scripts. See **Scripting** for more details.

- **Save Network to MATLAB File**: When you call this script, the activations of any **neuron groups** in the network and the weights in any **synapse groups** in the network will be converted to binary matlab MAT-files. Uses the **jmat.io library**.

## Popup Menu (Empty Canvas)

If you right-click (or left-click while holding down the ctrl key) anywhere on the network panel, a pop-up menu will appear, whose contents vary depending on where you click and whether there is anything in the clipboard.

- **Add Neuron**: Create a new neuron at clicked location.
- **Add Neurons**: Create neurons.
- **Insert Neuron Group**: Create a group of neurons.
- **Insert Network**: Creates a new network of a specified type, at clicked location.
- **Cut, copy, paste**: Act as in a normal application. Paste only appears if there are items in the buffer to paste; cut and copy only appear if there are selected items to cut or copy. Items are pasted to clicked location.
- **Clear Source Neurons**: Deselect **source neurons**.
- **Set Source Neurons**: Set the selected neurons as source neurons.
- **Network Preferences**: Opens network dialog.
- **Scripts**: Open and apply a network .bsh script to the network.

# Toolbars

Toolbars can be turned off using the **network view** menu.

## Mode Toolbar

This toolbar allows you to set the edit mode for the network, visible as the cursor graphic.

- **Selection mode**: Select nodes and weights by lassoing or left-clicking. Hotkey: S.
- **Text mode**: In this mode, text can be added anywhere in the network panel. Text objects can be subsequently edited by double-clicking on them. Text can be formatted by right-clicking on a text object and selecting **Text Properties...**. Hotkey: T.
- **Wand mode**: Can be used to inject activation to nodes quickly for testing. Hotkey: I. See **wand tool**.
- **Auto-zoom**: Single click to change mode. When in auto-zoom mode, objects will automatically be fit to the page as they are created and moved. **Tip**: toggling twice when auto-zoom is off will force an auto-zoom while leaving auto-zoom off.

## Run Toolbar

This toolbar is for running the network, independently of the workspace. It is hidden by default (because it can be easily confused with workspace run/step) and must be turned on using the **view** menu.

- **Run network**: Repeatedly iterates the network. Note that the image on the button becomes that of a "stop" button. Pressing this button will stop the network. Thus, the play/stop button acts as a toggle switch.
- Step through one update cycle (Also keyboard space and S, depending on **interaction mode**).

## Edit Toolbar

This toolbar allows you to create and delete neurons, and change their state.

- Set all selected nodes (weights and/or nodes) to a random value (Also keyboard R). Randomization is a uniform distribution between the upper and lower bounds set for each neuron or weight.
- Set all selected neurons to 0. Weights are ignored. (Also keyboard C)
- Create a neuron at last position clicked on screen. (Also keyboard N)
- Delete currently selected neurons. (Also keyboard delete or backspace)
