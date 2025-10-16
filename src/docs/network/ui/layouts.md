---
title: Layouts
layout: default
parent: UI and Tools
grand_parent: Networks
has_children: false
nav_order: 30
---

# Neuron Layouts

Layouts are used to organize neurons spatially in a Simbrain network window. They can be applied in several ways:

1. To arrange a group of free neurons by selecting them and choosing a layout from the right-click context menu or the `Edit > Layout` menu
2. To specify the layout for a neuron group when creating it
3. To rearrange existing neurons in a neuron group using the group's property dialog

The initial position for a layout corresponds to the last position clicked on screen, or the center of the selected neurons if no position has been set.

## Grid Layout

Neurons are laid out in a grid pattern, beginning at an initial position and proceeding left-to-right, top-to-bottom.

- **Horizontal Spacing**: Distance between neurons from left to right
- **Vertical Spacing**: Distance between neurons from top to bottom
- **Auto Columns**: If true, the number of columns is set automatically to create a square or nearly-square grid. If false, you can manually specify the number of columns
- **Number of Columns**: Number of columns in the grid when Auto Columns is disabled

When Auto Columns is enabled with more than 3 neurons, the number of columns is automatically set to the square root of the total number of neurons. For 3 or fewer neurons, 2 columns are used for better visual appearance.

## Line Layout

Neurons are laid out in a single line, either horizontal or vertical.

- **Orientation**: Whether neurons are arranged horizontally or vertically (options: Horizontal, Vertical)
- **Spacing**: Distance between adjacent neurons

## Hexagonal Grid Layout

Neurons are laid out in a hexagonal grid pattern, with alternating rows offset to create a honeycomb appearance. This layout is particularly useful for self-organizing maps and spatial topologies.

- **Horizontal Spacing**: Distance between neurons from left to right
- **Vertical Spacing**: Distance between neurons from top to bottom
- **Auto Columns**: If true, the number of columns is set automatically to create a square or nearly-square grid. If false, you can manually specify the number of columns
- **Number of Columns**: Number of columns in the grid when Auto Columns is disabled

In hexagonal layouts, alternating rows are offset by half the horizontal spacing to create the hexagonal pattern.

