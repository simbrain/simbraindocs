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

# Creating a Text World

To create a new Text World component you can use

- `Insert > New World > Text World` from the menu
- Right click on the deskopt and `Insert > New World > Text World`
- Click on the world icon and select `Text World`

# Dictionary

 Associates string tokens with vector representations. Each member of a list of String tokens is associated with a row of a Matrix of doubles.
 
 Allows for reverse mappings from vectors back to tokens using a [KDTree].
 
 All tokens are converted to lower case.

 

# Menu Commands

## File

- **Import from xml**: Import data from a .xml file
- **Export to xml**: Export data to a .xml file
- **Load text**: Load text from file (.txt)
- **Rename**: Rename the current Text World window
- **Close**: Close the current Text World Window

## Edit

- **Find/Replace**: Find words in text and replace them with word of choice
- **Record Word Embeddings**: Assign new vector values to words in chosen text
- **Couple Plots**: Create a visual representation linked to word embeddings
- **Create TextWorld Coupling**: Send data from Text World to another window
- **Show Preferences**: Change how Text World behaves

## View

- **View / edit token embedding**: View or edit current token:vector value pairs

## Help

- **Help**: Link to Simbrain Docs

## Icon Bar

- **View Token Embedding**: Open Token Embedding Viewer/Editor Window
- **Extract Embedding from text file**: Choose a text file to extract embeddings from
- **Text World Preferences**: Change how Text World behaves

