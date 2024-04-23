---
title: Workspace
layout: default
has_children: true
nav_order: 10
---

# Workspace Intro

The Simbrain workspace is the framework within which a simulation is run. It contains components which are coupled to one another, and tools for managing these interactions.   More specifically, the workspace  is responsible for:

1. Maintaining a list of components (neural networks, virtual worlds, data tables, plots, etc.)
2. Maintaining a list of couplings, which are links between components (e.g. from a neural network to a time-series plot of the activation of some nodes in that network).
3. Managing simulation updates.  The network is updated using the play or step buttons in the toolbar, and the current iteration number is also visible in the toolbar. Custom forms of update are also available.
The workspace is visible in the GUI as the Simbrain desktop(see below). The desktop contains menus, a toolbar, and a main space in which all components are shown. There is also a set of tabs at the bottom of the network (not visible by default; to see them use View > Property Tabs) which allow the user to view couplings, set certain properties of components, and monitor a simulation in other ways.

Workspaces are stored as .zip files. These files contain .xml representations of all components and couplings in a simulation. They can be unzipped, and individual saved component and couplings can be inspected. (Note that you cannot currently change the files, rezip, and re-open). Workspace files save couplings and components and custom updates, but sometimes a more sophisticated workspace environment must be created. In these cases scripting can be used.
