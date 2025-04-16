---
title: Raster Plot
layout: default
parent: Plots
has_children: false
nav_order: 110
---

# Raster

A [raster plot](https://en.wikipedia.org/wiki/Raster_plot) is a graphical representation of spiking activity across a group of neurons over time. Each dot in the plot represents a spike by a neuron at a specific moment.
- The **x-axis** shows time steps.
- The **y-axis** shows neuron indices (often interpreted as "neuron number").
- A **dot at position (t, i)** means neuron *i* fired (spiked) at time *t*, or (for non-spiking neurons) the that neuron was active above a threshold.

:::info
The vertical axis might feel counterintuitive, since it's not a continuous variable—just a list of neuron indices. Think of each row as representing a single neuron.
:::

When you see vertical alignments of dots, it means multiple neurons spiked at the same time—often a sign of synchrony or oscillations. Horizontal bands or rhythmic patterns may indicate periodic activity.

For an introduction to raster plots and how to interpret them, see:[Understanding Raster Plots in Neuroscience](https://neuronaldynamics.epfl.ch/online/Ch1.S4.html).

## Continuous vs. Spiking Neurons

Although raster plots are typically used with spiking neurons, Simbrain allows you to plot neuron activations too. In this case, spikes are inferred: if an activation value exceeds a spike threshold (default 0.5), a spike is shown.

When there is a vertical cluster that means many neurons spiked at the same time, suggesting oscillations. Bands give a sense of frequency of oscillation


<!-- TODO: A more illustrative example -->

<img src="../../assets/images/rasterPlot.png" style="width:500px;"/>


## Continuous vs. Spiking Neurons

Although raster plots are typically used with spiking neurons, Simbrain allows you to plot **continuous neuron activations** too. In this case, spikes are inferred: if an activation value exceeds a **spike threshold** (default 0.5), a spike is shown.

Be sure to link **spike indices** to the plot rather than raw activations unless you're visualizing thresholded continuous neurons.

## Suggested Demo Idea
To illustrate raster plots effectively, consider a network with a group of spiking **Integrate-and-Fire** neurons driven by a common oscillatory input. You'll observe bursts of synchronized firing. You could compare this with a network using **Izhikevich neurons**, where you might see bursting or chaotic patterns depending on the parameters.

## Using the Component

### File Menu
- **Import from XML**: Load a previously saved raster plot.
- **Export to XML**: Save the current raster plot.
- **Rename**: Rename the raster plot window.
- **Close**: Close the plot window.

### Component Panel
- **Add**: Add a raster plot series to the plot (multiple raster plots, shown in different colors, can be superimposed)
- **Remove**: Removes a raster plot series from the plot.
- **Clear Graph Data**: Clears all data.
- **Show Graph Properties** (gear icon): Customize:
  - Dot Size: how big the dots are
  - Window Size: todo
  - Spike Threshold: threshold to use with non-spiking neurons

### Right-Click Menu
- Context menu from **JFreeChart** to interact with the chart view.
