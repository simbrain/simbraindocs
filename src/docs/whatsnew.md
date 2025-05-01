---
title: What's New in 4.0
layout: default
has_children: false
nav_order: 5
---

# What's new in Simbrain 4

Simbrain 4.0 involved a complete rewrite of Simbrain that occurred between 2016 and 2025. During this time, most of the code was migrated to [Kotlin](https://kotlinlang.org/) and refactored, unit tests were added, and many new new features were introduced.

# New or improved components

* Image world complete rewrite.
* Evolutionary framework. Evolve networks and virtual robots to do things.
* Full simulation environment. Easy to make custom simulations, far better than bsh.
* Text world rewrite including support for computational linguistics 
* The tables and "data world" have been complete rewritten
* Odor world substantial revision (see below)

# Network

* Complete rewrite and refactored [update logic](network/updateLogic.html).
* Matrix backend and a carefully developed GUI for showing matrix operations and having communication between matrix objects.
* Undo /redo (Finally!)
* A wrapper on an existing machine learning framework, [Smile](https://haifengl.github.io/). 
* Supervised models that allow for immediae learning. A nice way to get a feel for how things work, and for tuning a network too. Each time you press “L” (for learn) the network learns by one increment. You can watch things happen in real time. Repeatedly press to implement learning. Finds the shortest path between source (Red selection) and target (green selection) and trains those using backprop
* Neuron Collections. A new way of organizing free neurons. If you delete the collection, the neurons are still there.
* Relu activation function directly available.  The color of the node is set by the upper bound, which is a graphical upper bound. 

# Plots

* New pixel plot
* Complete rewrite of projection component with new color managers.
* Time series updated. Fixed range vs. auto-range. "Auto-range is a feature that automatically adjusts the range of the time series data based on the maximum and minimum values present at a given time. This dynamic adjustment allows for optimized visualization and analysis, as it ensures all relevant data points are included and properly scaled within the chart or graph. It is especially useful for time series data with high variability or unpredictability."
    
# Odor World

[Odor World](worlds/odorworld.html) has been significantly rewritten to be closer to a standard 2d game

* Zooming and panning in larger worlds
* Tiles and tilemaps with support from [Tiled](https://www.mapeditor.org/) 
* Animated sprites
* More sensor and effector types 

# Other

* Preference framework rewritten