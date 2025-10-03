---
title: Tables
layout: default
parent: Utilities
has_children: false
nav_order: 155
---

# Tables

Simbrain tables are spreadsheet-style components used throughout Simbrain to display data and perform numerical operations (randomization, normalization, filling, etc.). Most table operations are applied by selecting cells and using keyboard shortcuts, toolbar buttons, or context menu items.

<img src="/assets/images/table.png" alt="Table" style="width:500px;"/>

[Data World](../worlds/dataworld) is a Simbrain component based on tables. Tables are also used in various dialogs and for data visualization throughout the application.

# Table Operations

## Import and Export {#import-export}

- **<span id="import-csv">Import CSV</span>**: Import data from a [comma-separated values](https://en.wikipedia.org/wiki/Comma-separated_values) (`.csv`) file. Configure whether to include column/row names.

- **<span id="export-csv">Export CSV</span>**: Export table data to a `.csv` file. Configure whether to include column/row names.

- **<span id="import-arff">Import ARFF</span>**: Import data from a [WEKA ARFF](https://waikato.github.io/weka-wiki/formats_and_processing/arff_stable/) file format (commonly used in machine learning).

## Edit Structure {#edit-structure}

- **<span id="set-rows-columns">Set Rows / Columns</span>**: Change table dimensions. A dialog prompts for new dimensions. All cells are zeroed out.

- **<span id="insert-row">Insert Row</span>**: Insert a new row above the selected row (or at bottom if none selected). New rows are initialized with default values.

- **<span id="delete-rows">Delete Rows</span>**: Delete all selected rows. Multiple rows can be selected and deleted simultaneously.

- **<span id="insert-column">Insert Column</span>**: Insert a new column to the right of the selected column (or leftmost if none selected).

- **<span id="delete-columns">Delete Columns</span>**: Delete all selected columns. Multiple columns can be selected and deleted simultaneously.

## Edit Values {#edit-values}

- **<span id="fill">Fill</span>**: Fill selected cells with a specified value. A dialog prompts for the value, which must be compatible with the column's data type.

- **<span id="zero-fill">Zero Fill</span>** (**Z**): Fill selected cells with zero. Faster alternative to Fill when zeroing out cells.

- **<span id="randomize">Randomize</span>** (**Ctrl/Cmd+R**): Randomize selected cells using the current randomizer distribution (default: uniform). Configure the distribution using Edit Randomizer.

- **<span id="edit-randomizer">Edit Randomizer</span>**: Configure the probability distribution for randomization (uniform, normal/Gaussian, etc.). Affects all subsequent Randomize operations.

## Visualization and Analysis {#visualization}

- **<span id="boxplot">Boxplots for Columns</span>**: Create boxplots showing distribution of values (median, quartiles, outliers) for all numeric columns. Opens in a new window.

- **<span id="matrix-plot">Show Matrix Plot</span>**: Create a matrix visualization of pairwise relationships between row vectors using comparison functions (Correlation, Covariance, Cosine Similarity, Euclidean Distance, Dot Product). If rows are selected, only those are compared; otherwise all rows are compared. Useful for understanding high-dimensional data relationships.

- **<span id="plot-embedding">Plot Word Embedding</span>**: Create a PCA projection plot of table data in 2D or 3D. Each row becomes a point. Row labels are displayed as point labels. Useful for exploring word embeddings and high-dimensional data patterns.

- **<span id="eigenvalues">Show Eigenvalues</span>**: Display eigenvalues of the table data as a matrix. Only available for square numeric tables. Useful for understanding matrix properties and dimensionality.

# Context Menu and Keyboard Shortcuts

Most table operations can be accessed via:
- **Toolbar buttons** at the top of the table panel
- **Right-click context menu** on selected cells
- **Keyboard shortcuts** (listed with each operation above)

**Selection tips:**
- Click and drag to select a rectangular region of cells
- **Shift+Click** to extend selection
- **Ctrl/Cmd+Click** to select multiple non-contiguous cells
- Click on row/column headers to select entire rows or columns

