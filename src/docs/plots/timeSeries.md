---
title: Time Series
layout: default
parent: Plots
has_children: false
nav_order: 115
---

# Time Series

A [time series plot](https://en.wikipedia.org/wiki/Time_series) allows you to track changes in a set of variables over time. Time is represented on the x-axis. Here time corresponds to simulation time in Simbrain. For example, the spike pattern of a [spiking neuron](../network/spikingneurons.md) can be viewed by attaching the spiking neuron to a time series plot, as in this example. 

<img src="../../assets/images/timeSeries.png" style="width:500px;"/> <br />

# Panel Buttons

- **Add**: Add a time series to the plot.
- **Remove**: Remove a time series from the plot.
- **Clear Graph Data**: Clear all data from the plot.
- **Show Graph Properties**: Open the properties menu for the plot.

# Preferences
- **Auto Range**: When selected, the y-axis is automatically scaled so that the series with the greatest magnitude fits inside the window. It can be useful to turn this off to get a better sense of overall changes in magnitude, since while it is on they will fill up the window.
- **Range Lower Bound**: Minimum value of the y-axis (when auto range is off).
- **Range Upper Bound**: Maximum value of the y-axis (when auto range is off).
- **Fixed Width**: When selected, maintains a fixed amount of time points displayed in the plot.
- **Window Size**: Width of the x-axis (number of time points to display when fixed width is enabled).

# Menus

## File

- **Open**: Load a previously saved time series.
- **Save**: Save the current time series.
- **Save As**: Save the current time series with a new name.
- **Close**: Close the time series window.

## Edit

- **Preferences**: See [preferences](#preferences).

## Help

- **Help**: Link to Simbrain Documentation

## Right-Click Menu

- The context menu is a [JFreeChart menu](./#jfreechart-right-click-menu).