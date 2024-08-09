---
title: Tables
layout: default
parent: Utilities
has_children: false
nav_order: 155
---

# Tables

Simbrain tables are tables used throughout Simbrain to display data and allow for some numerical operations (e.g. an ability to randomize or normalize data).

<img src="/assets/images/table.png" alt="Table" style="width:500px;"/>


[Data world](../worlds/dataworld) is a simbrain component based on tables. 

Table data can be imported from and exported to **comma separated values** or .csv files (which can be read by most spreadsheet programs, e.g. Excel).

Most table operations (e.g. randomization) are applied by selecting cells and either using a hotkey or applying an item from a toolbar, menu, or context menu. Note: In some cases the hotkey and context menu give inconisistent results. In those cases try using toolbars or regular menus.


# Co-occurence Matrix

This is a matrix plot, a bit like an R corrplot, where you can choose a comparison function and make a matrix of comparisons.

<img src="/assets/images/tableWithComparisons.png" alt="Matrix Plot"/>


# Menus

## Edit

- Set rows / columns: Add a set number of row(s) and column(s).

### Fill Values

- Fill Table: Fill the entire table with a set value.

- ZeroFill the Table: Fill the entire table with the zero value.

### Randomize

- Randomize: Randomizes selected cell(s) in the table by sampling from an uniform distribution.

- Randomization Bounds: Adjusts the upper and lower limit for randomization of the data in the table.

- Normalize Column(s): **Rescales** the values in a column using maximum and minimum values so that they all lie in the range [0,1].

- Shuffle Rows: Randomly permute the rows of the table.

- Iteration Mode: When a table is in iteration mode, every time a network it is coupled to is iterated, the selected row moves forward. Running a coupled network thereby has the effect of iterating through the entire set of columns. This feature allows one to create a specific sequence of inputs to a network and repeatedly deliver it.

## Pop-up Menu

- Insert Row: Insert a new row above the highlighted row.

- Insert Column: Insert a new column.

- Delete Row: Delete the highlighted row.

- Delete Column: Delete the highlighted column.

- Edit > Set Rows / Columns: See **above**.

- Randomize: See **above**.

- Fill Values: See **above**.

# Toolbars

Note that the items from toolbar differs in different tables.

## Open / Save Toolbar

This toolbar allows you to open and save data.

- Open .csv data.

- Save table as .csv data.

## Table Structure Toolbar

This toolbar allows you to add and remove rows and columns.

- Add a row to the table. Inserts a row above the curently selected row, or as the bottom row if none is selected

- Add a column to the table.

- Remove a row from the table.

- Remove column from the table.

## Randomization Toolbar

For randomizing values in table cells.

- Randomize all cells in the table by sampling from an uniform distribution.

- Adjust upper and lower bounds of the randomization.

# Input Tables

One use of tables is as a way of producing inputs to a neural network. We call
This panel uses a Simbrain table to enter numeric data to a set of neurons. These can be invoked in [neuron arrays](../network/arraysMatrices), neuron collections, and in [supervised learning](../network/trainingNetworks). 

These tables have all the functions of Simbrain tables, with additional features for iterating through the rows of a table and sending the current row's data to the a network model.


## Menu and Toolbar Items for Input Tables

Basicall these tables can be used in two modes. The first mode just iterates through the rows and applies the current row:

- Apply and increment row.  Send current row of data to the model in question, e.g. the input row of a feed-forward network, and move to next row

Or separately increment row and then apply. In this mode we choose a row then apploy it, and increment when we want, using these commands:

- Apply row. Apply curren row but don't advance. This one can be used in conjunction with advance row.

- Advance row. Move to the next row.

