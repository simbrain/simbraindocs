---
title: Preferences
layout: default
grand_parent: Plots
parent: Projection Plot
has_children: false
nav_order: 40
---

# Preferences

Projection preferences are set in the `Edit>Preferences ...` menus and directly in the **toolbar**. Depending on which projection method is set, different preferences will appear for editing in the preference dialog.

## General Preferences

New datapoint tolerance: When datasets are initially loaded, or when data are added to an existing dataset we want to ignore repeated points. Even if a new point is not exactly the same as some other point in the set, it may be "close enough" to be considered the same point. This field allows one to set a tolerance level for deciding whether two points are the same. If "2" is specified in this field, for example, then any new point within a radius of 2 of some existing point will not be added to the dataset (where "radius" is Euclidean distance in the n-dimensional space determined by the **dimension** of the high dimensional data). Note that repeated points are allowed in the low-dimensional dataset; this field only applies to the high-dimensional data.

## Projector Preferences: Coordinate

First and second dimension (toolbar): control which dimensions of the high-dimensional data are projected to the horizontal and vertical axes of the display. The projection is immediately updated when these combo boxes are changed.

Automatically use most variant dimensions: If this is selected then the program selects the two most variant axes of the high dimensional dataset for coordinate projection. Note: to "find" the most variant dimensions again, you must re-select coordinate projection (just click on the combo-box but don't change the current selection). The most variant dimensions are decided upon when this method is initially selected, but are not dynamically updated as a simulation runs.

## Projector Preferences: Sammon

Step size (toolbar): How much the points should be incremented at each iteration of the Sammon map. The bigger the step size is the faster the projection algorithm will run but if the step size is too large the projected image will explode. One can generally experiment with different step sizes to get the right one. If iteration is progressing very slowly, one can just try something large, like 100, 300, or even 1000. If the dataset "explodes" (in which case everything in the display may contract to a point), press the randomize button to start over. Tip: A step size of a little less than 1 is good for objects with about a dozen points while a step size in the hundreds is good for objects with hundreds of points.