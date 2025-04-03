---
title: Property Tabs
layout: default
parent: Workspace
has_children: false
nav_order: 50
---

# Property Tabs

At the bottom of the simbrain desktop is a set of tabs (invisible by default; to view them go to View > Property Tabs) that can be used to monitor the state of the workspace and set certain properties.

## Components

A list of the [components](components.html) in the workspace. Each row corresponds to one component, and contains these colums:

- **Component**: The name of the component.
- **Type**: Shows the kind of workspace components (network, bar chart, time series, etc).
- **GuiOn**: A simple checkbox allowing the user to enable (default) or disable the component's GUI. Doing this will visually remove the component from the workspace, lowering the computational time and memory usage of all network operations.
- **Update On**: A simple checkbox allowing the user to enable (default) or disable the updating of a network component. If this option is not selected, the component will not update when the global (workspace) update is activated (see: [Updates](update.html) for more information).

## Couplings

A list of all the [couplings](couplings.html) in the workspace.

## Terminal

<!-- Missing "workspace level script" and "scripting" page?  https://simbrain.net/Documentation/v3/Pages/Scripting.html -->

A beanshell terminal allowing the user a command line level interface with Simbrain.  See the discussion in **scripting**.

## Updater

<!-- Missing "update" page. 404 error -->

Status of updater. See **update**.