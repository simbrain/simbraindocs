---
title: Text World
layout: default
parent: Worlds
has_children: false
nav_order: 100
---

# Text World

Text worlds transform text into numbers and numbers in to text. They are primarily used to model language, for example, to make networks that "read" text or produce simulated speech, i.e.,to develop connectionist models of language processing. However, text worlds can also be used more generally as a way of incorporating text processing in to a simulation, for example to log information or issue commands to a network.

This image shows a text world linked to a [projection plot](../plots/projectionPlot) to study word meanings.

To get an intuitive feel for how text world works, see the simulations in `simulations > NLP`

<img src="/assets/images/textWorld.png" alt="Table" style="width:500px;"/>


# Dictionary

 Associates string tokens with vector representations. Each member of a list of String tokens is associated with a row of a Matrix of doubles.
 
 Allows for reverse mappings from vectors back to tokens using a [KDTree].
 
 All tokens are converted to lower case.

 

# Menu Commands

## File

- **Import from xml**: 
- **Export to xml**: 
- **Load text**: 
- **Rename**: 
- **Close**: 

## Edit

- **Find/Replace**: 
- **Record Word Embeddings**: 
- **Couple Plots**: 
- **Create TextWorld Coupling**: 
- **Show Preferences**: 

## View

**View / edit token embedding**:
