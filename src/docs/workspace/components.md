---
title: Workspace Components
layout: default
parent: Workspace
has_children: false
nav_order: 10
---

# Workspace Components

Components are the main elements of a Simbrain simulation. They are visible as windows in the Simbrain desktop. Neural networks, plots, and virtual environments are examples of components.

When default [update](update.html) is used, at every iteration of the workspace each component is updated. Update can be manually turned off using the Components tab in the [bottom dock](propertyTabs.html). A component's GUI representation can also be turned off (but update left on) to speed up a simulation.

There are some generic properties that are common to most component types:

- **Adding components**: To add components press the relevant button on the [toolbar](toolbars), or use the Insert menu. Components can also be added from [simulations](../simulations).

- **Saving / Opening**: Use the save and open buttons on the toolbar or the File menu. Most components are saved using human-readable XML format.

- **GUI Visibility** (settable in the Components tab of the [bottom dock](propertyTabs.html)): Whether the component window is visible in the desktop. Making a component invisible can be useful when trying to speed up a simulation.

- **Update** (settable in the Components tab of the [bottom dock](propertyTabs.html)): Whether the component should be updated when the workspace is iterated.