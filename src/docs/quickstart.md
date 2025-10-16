---
title: Quick Start and Shortcuts
layout: default
has_children: false
nav_order: 7
---

# Quick Start and Shortcuts

This guide will help you quickly start exploring Simbrain. The first sections cover basic workflows for building and running simulations, while the later sections provide comprehensive keyboard shortcut references.

## Getting Started

### Try existing simulations

The fastest way to see Simbrain in action is to run pre-built [simulations](simulations/) from the `Simulations` menu. Each simulation demonstrates different concepts and techniques. Open one and press play in the workspace toolbar to watch it run.

### Clear everything

To start fresh, use [`File > Clear Desktop`](workspace/menus) (Cmd/Ctrl-K) to remove all components from the workspace.

## Working with Networks

Most of these operations require a [network](network/) window to be in focus (click on it first). For more details on building networks, see [Building Basics](network/buildingBasics).

### Creating and selecting objects

- Press **P** to add neurons one at a time. They appear where you last clicked.
- Press **N** (capital) and enter a number to add multiple neurons at once via dialog.
- Press **n** (lowercase) to select all neurons. Selected objects show green halos.
- Press **w** to select all weights (synapses).
- Press **a** to select all objects (neurons and weights).
- Use the mouse to lasso around objects to select them.

### Modifying objects

- Press **r** to randomize selected objects. Try this several times to see different random values.
- Press **up/down arrows** to increment or decrement activation values of selected neurons.
- Press **c** to clear selected neuron activations (set to zero). For weights, use **Shift-C**.
- Press **Shift-F** to toggle clamping on selected neurons. Clamped neurons don't update.
- **Cmd/Ctrl-C** to copy, **Cmd/Ctrl-V** to paste, **Cmd/Ctrl-D** to duplicate.
- **Delete** or **Backspace** to delete selected objects.

### Connecting neurons: the "1-2 trick"

This is one of the most useful techniques in Simbrain for quickly building networks. For more connection options, see [Connections](network/connections/).

1. Select one or more source neurons
2. Press **1** to designate them as sources (red halos appear)
3. Select one or more target neurons
4. Press **2** to connect all sources to all targets
5. Press **Escape** to clear source designations when done

The sequence becomes: `select sources → 1 → select targets → 2 → repeat as needed → Escape`

### Running networks

- Press **spacebar** to iterate the network once (single step).
- Use the play button to run continuously. Press stop or **Escape** to halt.
- Press **k** to clear all neuron activations. This is useful combined with randomization: `k → r`

For more on how network updates work, see [Update Logic](network/updateLogic) and [Workspace Update](workspace/workspaceUpdate).

## Useful Network Examples

### Creating a recurrent network

Recurrent networks contain loops where activation can flow back to nodes it already visited, creating interesting dynamics.

1. Press **N** and create 9 neurons
2. Select all with **n**
3. Press **1** then **2** to connect all neurons to all others (including themselves)
4. Press **w** then **r** to randomize all weights
5. Press **n** then **r** to randomize all neurons
6. Press **spacebar** repeatedly to see the network dynamics

### Editing neuron properties

1. Select some neurons
2. Press **Cmd/Ctrl-E** or double-click to open the property dialog
3. Try changing properties like the clamped setting or [activation function](network/neurons/)
4. Click OK and iterate to see the effects

### Editing weight properties

1. Press **w** to select all weights
2. Press **Cmd/Ctrl-E** to open the weight properties dialog
3. Try changing the [learning rule](network/synapses/) to Hebbian
4. Press **a** then **r** to randomize everything
5. Press play and periodically press **a** then **r**. Watch the weights change size as they learn.

## Connecting Components with Couplings

[Couplings](workspace/couplings) allow you to connect different components together, such as linking network activations to plot visualizations.

### Plotting neuron activation over time

1. Create a network and add some neurons
2. Create a [time series plot](plots/timeSeries) from `Insert > New Plot > Time Series`
3. Right-click on a neuron and select `Send coupling to > TimeSeriesPlot1 > Series0`
4. Run the network and watch the plot track the neuron's activation

For better visualization, you can turn off auto-range in the time series preferences and manually set bounds.

