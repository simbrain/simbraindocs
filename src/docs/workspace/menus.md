---
title: Menus
layout: default
parent: Workspace
has_children: false
nav_order: 30
---

# MENUS

## File

Open Workspace: Opens a workspace from a stored .zip file. That is, open a configuration of workspace components (networks, worlds, plots, etc.), couplings, and update actions.

Save Workspace: Save the current workspace as a .zip file.  All components, couplings, and update actions are saved.
Save Workspace As: Save the current workspace and specify a name for the file.

Clear Workspace: Remove all components and couplings from current workspace, and remove any additional windows from the desktop.

Edit Update Sequence:Open the Edit Update Sequence dialog; see [update](update.html).

Workspace Properties: Open workspace [preferences](preferences.html) dialog.

## View

Property Tabs: Opens [Property Tabs](propertyTabs.html), which is used to monitor the state of the workspace and set properties.

Resize All Windows: Resize all windows on screen so they fit on the current desktop. Helpful when windows get lost offscreen, or when opening a workspace created on a larger monitor than the one you are using.

Gather Windows: Places all desktop windows in the upper left corner of the desktop and resizes them. Helpful when windows get lost offscreen, or when opening a workspace created on a larger monitor than the one you are using.

## Insert

New Network: Insert a new [Network](../network/index.html) component in to the workspace.

New Plot > Bar Chart:  Insert a new [Bar Chart](../plots/barChart.html).

New Plot > Histogram:  Insert a new [Histogram](../plots/histogram.html).

New Plot > Pie Chart:  Insert a new [Pie Chart](../plots/pieChart.html).

New Plot > Projection Plot:  Insert a new [Projection Plot](../plots/projectionPlot.html).

<!-- Scatter plot not in Plots section -->

New Plot > Scatter plot:  Insert a new **Scatter Plot**. 

New Plot > Time Series:  Insert a new [Time Series](../plots/timeSeries.html.html).

New World > Data World:  Insert a new [Data World](../worlds/dataworld.html).

New World > Odor World:  Insert a new [OdorWorld](../worlds/odorworld.html).

<!-- "Display world" and "Reader world" not in Worlds section  https://simbrain.net/Documentation/v3/Pages/Worlds/TextWorld/DisplayWorld.html and https://simbrain.net/Documentation/v3/Pages/Worlds/TextWorld/ReaderWorld.html-->

New World > Text World - Display:  Insert a new **Display World**.

New World > Text World - Reader:  Insert a new **Reader World**.

<!-- Is "vision world" the "image world"? -->

New World > Vision World:  Inserts a new vision world (but these are in beta now).

New Doc Viewer:  Insert a new [Document Viewer](../utilities/docviewer.html).

<!-- Missing "Console" page https://simbrain.net/Documentation/v3/Pages/Console.html -->

New Console: Insert a new Simbrain [Console](../utilities/terminal.html).

## Simulations

<!-- Missing "workspace level script" and "scripting" page?  https://simbrain.net/Documentation/v3/Pages/Scripting.html -->

Edit/Run Script: Edit and run a **workspace level script**.

Predefined Scripts: A set of predefined scripts also appears in this menu. This menu is automatically populated with any .bsh scripts in the scripts/scriptmenu directory. Invoke a given script simply by selecting it. You can also manually edit the script, orcreate new scripts, add them to that scriptmenu directory, and re-run Simbrain. Any .bsh files you added should appear.

Custom simulations created in the new simulation framework also appear in this menu. See **scripting** for more information.

## Couplings

Open Coupling Manager: Open [Coupling Manager](couplings.html).

Open Coupling List: Open [Coupling List](couplings.html).

## Help

Main Help: Open [Main Help](../../index.html) page.

Quick Start: Open [Quick Start](quickstart.html) page.

Keyboard Shortcuts: Open [Keyboard Shortcuts](quickstart.html) page.

<!-- 404 error for "Credits" page -->

Credits: Open **Credits** page.