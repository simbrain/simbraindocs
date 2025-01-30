---
title: Bar Chart
layout: default
parent: Plots
has_children: false
nav_order: 75
---

# Bar Chart

Bar chart is a standard bar chart that can be used to represent changing set of quantities in a Simbrain simulation. For example, it is often useful to represent the activations of a group of neurons using bar chart and to watch how they change in time as the simulation runs.

<img src="/assets/images/barChartBlank.png" style="width:300px;"/>

## Menus

See [Plot file menu](index.html#file)

## Edit

- **Preferences**: Allows you to set the bar charts appearance.

    - **Lower Bound**: Sets the minimum value of the y-axis.

    - **Upper Bound**: Sets the maximum value of the y-axis.

    - **Auto Range**: When checked it automatically scales the y-axis so that the largest bar fits inside the window. It can be useful to turn this off to get a better sense overall changes in magnitude since while it is on they will fill up the window.

    - **Bar Color**: Allows the color of the bar to be changed.

## Help

See [Plot help menu](index.html#help)

## Couplings
<a href="/simbraindocs/src/docs/workspace/couplings.md">Learn more about couplings</a>

Bars in a barchart can be set using **couplings**. There are two ways to couple to barchart. Scalar couplings attach to scalar consumers that set a specific bar (if it is out of range the chart itself must be set). Vector couplings attach to a "set bar chart" attribute to set the values of the whole bar chart.