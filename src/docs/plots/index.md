---
title: Plots
layout: default
has_children: true
nav_order: 65
---

# Plots

## Overview

In Simbrain, dynamic neural activity can be visualized and recorded using plots. Plots are composed of one or more visual representations (such as bars, dots, and lines) of sets of values taken directly from coupled neurons. These visual representations can be valuable in statistical analyses and for viewing dynamic patterns in neural activations over time. 

Warning: As seen in the [Workspace Updating](../workspace/workspaceUpdate) page, buffered updates first write to a buffer, then read from it. This means that the update order does not matter. Unfortunately, this also means that the plot will always display one time-step behind. An easy work-around for this is to go to `Workspace > Edit Update Sequence`, and set a custom update order where (1) the network is updated, (2) the coupling is updated, and (3) the plot is updated. Finally, you must remove the default buffered update action. 

## Adding Plots

To add a plot component to the workspace either press on the plot button in the desktop toolbar, which opens up a drop down menu with different plot components, or use the menu `Insert > New Plot >...`

## Coupling to Plots

Plots must be [coupled](../workspace/couplings) to other workspace components to do anything interesting. They receive data primarily from neural networks and display updated data at each workspace update.

This can be done the standard ways described in the [couplings](../workspace/couplings) doc, but for plots there are also custom actions on many network components to instantly create a coupled plot. This is by far the easiest and most convenient way to do it.

Some plots take vector couplings, some scalar, some both.

Most of the charts are based on the JFreeChart library.

# Plot Couplings

Since they receive data, charts contain consumer attributes. Typically there are scalar consumers which receive data for one bar, "slice" of pie, dimension of an input vector a projection pot, etc. at a time, and vector consumers which receive a complete vector data at each time step.

<!-- TODO --> Add image

The basic ways to couple to plots is similar across cases. 

# Common Menus

## File

- **Import from XML**: Load a previously saved plot from a stored `.xml` file.
- **Export to XML**: Save the current plot to a `.xml` file.
- **Rename**: Rename the current plot window.
- **Close**: Close the current plot window.


## JFreeChart Right-Click Menu

These are commands that are available by right-clicking in most Simbrain charts (except Pixel Plot). They are based on built-in functions associated with **JFreeChart**.

- **Copy**: Copy the plot.
- **Save As**: Save the current plot as a `.png` file.
- **Print**: Print the current plot.
- **Zoom In / Zoom Out**: Zoom in or out on just the domain or range axis, or both axes.
- **Auto Range**: Automatically re-adjust the range of the domain or range axis, or both axes.
- **Properties**: Open the JFreeChart properties dialog.

### Title Tab

- **Show Title**: Set the title visibility.
- **Text**: The title text of the chart.
- **Font**: Configure font style, size, and attributes (bold, italic) of the title.
- **Color**: Set the color of the title.

### Domain and Range Axis

- **Label**: Set the title of the X (domain) and Y (range) axis.
- **Font**: Configure font style, size, and attributes (bold, italic) of the axes.
- **Paint**: Set the color of the axes.

### Ticks

- **Show Tick Labels**: When checked, the incremental values are visible on the chart.
- **Tick Label Font**: Configure the font style, size, and attributes (bold, italic) of the tick labels.
- **Show Tick Marks**: When checked, the tick marks are visible on the plot.

### Range

- **Auto-Adjust Range**: When checked, the range of the plot is automatically adjusted to fit the data points.
- **Minimum Range Value**: Set the minimum range value of the plot.
- **Maximum Range Value**: Set the maximum range value of the plot.

### Appearance

- **Outline Stroke**: Configure the border line style.
- **Outline Paint**: Set the color of the outline stroke.
- **Background Paint**: Configure the background color.
- **Orientation**: Adjust the plot's orientation as either vertical (range is shown on the vertical axis and domain is shown horizontally on the plot), or horizontal (range is shown horizontally on the plot and domain is on the vertical axis).

### Other Tab

- **Draw Anti-Aliased**: When checked, the lines of the plot are more defined for better visibility.
- **Background Paint**: Adjust the color of the window's background.
