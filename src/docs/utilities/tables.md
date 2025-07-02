---
title: Tables
layout: default
parent: Utilities
has_children: false
nav_order: 155
---

# Tables

Simbrain tables are tables used throughout Simbrain to display data and allow for some numerical operations (e.g. an ability to randomize or normalize data). Most table operations (e.g. randomization) are applied by selecting cells and either using a hotkey or applying an item from a toolbar, menu, or context menu. 

<img src="/assets/images/table.png" alt="Table" style="width:500px;"/>


[Data world](../worlds/dataworld) is a simbrain component based on tables. 

# Toolbar and Menu Actions

This is a list of possible actions in toolbars, popup menus, and menus. They will occur in different combinations in different ables.

## Export / import

- **Export to csv**: Export to [comma separated values](https://en.wikipedia.org/wiki/Comma-separated_values) or .csv file. Allows you to choose whether or not to include column and row names.
- **Import from csv**: Import from a csv file.

## Edit Table Structure

- **Insert Row**: Insert a new row above the highlighted row.
- **Insert Column**: Insert a new column.
- **Delete Row**: Delete the highlighted row.
- **Delete Column**: Delete the highlighted column.
- **Set Rows / Columns**: Set table shape to a specific number of rows and columns

## Edit and Analyze Table Values

- **Randomize**: See [above](tables.html#randomize).
- **Fill Values**: See [above](tables.html#fill-values).
- **Fill Table**: Fill the entire table with a set value.
- **ZeroFill the Table**: Fill the entire table with the zero value.
- **Boxplot columns**: Create boxplot for all numeric columns.

### Randomize

- **Randomize**: Randomizes selected cell(s) in the table by sampling from an uniform distribution.
- **Randomization Bounds**: Adjusts the upper and lower limit for randomization of the data in the table.
- **Normalize Column(s)**: [Rescales](https://en.wikipedia.org/wiki/Feature_scaling) the values in a column using maximum and minimum values so that they all lie in the range [0,1].

## Advance rows

- **Apply and increment row**.  Send current row of data to the model in question, e.g. the input row of a feed-forward network, and move to next row
- **Apply row.** Apply to current row but don't advance. This one can be used in conjunction with advance row.
- **Advance row.** ove to the next row.
- **Iteration Mode**: When a table is in iteration mode, every time a network it is coupled to is iterated, the selected row moves forward. Running a coupled network thereby has the effect of iterating through the entire set of columns. This feature allows one to create a specific sequence of inputs to a network and repeatedly deliver it.

# Co-occurence Matrix

This is a matrix plot, a bit like an [R corrplot](https://cran.r-project.org/web/packages/corrplot/vignettes/corrplot-intro.html, where you can choose a comparison function and make a matrix of comparisons. The comparisons are made between the **row** of the table: all pairwise row comparison are shown.

<img src="/assets/images/tableWithComparisons.png" alt="Matrix Plot"/>

### Comparison Functions
- **Correlation**:
- **Covariance**:
- **Cosine similarity**:
- **Euclidean Distance**:
- **Dot Product**:

