---
title: What's New in 4.0
layout: default
has_children: false
nav_order: 5
---

# What's new in 4.0

Simbrain 4.0 involved a complete rewrite over the course of nearly 10 years. Most of the code was migrated to [Kotlin](https://kotlinlang.org/) and refactored, unit tests were added, and many new new features were introduced.

# New or vastly improved components

* Image world. Send filtered images to Simbrain.

* Evolutionary framework.  Evolve networks and virtual robots to do things.

* Full simulation environment. Easy to make custom simulations, far better than bsh.

* Text world rewrite including support for computational linguistics 


## Network

Complete rewrite with new types of object. Rules now operate on data, scalar or matrix.

* Matrix backend and a carefully developed GUI for showing matrix operations and having communication between matrix objects.  Simbrain currently is all “scalar” based
    * All neuron and learning rules are now just prototypes which are applied to the data structures
    * A careful separation between free entities and arrays
    * No more neuron group concept. Instead, lightweight collections are used


* Wrapper on an existing machine learning framework, Smile. See [below](#smile_classifiers).

* Relu activation function directly available.  The color of the node is set by the upper bound, which is a graphical upper bound. To set it just turn off relu for a moment.

* Apply Immediate Learning. A nice way to get a feel for how things work, and for tuning a network too. Each time you press “L” (for learn) the network learns by one increment. You can watch things happen in real time. Repeatedly press to implement learning. Finds the shortest path between source (Red selection) and target (green selection) and trains those using backprop


There is a general new way of thinking about networks.

Free neurons and weights are distinguished from matrix based things.

All objects are network models

New approach to actions and shortcuts. Some are generic vs. specific. For example, R will randomize any selected objects.   But the randomize action on a neuron array context menu will only randomize that one you are clicked on.

* Neuron Collections. This is a new way of organizing neurons, into loose assemblages around free nodes. If you delete, the free nodes are still there.


<!-- Develop this using javadocs which has good notes. Define free nodes and link. -->


* Neuron Arrays. If clamped, they are not updated on update.  Else input arrays will zero out. However, in the API there is no forceset. You can just directly set activations.

# Plots

* Time series updated. Fixed range vs. auto-range. "Auto-range is a feature that automatically adjusts the range of the time series data based on the maximum and minimum values present at a given time. This dynamic adjustment allows for optimized visualization and analysis, as it ensures all relevant data points are included and properly scaled within the chart or graph. It is especially useful for time series data with high variability or unpredictability."


<!-- See updated comments in user parameter in TimeSeriesModel -->

# Smile Classifiers

In the discussion of Smile classifiers, include a discussion of how to choose which one

* https://stackoverflow.com/questions/2595176/which-machine-learning-classifier-to-choose-in-general

* Note we haven’t used every one possible.  We could add on request.

* Sometimes it’s really about understanding what they do and how they work

* But also other tradeoff to consider

# Workspace

* forceSetActivation is best used with clamped nodes. if used with unclamped then as soon as you iterate the activation will be lost and not visible

* addInput is better. accumulates if there there are multiple inputs         

# Odor World

[Odor World](worlds/odorworld.html) has been significantly rewritten.

* Sprites are animated

* More sensor and effector types an improvements to old ones

* Zooming is allowed

The big new feature is tile maps

* Tilemap
    * Width and height in number of tiles
    * Use stamp button
    * Must be in terrain fill mode
* Tileset
    * View > Tileset window
    * New
        * Must check embed in map
        * src.... tilset
        * maybe 2 pixel spacing