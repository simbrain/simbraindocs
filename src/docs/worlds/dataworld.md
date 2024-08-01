---
title: Data World
layout: default
parent: Worlds
has_children: false
nav_order: 30
---

# Dataworld

Data world are closely based on [tables](../utilities/tables) so please also refer to that documentation.

Data Worlds are essentially spreadsheets or tables that can be used to send data to and receive data from (primarily) neural networks. They are wrappers around Simbrain Tables. The main feature of data worlds is that they are set up to always have a current row. That row is what is used to send and receive data. If `edit > iteration mode` is set, then at each workspace update the current row is advanced. This can be useful for sending data to a network or recording data from a network. The STDP Workspace simulation provides a useful example of a dataworld in action.

A standard use of data worlds is to provide inputs to a neural network. In that case, each row in a Data World corresponds to an input or output vector, and each column corresponds to an input node in a neural network.

## Tables

Simbrain tables are tables used throughout Simbrain to display data and allow for some numerical operations (e.g. an ability to randomize or normalize data). Table data can be imported from and exported to comma separated values or `.csv` files (which can be read by most spreadsheet programs, e.g. Excel).

Most table operations (e.g. randomization) are applied by selecting cells and either using a hotkey or applying an item from a toolbar, menu, or context menu.

### Menu Commands

#### File
- **Import**: Import data from a `.xml` file.
- **Export**: Export data to a `.xml` file.
- **Preferences**: Allows you to change append mode to either loop or append.
- **Rename**: Renames the current Data World window.
- **Close**: Closes the current Data World.

#### Edit
- **Couple Plots**: Allows you to couple data to plots. Plots available are bar and pie charts; pixel, projection, histogram, raster, and time series plots.
- **Create DataWorld Coupling**.
- **Preferences**.

#### Data Tools
- **Import csv files**: Import comma separated files. Allows you to choose whether or not to include column and row names.
- **Export csv file**: Export as a comma separated file. Allows you to choose whether or not to include column and row names.
- **Fill selected cells**: Allows you to fill in selected cells with an input value.
- **Randomize**: Randomizes selected cell(s) in the table by sampling from a uniform distribution.
- **Bar Plot**.
- **Histogram**.
- **Show Plot**.

### Comparison Functions
- **Correlation**.
- **Covariance**.
- **Cosine similarity**.
- **Euclidean Distance**.
- **Dot Product**.

### Row Operations
- **Add Row**.
- **Delete Row**.

### Column Operations
- **Add Column**.
- **Delete Column**.

### Bar Functions
- **Print**.
- **Zoom In and Out**.
- **Enlarge and Shrink**.
- **Increase Height**.
- **Decrease Height**.
- **Increase Width**.
- **Decrease Width**.

## Properties

### Data World Couplings

For more information see the Coupling documentation. Remember that data worlds have a current row, and that data is sent from and received to that row. The current row can be associated with vector consumers and producers, and scalar consumers and producers.

Vector couplings are straightforward. Vector producers take the value of the current row and send it out to a vector consumer, e.g. a neuron group. Vector consumers receive a vector value and apply it to the current row, truncating if necessary.

Scalar couplings are tied to specific columns. Thus, these attributes have names like "Column 1". A scalar producer for a column takes the value of that column in the current row and sends it to a scalar consumer, e.g. a neuron. A scalar consumer for a column receives a scalar value and it applies it to that column, at the current row.
```