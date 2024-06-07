---
title: Projection Method
layout: default
grand_parent: Plots
parent: Projection Plot
has_children: false
nav_order: 30
---

# Projection Methods Overview

There are numerous ways to project high dimensional data to lower dimensions. The projection menu in the projection component window allows one to switch projections and thereby compare the way neural network data look under different projections. For an overview of some of these methods see **this page**.

There are three main ways data point are addded in Simbrain:

1. Simple (Coordinate, PCA): When new data arrive, the algorithm is simply re-applied to the whole dataset.

2. Iterative (Sammon): For the Sammon map to work, it must be iterated. Thus, with it, you generally start by either randomizing the current data, or beginning with another method (e.g. PCA or Coordiante), and then iterating it using its play button. Choosing the right step size is a trial and error process.

3. Extension to existing data (Triangulation and NN Subspace). With these methods the currently projected data is used as a source that is the basis for subsequent addition of new points. The idea would be to begin by projecting a bunch of data using PCA, for example, then switching to Triangulation so that subsequent points are placed based on where the other points were placesd. For these methods, if there are not enough datapoints in the current dataset to perform a good projection, the warning icon warning icon will be shown.

## Coordinate Projection

This is perhaps the simplest possible projection technique. If one has a list of datapoints with 40 components each, coordinate projection to two-dimensions simply ignores all but two of these components, which are then used to display the data in two-space. Details on how to use this method are in the **coordinate preferences** page.

## Principal Component Analysis (PCA)

**PCA** builds on coordinate projection by making use of the "principal axes" of the dataset. The principal axes of an object are the directions in space about which the object is most balanced or evenly spaced. PCA selects the two principal axes along which the dataset is the most spread out and projects the data onto these two axes.

## Sammon map

The **Sammon map** is an iterative technique for making interpoint distances in the low-dimensional projection as close as possible to the interpoint distances in the high-dimensional object. Two points close together in the high-dimensional space should appear close together in the projection, while two points far apart in the high dimensional space should appear far apart in the projection. By minimizing an error function between the high and low dimensional sets of interpoint distances, the Sammon map does its best to preserve these distances in the projection. This iterative procedure can be watched in the projection component window by loading a dataset and pressing the "play" button on the interface.

- Basic use: Before the Sammon Mapp is used, it is useful to already have some points added. So it helps to begin by just running the projector in default mode, using PCA. *Then* run the sammon map by pressing the play button  or (more safely), iterating with the step button . You should see the points move around, and the error in the status bar at the bottom should decrease over time.

- Finding the right step size. If you are not getting good results, *randomize*  the data points, then choose a different step size, and step again. If the step size is too small, the points will move very slowly when play is selected. If they step size is too large, the points will kind of start to "explode" (you'll know when you see it). Once you settle on a good step size press play.

## Nearest Neighbor Subspace (NNSubspace)

1. Takes each new point and determines the three points in the current data set that are closest to it.

2. Finds the projection of the new point into the two-dimensional subspace that contains the three nearest neighbors in the high-dimensional space.

3. Uses the three nearest neighbors and their corresponding points in the low dimensional dataset to find an affine map that approximates the full projection method (whichever one is currently being used).

4. Applies the affine map to the new datapoint.

## Triangulate

The Triangulate method takes each new point and determines which two points in the current data set are closest to it. Then, if possible, it will place the projected image of the new point so that its distance from the projected image of its two nearest neighbors is the same as it was in the high dimensional space. When it is not possible to project the point such that its distance to its two nearest neighbors is preserved, then the projected image of the new point will be placed on a line connecting the projected image of its two nearest neighbors. In this case the position of the projected image of the new point on this line is determined by the relative sizes of the distances between the new point and its two nearest neighbors in the current data set.