### Visualizing network state in a bar chart

1. Create a network with several neurons
2. Create a [bar chart](plots/barChart) from `Insert > New Plot > Bar Chart`
3. Open `Couplings > Open Coupling Manager`
4. On the left, select your network and highlight the neurons
5. On the right, select your bar chart and highlight the bars
6. Click "Add Couplings"
7. Run the workspace and observe the bar chart update with neuron activations

### Using projection plots

[Projection plots](plots/projectionPlot) visualize high-dimensional network state in 2D or 3D. To set one up:

1. Create a projection plot from `Insert > New Plot > Projection`
2. Open the coupling manager
3. Select neurons on the left and dimensions on the right
4. Click "Add Couplings"

Each network update creates a point in the projection plot. If you couple more than 25 neurons, use the add dimension button in the projection plot first.

# Keyboard Shortcuts

## Desktop Level

- **Cmd/Ctrl-O:** Open a workspace file
- **Cmd/Ctrl-S:** Save the current workspace
- **Cmd/Ctrl-N:** Create a new network
- **Cmd/Ctrl-K:** Clear desktop (remove all components)
- **Cmd/Ctrl-Q:** Quit Simbrain

## All Components

- **Cmd/Ctrl-O:** Open a file of the appropriate type for this component
- **Cmd/Ctrl-S:** Save the current component
- **Cmd/Ctrl-W:** Close the component

## Network Component

The network window must be in focus for these shortcuts to work. Click on the network window first. For a complete list of menu items and actions, see [Network Menus and Toolbars](network/ui/networkMenu).

### Selection and Navigation

- **n:** Select all neurons
- **w:** Select all weights
- **a:** Select all objects (neurons and weights)
- **Escape:** Clear selection and remove source neuron designations
- **s:** Selection mode (default mode)
- **i:** Wand mode (quickly inject activation for testing)
- **t:** Text mode (add text annotations)
- **f:** Fit camera to screen

### Creating and Editing

- **p:** Add a single neuron where you last clicked
- **N:** Open dialog to add multiple neurons at once
- **g:** Create a new neuron group from scratch
- **Cmd/Ctrl-G:** Add selected neurons to a neuron group
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
- **3:** Open custom connection dialog

### Modifying Values

- **r:** Randomize selected objects
- **c:** Clear selected neuron activations (set to 0)
- **k:** Clear all neuron activations (leaves them selected)
- **Shift-C:** Clear selected neurons and weights (sets weights to 0, use with caution)
- **Shift-F:** Toggle clamping on selected neurons
- **Up/Down/Left/Right:** Increment or decrement selected neuron activations
- **Shift + Arrows:** Nudge selected objects (move them a few pixels)

### Running and Testing

- **Spacebar:** Iterate the network once (single step)
- **5:** Toggle weight visibility (improves performance when off)

### Advanced

- **6:** Select incoming weights of selected neurons
- **7:** Select outgoing weights of selected neurons
- **Alt-D:** Print debug info to console (terminal only)
- **Alt-R:** Toggle vertical/horizontal layout for neuron arrays
- **S:** Select neurons inside selected neuron groups

## Useful Key Sequences

These combinations are especially powerful for quickly building and testing networks:

- **n → c:** Clear all neurons (set them to 0)
- **n → r:** Randomize all neurons
- **w → r:** Randomize all weights
- **a → r:** Randomize everything (neurons and weights)
- **k → r:** Clear then randomize neurons (quick reset)
- **n → 1 → 2:** Create a fully connected recurrent network

### Connection Workflow

The typical workflow for connecting neurons:

1. Select source neurons
2. Press **1** (designate as sources)
3. Select target neurons
4. Press **2** (connect all sources to all targets)
5. Repeat steps 1-4 as needed
6. Press **Escape** when done to clear source designations

## Notes on Shortcuts

- **Command** means different keys on different systems:
  - Mac: The Command (⌘) key
  - Windows: The Ctrl key
  - Linux: The Ctrl key
- Component-specific shortcuts only work when that component is in focus (click on it first)
- The network shortcuts are especially useful for rapidly building and testing networks
- When in doubt, hover over toolbar buttons to see their keyboard shortcuts