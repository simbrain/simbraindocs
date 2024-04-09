---
title: Plots
layout: default
has_children: true
nav_order: 10
---

# Plots

## General/intro

In Simbrain, dynamic neural activity can be visualized and recorded using plots. Plots are composed of one or more visual representations (such as bars, dots, and lines) of sets of values taken directly from coupled neurons. These visual representations can be valuable in statistical analyses and for viewing dynamic patterns in neural activations over time. 

## Coupling Neurons to Plots

To couple a neuron group to a plot, click on “Couplings,” open “Coupling Manager” and set the network as Producers and the plot as Consumers. In the Producers window, select Group_n:getActivations (where n is any given number) and select setBarValues for the plot in the Consumers window. 

Once coupled, any activations in the group should be seen in the plot.

The only exception to this method are time series plots in scalar mode. To couple a scalar time series plot, each neuron should be coupled to each series. This is because whole groups cannot be coupled as a scalar quantity, when coupling a group in a time series plot, use array mode instead.

There are six plot types available in Simbrain.

Plot Types

Bar Chart
When coupled to a neuron group, a bar chart represents each neural activation as a vertical bar. Each bar displays its coupled neuron’s label on its base (in the x-axis) and the amount of activation as a measure of its length (in the y-axis). By default, the y-axis ranges in value from 0 to 10. 

To manually change the upper and lower bounds, click on “Edit,” then select “Preferences” which will open up an edit menu where the upper and lower bounds can be increased or decreased.



Histogram
Pie Chart
Projection Plot
Raster Plot
Time Series
