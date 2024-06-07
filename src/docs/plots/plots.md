---
title: Plots
layout: default
has_children: true
nav_order: 65
---

# Plots

## General/intro

In Simbrain, dynamic neural activity can be visualized and recorded using plots. Plots are composed of one or more visual representations (such as bars, dots, and lines) of sets of values taken directly from coupled neurons. These visual representations can be valuable in statistical analyses and for viewing dynamic patterns in neural activations over time. 

## Coupling Neurons to Plots

To couple a neuron group to a plot, click on “Couplings,” open “Coupling Manager” and set the network as Producers and the plot as Consumers. In the Producers window, select Group_n:getActivations (where n is any given number) and select setBarValues for the plot in the Consumers window. 

Once coupled, any activations in the group should be seen in the plot.

The only exception to this method are time series plots in scalar mode. To couple a scalar time series plot, each neuron should be coupled to each series. This is because whole groups cannot be coupled as a scalar quantity, when coupling a group in a time series plot, use array mode instead.

There are six plot types available in Simbrain.

# Plots (Old)

One of the main methods for studying the activity of the network component in Simbrain is by using a plot component. However, the plot components are general and can be used to show the values of any attribute in simbrain.

To get a quick sense of what most of the charts do, run the chartExamples.zip simulation.

To add a plot component to the workspace either press on the plot button plot button  in the desktop toolbar, which opens up a drop down menu with different plot components, or use the menu Insert > New Plot >...

To use the plot you will have to couple some attributes of the component whose behavior you want to plot (often neural activations in a neural network) with the plot itself.   For information on how to do this see the documentation on couplings.

Most of the charts are based on the JFreeChart library.

# Plot Types

[Bar Chart](barChart.html)

When coupled to a neuron group, a bar chart represents each neural activation as a vertical bar. Each bar displays its coupled neuron’s label on its base (in the x-axis) and the amount of activation as a measure of its length (in the y-axis). By default, the y-axis ranges in value from 0 to 10. 

To manually change the upper and lower bounds, click on “Edit,” then select “Preferences” which will open up an edit menu where the upper and lower bounds can be increased or decreased.


[Histogram](histogram.html)

Lorem Ipsum

[Projection Plot](projectionPlot.html)

Lorem Ipsum

[Raster Plot](rasterPlot.html)

Lorem Ipsum

[Time Series](timeSeries.html)

Lorem Ipsum

