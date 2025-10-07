---
title: Workspace
layout: default
has_children: true
nav_order: 10
---

# Workspace Intro

The Simbrain workspace is the framework within which a simulation is run. It contains components which are coupled to one another, and tools for managing these interactions.   More specifically, the workspace  is responsible for:

1. Maintaining a list of [components](components) (neural networks, virtual worlds, data tables, plots, etc.)
2. Maintaining a list of [couplings](couplings), which are links between components (e.g. from a neural network to a time-series plot of the activation of some nodes in that network).
3. Managing simulation [updates](update).  The network is updated using the play or step buttons in the [toolbar](toolbars), and the current iteration number is also visible in the toolbar. Custom forms of update are also available.

The workspace is visible in the GUI as the Simbrain desktop. The desktop contains menus, a toolbar, and a main space in which all components are shown. There is also a bottom dock (not visible by default; to show it use View > Bottom dock) which contains tabs for viewing components, using the terminal, and monitoring performance.

Workspaces are stored as .zip files. These files contain .xml representations of all components and couplings in a simulation. They can be unzipped, and individual saved component and couplings can be inspected. (Note that you cannot currently change the files, rezip, and re-open). Workspace files save couplings and components and custom updates, but sometimes a more sophisticated workspace environment must be created. In these cases a custom [script](/docs/simulations/) can be written.


# Running the Workspace

The workspace and its components can be run by pressing the Run button in the toolbar to repeatedly iterate the workspace. The button becomes a "Stop" button while running. Pressing it again will stop the workspace. Thus the Run/Stop button acts as a toggle switch. You can also press the Step button (or press spacebar) to iterate the workspace a single time. Sometimes repeatedly hitting the spacebar is a useful way to test a simulation. See [update](update) for more details.


# Examples

To see some different workspaces, try opening a workspace file by pressing the Open button in the [toolbar](toolbars.html). It defaults to a workspace directory with various examples in it.

You can also try invoking simulations from the [Simulations menu](menus.html). These create workspaces demonstrating various neural network concepts and models.


