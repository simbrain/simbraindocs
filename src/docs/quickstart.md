---
title: Quick Start
layout: default
has_children: false
nav_order: 7
---

# Quick Start

The fastest way to see Simbrain in action is to run pre-built [simulations](simulations/) from the `Simulations` menu. Open one and press play in the workspace toolbar to watch it run. This guide covers basic workflows for building and running networks. For more details on building networks, see [Building Basics](network/buildingBasics). For a comprehensive list of keyboard shortcuts across all components, see the [Keyboard Shortcuts](shortcuts) reference page.

## Info Panels and Onboarding

When you first launch Simbrain, you may see onboarding windows that introduce basic features. These are self-explanatory and can be dismissed. If you want to see them again, use `File > Reset onboarding windows` (this resets all of them, but there arent many).

Many simulations include **sidebar info panels** that explain what the simulation demonstrates and how to interact with it. These panels appear on the side of the workspace and contain helpful documentation specific to each simulation. You can:
- Toggle the info panel visibility using `View > Show/hide info panel` or the info panel button in the toolbar
- Control whether info panels appear by default in `File > Workspace preferences > Show info dock by default`

You can keep these sidebar panels visible when exploring simulations; they provide useful context and instructions for understanding what you're seeing.

## Working with Networks

Most of these operations require a [network](network/) window to be in focus (click on it first).

### Creating and selecting objects

- Press **P** to add [neurons](network/neurons/) one at a time. They appear where you last clicked.
- Press **N** (capital) and enter a number to add multiple neurons at once via dialog.
- Press **n** (lowercase) to select all neurons. Selected objects show green halos.
- Press **w** to select all [weights](network/synapses/) (synapses).
- Press **a** to select all objects (neurons and weights).
- Use the mouse to lasso around objects to select them.

### Modifying objects

- Press **r** to [randomize](utilities/randomizers) selected objects. Try this several times to see different random values.
- Press **up/down arrows** to increment or decrement activation values of selected neurons.
- Press **c** to clear selected neuron activations (set to zero). For weights, use **Shift-C**.
- Press **Shift-F** to toggle [clamping](network/neurons/#clamping) on selected neurons. Clamped neurons don't update.
- **Cmd/Ctrl-C** to copy, **Cmd/Ctrl-V** to paste, **Cmd/Ctrl-D** to duplicate.
- **Delete** or **Backspace** to delete selected objects.

### Connecting neurons: the "1-2 and 1-3 tricks"

This is one of the most useful techniques in Simbrain for quickly building networks. See [Building Basics](network/buildingBasics#quick-connect-1-2-and-1-3-tricks) for details. The basic workflow:

1. Select one or more source neurons
2. Press **1** to designate them as sources (red halos appear)
3. Select one or more target neurons
4. Press **2** to connect all sources to all targets
5. Press **Escape** to clear source designations when done

**Quick recurrent network:** To create a fully connected recurrent network, press **n** to select all neurons, then **1**, then **2**. This connects all neurons to all others (including themselves). Try it with 9 neurons: press **N** to create them, then **n → 1 → 2**, then **w → r** to randomize weights and **n → r** to randomize activations. Press **spacebar** repeatedly to see the dynamics.

### Running networks

- Press **spacebar** to iterate the network once (single step).
- Use the play button to run continuously. Press stop or **Escape** to halt.
- Press **k** to clear all neuron activations. This is useful combined with randomization: `k → r`

For more on how network updates work, see [Update Logic](network/updateLogic) and [Workspace Update](workspace/workspaceUpdate).

## Useful Network Examples

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
3. Open the [coupling manager](workspace/couplings) with `Couplings > Open Coupling Manager`
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

## Useful Key Sequences

These combinations are especially powerful for quickly building and testing networks:

- **n → c:** Clear all neurons (set them to 0)
- **n → r:** Randomize all neurons
- **w → r:** Randomize all weights
- **a → r:** Randomize everything (neurons and weights)
- **k → r:** Clear then randomize neurons (quick reset)
- **n → 1 → 2:** Quick recurrent network (select all neurons, mark as sources, connect all-to-all)