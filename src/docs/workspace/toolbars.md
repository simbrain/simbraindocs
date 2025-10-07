---
title: Toolbars
layout: default
parent: Workspace
has_children: false
nav_order: 60
---

# Toolbars

The main toolbar provides quick access to common workspace operations. Buttons are organized into functional groups separated by dividers.

## File Operations

- **Open**: Opens a file chooser to load a saved workspace from a .zip file.
- **Save**: Saves the current workspace. If the workspace has not been saved before, opens a file chooser.

## Update Controls

- **Iterate**: Updates the workspace once (single step). Same as pressing the spacebar.
- **Run/Stop**: Toggle button that runs the workspace continuously until clicked again. Changes between "Run" and "Stop" states.

## Coupling

- **Coupling manager**: Opens the [coupling manager](couplings.html) dialog, which allows creating and managing couplings between workspace components.

## Component Creation

- **Network**: Creates a new [Network](../network/index.html) component. Clicking opens a new network window where you can construct neural networks.
- **Worlds**: Dropdown button displaying a menu of available [worlds](../worlds/)
- **Plots**: Dropdown button displaying a menu of available [plots](../plots/)
- **Console**: Creates a new [console](../utilities/terminal.html) for command-line access to Simbrain features.

## View Controls

- **Bottom dock**: Toggles visibility of the bottom panel containing Components, Terminal, and Performance tabs. See [Property Tabs](propertyTabs).
- **Info panel**: Toggles visibility of the side info panel that displays documentation and help content. Only enabled when content is available.

## Iteration Display

To the right of all toolbar buttons is a display of the current iteration number. It can be reset to zero by double-clicking on it. While a simulation is running, an animated indicator appears to show that the workspace is active.
