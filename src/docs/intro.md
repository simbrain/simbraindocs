---
title: Intro
layout: default
has_children: false
nav_order: 10
---

# What's new in 4.0

Complete rewrite of almost everything with a software engineer, tons of unit tests, lots of refactoring, so everything is more stable and reliable.

## Big stuff

* Matrix backend and a carefully developed GUI for showing matrix operations and having communication between matrix objects.  Simbrain currently is all “scalar” based
    * All neuron and learning rules are now just prototypes which are applied to the data structures
    * A careful separation between free entities and arrays
    * No more neuron group concept. Instead, lightweight collections are used

* Image world. Send filtered images to Simbrain.

* Full simulation environment. Easy to make custom simulations, far better than bsh.

* Evolutionary framework.  Evolve networks and virtual robots to do things.

* Text world / comp linguistics stuff

* Wrapper on an existing deep learning framework

* Wrapper on an existing machine learning framework

## Relu

Now directly available.  The color of the node is set by the upper bound, which is a graphical upper bound. To set it just turn off relu for a moment.

## Update Rules

The background idea is that rules operate on data.  The same rule can be applied to matrix or scalar data.

## Neuron Collection

This is a loose assemblage around free nodes.  See javadocs for more info.

If you delete, the free nodes are still there.

## Neuron Arrays

If clamped, they are not updated on update.  Else input arrays will zero out. 

However, in the API there is no forceset. You can just directly set activations.

## Time Series

See updated comments in user parameter in TimeSeriesModel

Fixed range vs. auto-range

"Auto-range is a feature that automatically adjusts the range of the time series data based on the maximum and minimum values present at a given time. This dynamic adjustment allows for optimized visualization and analysis, as it ensures all relevant data points are included and properly scaled within the chart or graph. It is especially useful for time series data with high variability or unpredictability."

## Key Shortcuts

Some are generic vs. specific. For example, R will randomize any selected objects.   But the randomize action on a neuron array context menu will only randomize that one you are clicked on.

## Apply Immediate Learning

A nice way to get a feel for how things work, and for tuning a network too.

Each time you press “L” (for learn) the network learns by one increment. You can watch things happen in real time.

Repeatedly press to implement learning.

Finds the shortest path between source (Red selection) and target (green selection) and trains those using backprop

## Smile

In the discussion of Smile classifiers, include a discussion of how to choose which one

* https://stackoverflow.com/questions/2595176/which-machine-learning-classifier-to-choose-in-general

* Note we haven’t used every one possible.  We could add on request.

* Sometimes it’s really about understanding what they do and how they work

* But also other tradeoff to consider

## Couplings

* forceSetActivation is best used with clamped nodes. if used with unclamped then as soon as you iterate the activation will be lost and not visible

* addInput is better. accumulates if there there are multiple inputs         

## Making Simulations

* Open registered simulations
    * Make a new sim copying existing stuff

* When making a sim, add models before setting locations

## Tiled

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

# Quick Start

stuff
