---
title: Bar Chart
layout: default
parent: Plots
has_children: false
nav_order: 75
---

# Bar Chart

A standard bar chart that can be used to represent changing set of quantities, using a [vector coupling](/docs/workspace/couplings.html#vector-couplings). For example, it is often useful to represent the activations of a group of neurons using bar chart and to watch how they change in time as the simulation runs, to get a sense of the relative activation of each neuron. 

<img src="../../assets/images/barChart.png" style="width:300px;"/>

In this example, notice the first two nodes are negative and last three are positive, which is reflected in the chart.

# Preferences

- **Lower Bound**: Sets the minimum value of the y-axis.
- **Upper Bound**: Sets the maximum value of the y-axis.
- **Auto Range**: When checked it automatically scales the y-axis so that the largest bar fits inside the window. It can be useful to turn this off to get a better sense overall changes in magnitude since while it is on they will fill up the window.
- **Bar Color**: Allows the color of the bar to be changed.

# Menus

## File 
- **Import from XML**: Load a previously saved raster plot.
- **Export to XML**: Save the current raster plot.
- **Rename**: Rename the raster plot window.
- **Close**: Close the plot window.

## Edit
- **Properties**: See [preferences](#preferences)

## Right-Click Menu

- The context menu is a **[JFreeChart menu](./#jfreechart-right-click-menu)**.