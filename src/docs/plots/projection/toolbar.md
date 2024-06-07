---
title: Preferences
layout: default
grand_parent: Plots
parent: Projection Plot
has_children: false
nav_order: 40
---

# Toolbar and Dialog Elements

- Status Bar	The status bar shows the current dimensionality of the high dimensional data, the current number of data points, and for the **Sammon** method, the current error.

- Projection Selector	This drop down box allows you to select which **projection method** to use on the data.

- Iterate Indefinitely	Pressing this button will cause the program to iterate the algorithm an indefinite number of steps until the Stop button, , is pressed. Only **Sammon maps** uses this and related buttons.

- Stop Iteration	Pressing this button will cause the program to stop iterating the algorithm.

- Iterate One Step	Pressing this button will cause the projection algorithm to iterate once.

- Erase data	This button clears both the high dimensional data set and low dimensional data set from the program.

- Randomize data	This button randomizes the points in the low dimensional set. Useful for bumping the Sammon map out of local minima, and for exploring different possible projections of a given dataset under the Sammon map.

- Warning Label	This symbol warns the user that the current method works best when more datapoints are already added.

- Step Size	This field scales the amount points are moved on each iteration. Note this item is only displayed if the **Sammon map** is selected.

- First and Second Dimension	This field controls which dimensions of the high-dimensional data are projected to the horizontal and vertical axes of the display. Note this item is only displayed if Coordinate Projection is selected. For more info see the discussion at **coordinate preferences**.