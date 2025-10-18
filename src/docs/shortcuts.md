---
title: Keyboard Shortcuts
layout: default
has_children: false
nav_order: 8
---

# Keyboard Shortcuts

This page provides a comprehensive reference to keyboard shortcuts in Simbrain, organized by component.

## Using Shortcuts

Component-specific shortcuts only work when that component is in focus. Click on the component window first. Many actions also appear in menus and toolbars where you can hover to see their shortcuts. In this documentation, `Cmd/Ctrl` means the Command key (⌘) on Mac and the Control key on Windows and Linux.

## Desktop and Workspace

These shortcuts work at the desktop level (when no component is focused) or affect the entire [workspace](workspace/):

- **Cmd/Ctrl-N:** Create a new [network](network/)
- **Cmd/Ctrl-O:** Open a workspace file
- **Cmd/Ctrl-S:** Save the current workspace
- **Cmd/Ctrl-K:** Clear desktop (remove all components)
- **Cmd/Ctrl-Q:** Quit Simbrain
- **Spacebar:** Iterate workspace once
- **F6:** Run workspace continuously
- **Escape:** Stop workspace

## All Components

These shortcuts work for any component when it has focus:

- **Cmd/Ctrl-O:** Open a file of the appropriate type for this component
- **Cmd/Ctrl-S:** Save the current component
- **Cmd/Ctrl-W:** Close the component

## Network Component

### Selection and Navigation

- **n:** Select all [neurons](network/neurons/)
- **w:** Select all [weights](network/synapses/)
- **a:** Select all objects (neurons and weights)
- **Cmd/Ctrl-A:** Select all objects (alternative)
- **Escape:** Clear selection and remove source neuron designations
- **s:** Selection mode (default mode)
- **i:** Wand mode (quickly inject activation for testing)
- **t:** Text mode (add text annotations)
- **f:** Fit camera to screen

### Creating Objects

- **p:** Add a single neuron where you last clicked
- **N:** Open dialog to add multiple neurons at once
- **Y:** Add [neuron array](network/arraysMatrices) dialog
- **g:** Create a new [neuron group](network/neurongroups/) from scratch
- **Cmd/Ctrl-G:** Add selected neurons to a neuron collection

### Editing and Modifying

- **Cmd/Ctrl-E:** Edit properties of selected objects
- **Cmd/Ctrl-C:** Copy selected items
- **Cmd/Ctrl-V:** Paste copied items
- **Cmd/Ctrl-X:** Cut selected items
- **Cmd/Ctrl-D:** Duplicate selected items
- **Delete/Backspace:** Delete selected items

### Connecting Neurons

- **1:** Set selected neurons as source neurons (red halos)
- **2:** Connect source neurons to selected target neurons (all-to-all)
- **Shift-2:** Same as 2 but allows self-connections
- **3:** Open custom [connection](network/connections/) dialog
- **6:** Select incoming weights of selected neurons
- **7:** Select outgoing weights of selected neurons

### Modifying Values

- **r:** [Randomize](utilities/randomizers) selected objects
- **Cmd/Ctrl-B:** Randomize biases of selected neurons
- **c:** Clear selected neuron activations (set to 0)
- **k:** Clear all neuron activations (selects them first, then clears)
- **Shift-C:** Clear selected neurons and weights (sets weights to 0, use with caution)
- **Shift-F:** Toggle [clamping](network/neurons/#clamping) on selected neurons
- **Up/Right arrows:** Increment selected neuron activations
- **Down/Left arrows:** Decrement selected neuron activations
- **Shift + Arrows:** Nudge selected objects (move them a few pixels)

### Running and Testing

- **Spacebar:** Iterate the network once (single step)
- **5:** Toggle weight visibility (improves performance when off)

### Layout and View

- **Cmd/Ctrl-L:** Apply [layout](network/ui/layouts) to selected neuron collection
- **Cmd/Ctrl-0:** Reset zoom to 100%
- **Cmd/Ctrl-+** or **Cmd/Ctrl-=:** Zoom in
- **Cmd/Ctrl--** or **Cmd/Ctrl-_:** Zoom out

### Advanced

- **Cmd/Ctrl-R:** [Weight randomization](network/synapses/synapseAdjustment) dialog (with synapses selected)
- **Cmd/Ctrl-T:** Toggle visibility of selected [synapse groups](network/synapsegroups)
- **Cmd/Ctrl-M:** Create [supervised model](network/learning/supervisedModels) from selected layers
- **Cmd/Ctrl-,:** [Network preferences](network/ui/networkPreferences)
- **Cmd/Ctrl-Z:** [Undo](network/buildingBasics#undoredo-capabilities) last structural change
- **Cmd/Ctrl-Y** or **Cmd/Ctrl-Shift-Z:** [Redo](network/buildingBasics#undoredo-capabilities) last undone action
- **S:** Select neurons inside selected neuron groups
- **Alt-R:** Toggle vertical/horizontal layout for neuron arrays
- **Alt-D:** Print debug info to console (terminal only)
- **Shift-I:** Diagonalize selected weight matrices

## Odor World

See [Odor World](worlds/odorworld) for more details.

- **Cmd/Ctrl-A:** Select all entities
- **Cmd/Ctrl-P:** Add agent (mouse by default)
- **p:** Add entity (cheese by default)
- **Delete/Backspace:** Delete selected entities
- **Cmd/Ctrl-E:** Edit selected entity
- **t:** Toggle all trails on/off
- **Cmd/Ctrl-,:** World preferences
- **Cmd/Ctrl-0:** Reset zoom to 100%
- **Cmd/Ctrl-+** or **Cmd/Ctrl-=:** Zoom in
- **Cmd/Ctrl--** or **Cmd/Ctrl-_:** Zoom out

## Image World

See [Image World](worlds/imageworld) for more details.

- **A:** Previous image in album
- **D:** Next image in album
- **S:** Take snapshot (add current image to album)

## Text World

See [Text World](worlds/textworld) for more details.

- **Cmd/Ctrl-F:** Find and replace

