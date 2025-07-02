---
title: Data World
layout: default
parent: Worlds
has_children: false
nav_order: 30
---

# Dataworld

Data world are closely based on [tables](../utilities/tables). They are spreadsheets or tables that can send data to and receive data from (primarily) neural networks. A standard use of data worlds is to provide inputs to a neural network via [couplings](../workspace/couplings). In that case, each row corresponds to an input or output vector, and each column corresponds to a node in a neural network.If `edit > iteration mode` is set, then at each workspace update the current row is advanced. This can be useful for sending data to a network or recording data from a network.  Most table operations (e.g. randomization) are applied by selecting cells and either using a hotkey or applying an item from a toolbar, menu, or context menu.

The `Neuroscience > STDP` simulation provides a useful example of a dataworld in action.

## Menu Commands

### File
- **Import**: Import data from a `.xml` file.
- **Export**: Export data to a `.xml` file.
- **Preferences**: Allows you to change append mode to either loop or append.
- **Rename**: Renames the current Data World window.
- **Close**: Closes the current Data World.

### Edit
- **Couple Plots**: Allows you to couple data directly to plots. At each workspace simulation the current row is sent to the relevant chart type.
- **Create DataWorld Coupling**: Create couplings between the data world (using current row)
- **Preferences**:

### Other Commands
All other commands are documented in the [table documentation](../utilities/tables).
