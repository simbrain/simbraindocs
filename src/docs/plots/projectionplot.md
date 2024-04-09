---
title: Projection Plots
layout: default
has_children: false
nav_order: 20
---

# Projection Plots

## Background

* Dimensionalty reduction,

* See hisee and grab a bunch of stuff from there

## General properties

* Tolerance

## General graphical properties

* Connect points

* Hot color: color for current color

* Base colors

* Show labels. But this is only if they are defined somewhere. Usually there aren’t any

* Use Hotpoint

## Projection Methods

* Coordinate
    * Just ignore everything and focus on a few dimension

* PCA
    * First three points are coordinate
    * You can “freeze” the current projection and keep reusing it

* Sammon  (Iterable)
    * A form of MDS

## Iterable Projection Methods

* Have a play button

* Require an initialization method to use before play button is pressed

## Coloring Manager

* Methods used to determine coloring of points

# Archives

## Strategy 

* Start fresh, reusing ntree.  No GUI, just units tests. All in Kotlin.

## Conceptual Issues

* Adding new points
    * This is a generic issue which should probably be abstracted
    * A few cases
        * What to do when not many points
        * What to do when a bunch of points have been projected and you get a new one, and don’t want to start over
    * Many methods assume you are given a dataset and apply the method
    * In Simbrain you might have already used a method, and get new points
    * See Projector.addPoint

* Iterable Projection Methods. Methods where it makes sense to have a “play” button.
    * Problem: how to initialize nethem. Different methods are provided

## Document

* We need a design doc 
    * projector.addpoint(). 
    * If the  new point is within tolerance, don’t add it

## Code Organization

* Colored Datapoint

## Code Todos
* Document projectioor.addPoint implicit coordinate projection 
* Property Editor
* Triangulation isn’t implemented. Consider removing.
* Reconcile suggestedMinPoints with Projector.addPoint (which uses isIterable)
* Code review Dataset (why does it maintain distances)
* Code review ColoredDataPoint
* Save step size in Sammon?
* Unit test ntree

## New Features

* Select points and do things like delete

Other stuff

## GPT

The process of adding a new point without having to re-run the entire dimensionality reduction algorithm is called incremental dimensionality reduction or online dimensionality reduction.
This approach is often used when dealing with large datasets that are constantly growing, where re-running the entire dimensionality reduction algorithm each time a new point is added would be computationally expensive and time-consuming. Instead, incremental dimensionality reduction algorithms update the projection of the existing points based on the new point, and can be more efficient than re-running the entire algorithm.
Some popular incremental dimensionality reduction techniques include incremental PCA (Principal Component Analysis) and online t-SNE (t-Distributed Stochastic Neighbor Embedding).

Incremental PCA: Incremental PCA — scikit-learn 1.2.2 documentation
The Fast Convergence of Incremental PCA
Oja's rule - Wikipedia from Doing PCA in java on large matrix - Stack Overflow
