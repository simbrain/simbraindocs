---
title: What's New in 4.0
layout: default
has_children: false
nav_order: 5
---

# What's new in Simbrain 4

Simbrain 4.0 involved a complete rewrite of Simbrain that occurred between 2015 and 2025. During this time, most of the code was migrated to [Kotlin](https://kotlinlang.org/) and refactored, unit-tests were added, and hundreds of new features were introduced.

# New or improved components

* A [neuro-evolutionary](evolution/) framework was added. Evolve virtual robots to do things!
* A full [simulation environment](simulations/) was introduced, replacing the earlier scripting environment.
* A [classifier](network/subnetwork/classfier) object was added, which wraps an existing machine learning framework was introduced, [Smile](https://haifengl.github.io/classification.html). 


# Network

* Undo /redo (Finally!)
* The major change is array-based neural networks, including a carefully developed GUI (see [neuron arrays and matrices](network/arraysMatrices)) for visualizing array and matrix operations in Simbrain's signature intuitive style.
* Introduction of transformer blocks and support for language models.
* [Supervised models](network/supervisedModels) that allow for using backprop on the fly on a source and target set of neurons or neuron arrays, including through paths of diverging and reconverging weights.
* [Neuron collections](network/neuronGroups#neuron-collection) were introduced as a new way of organizing  neurons. These are lightweight wrappers on neurons that can overlap.
* New activation functions, connection strategies, subnetwork types (e.g. [restricted Boltzmann machines](network/subnetworks/restrictedBoltzmannMachine)) spike responderes, and much more!

# Plots

* A new [pixel plot](plots/pixelPlot) was introduced.
* The [projection plot](plots/projectionPlot) was rewritten, and new color managers were introduced.
* [Time series](plots/timeSeries) were updated with better auto-range capacities.
* [Raster plots](plots/rasterPlot) were updated and improved.
    
# Odor World

[Odor World](worlds/odorworld.html) has been significantly rewritten to be closer to a standard 2d game

* Zooming and panning in larger worlds
* Tiles and tilemaps with support from [Tiled](https://www.mapeditor.org/) 
* Animated sprites
* More sensor and effector types 

# Image world

* [Image world](worlds/imageworld.html) has been completely rewritten. 
* Groups of images can be loaded and flipped through in an album
* Images can also be edited live using a simple editor

# Text world

* [Text world](worlds/textworld.html) has been completely rewritten. 
* Word embeddings are much easier to manage 
* A full suite of text extraction methods was introduced
* Bytepair encodings can be visualized

# Other

* The [preference](network/networkPreferences) framework was rewritten
* The [tables](utilities/tables) and [data world](worlds/dataworld) have been completely rewritten on top of the Smile framework.
