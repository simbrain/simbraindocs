---
title: Data World
layout: default
parent: Worlds
has_children: false
nav_order: 30
---

# Data World

Data World is a spreadsheet-based component that sends data to and receives data from other Simbrain components, primarily neural networks. It is closely based on [tables](../utilities/tables) and provides a way to stream tabular data into simulations or record outputs from networks.

Data World is commonly used to provide input sequences to neural networks via [couplings](../workspace/couplings). Each row corresponds to an input or output vector, and each column corresponds to a neuron or component in a network. As the workspace updates, the current row advances (or stays static), and data from that row is sent to coupled components or data from components is written to that row.

Most table operations (randomization, fill, etc.) are applied by selecting cells and using menu items, toolbar buttons, or context menus. See [tables](../utilities/tables) for complete documentation of table operations.

Example simulation: `Neuroscience > STDP` provides a useful demonstration of Data World in action.

# Creating a Data World

To create a new Data World component:
- `Insert > New World > Data World` from the menu
- Right click on the desktop and select `Insert > New World > Data World`
- Click on the world icon and select `Data World`

# Configuration Options

Data World has two key behavioral settings that control how it advances through rows and handles data writes. These can be configured via `File > Data world preferences...`

## Row Advancement

Controls how the current row advances on each workspace update tick:

- **Loop**: Advance to the next row and wrap back to row 0 at the end. This creates a continuous cycle through the data.
- **Static**: Stay on the current row. Useful when manually controlling row position or when the data should not auto-advance.

When Loop is selected, Data World continuously cycles through rows during simulation, making it ideal for repeating input sequences or recording time-series data.

## Write Behavior

Controls what happens when data is written to Data World from a coupling:

- **Overwrite**: Write data into the current row, replacing existing values. The table size remains fixed.
- **Append**: When writing to the last row, automatically insert a new row after it. This allows the table to grow dynamically as data is recorded.

Append mode is particularly useful when recording an unknown amount of data from a network during a simulation, as the table will automatically expand to accommodate new data.

# Couplings

Data World supports both producing and consuming data through couplings:

- **Producing data**: The current row (either as numeric or string values) can be sent to neurons, neuron groups, or other components. Select `Edit > Create DataWorld Coupling` to create producer couplings.
  
- **Consuming data**: Data from networks or other components can be written into the current row. The write behavior setting determines whether data overwrites the current row or causes the table to grow.

- **Coupled plots**: Data World can send its current row directly to plot components for real-time visualization. Use `Edit > Couple Plots` to create plot couplings.

# Menu Commands

## File Menu

- **Import**: Import Data World configuration from a `.xml` file
- **Export**: Export Data World configuration to a `.xml` file  
- **Import CSV**: Import data from a `.csv` file. See [Import CSV](../utilities/tables#import-csv) in the table documentation for details.
- **Data world preferences...**: Configure [row advancement](#row-advancement) and [write behavior](#write-behavior) settings
- **Close**: Close the current Data World window

## Edit Menu

- **Set Rows/Columns**: Change the dimensions of the data table (see [Set Rows / Columns](../utilities/tables#set-rows-columns))
- **Fill**: Fill selected cells with a specified value (see [Fill](../utilities/tables#fill))
- **Randomize**: Randomize selected cells (see [Randomize](../utilities/tables#randomize))
- **Edit Randomizer**: Configure the randomization distribution (see [Edit Randomizer](../utilities/tables#edit-randomizer))
- **Couple Plots**: Create couplings to plot components for real-time data visualization. The current row is sent to the plot at each workspace update.
- **Create DataWorld Coupling**: Open the coupling interface to create connections between Data World and other components

## Toolbar and Context Menu Operations

Data World includes a toolbar and context menu with operations inherited from the [table utility](../utilities/tables):

- [Insert Row](../utilities/tables#insert-row) / [Insert Column](../utilities/tables#insert-column)
- [Delete Rows](../utilities/tables#delete-rows) / [Delete Columns](../utilities/tables#delete-columns)  
- [Fill](../utilities/tables#fill) / [Zero Fill](../utilities/tables#zero-fill)
- [Randomize](../utilities/tables#randomize) (keyboard shortcut: **Ctrl/Cmd+R**)
- [Boxplots for Columns](../utilities/tables#boxplot)
- [Show Matrix Plot](../utilities/tables#matrix-plot)

Refer to the [table documentation](../utilities/tables) for complete details on these operations.
