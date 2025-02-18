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

[Bar Chart](./barChart.md)

When coupled to a neuron group, a bar chart represents each neural activation as a vertical bar. Each bar displays its coupled neuron’s label on its base (in the x-axis) and the amount of activation as a measure of its length (in the y-axis). By default, the y-axis ranges in value from 0 to 10. 

To manually change the upper and lower bounds, click on “Edit,” then select “Preferences” which will open up an edit menu where the upper and lower bounds can be increased or decreased.


[Histogram](./histogram.md)

Lorem Ipsum

[Projection Plot](./projectionPlot.md)

Lorem Ipsum

[Raster Plot](./rasterPlot.md)

Lorem Ipsum

[Time Series](./timeSeries.md)

Lorem Ipsum


# Plot Couplings

Plots must be **coupled** to other workspace components to do anything interesting. They receive data primarily from neural networks and display updated data at each workspace update.

Since they receive data, charts contain consumer attributes. Typically there are scalar consumers which receive data for one bar, "slice" of pie, dimension of an input vector a projection pot, etc. at a time, and vector consumers which receive a complete vector data at each time step.

<!-- TODO --> Add image

The basic ways to couple to plots is similar across cases. Documentation with images has been provided (so far) in two cases, to give a sense of how this works.

- **Bar charts**
- **Projections**

Generally you must first set up the chart to accept a certain number of "inputs" from scalar consumers, or to accept vectors of a certain size (number of components) from vector consumers.

<!-- TODO --> Add image




# JFreeChart Right Click Menu

These are commands that are available by right clicking in all Simbrain charts; they are based on built in functions associated with **JFreeChart**

- **Copy**: Copies the plot.
- **Save As**: Saves the current plot as a .png file.
- **Print**: Prints the current plot.
- **Zoom In / Zoom Out**: User can zoom in or out just the domain or range axis, or both axes.
- **Auto Range**: Automatically re-adjusts the range of domain or range axis, or both axes.
- **Properties**: Opens the JFreeChart properties dialog.

## Title Tab

- **Show** Title: Sets the title visibility.
- **Text**: Insert the title of chart here.
- **Font**: Configures font style, size and attributes (bold, italic) of the title.
- **Color**: Sets color of the title.

## Plot Tab

### Domain and Range Axis

- **Label**: Sets the title of X (domain) and Y (range) axis.
- **Font**: Configures font style, size and attributes (bold, italic) of the axes.
- **Paint**: Sets color of axes.

### Ticks

- **Show Tick Labels**: By checking this option, the incremental values are visible on the chart.
- **Tick Label Font**: Configures the font style, size and attributes (bold, italic) of the tick label.
- **Show Tick Marks**: By checking this option, the tick marks are visible on the plot.

### Range

- **Auto-Adjust Range**: By checking this option, the range of the plot is automatically adjusted to fit the data points.
- **Minimum Range Value**: Sets the minimum range value of the plot.
- **Maximum Range Value**: Sets the maximum range value of the plot.

### Appearance

- **Outline Stroke**: Configures the boderline style of choosing.
- **Outline Paint**: Sets the color of the outline stroke.
- **Background Paint**: Configures the backgroung color of choosing.
- **Orientation**: Adjusts the plot's orientation as either vertical (range is shown on the vertical axis and domain is shown horizontally on the plot), or horizontal (range is shown horizontally on the plot and domain is on the vertical axis).

### Other Tab

- **Draw Anti-Aliased**: By checking this option, the lines of the plot are more defined for better visibility.
- **Background Paint**: Adjusts the color of the window's background.