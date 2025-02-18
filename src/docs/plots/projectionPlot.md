---
title: Projection Plot
layout: default
parent: Plots
has_children: false
nav_order: 10
---

# Projection Plots

The projection component is derived from a program called [HiSee](https://hisee.sourceforge.net/). HiSee is a high dimensional visualizer, it let's you "see" "hi"-dimensional data. It is basically a visual way of performing **dimensionality reduction** using a few techniques, primarily **pca** and **Sammon Maps**. It can be used to represent any high dimensional data, but in Simbrain it is primarily used to study the dynamics of a neural network.

The projection component can take all the states (patterns of activation) that occur for the network, which exist in a high dimensional space, and project them down into two dimensions so that many of their geometric and topological properties are preserved. This gives users of Simbrain a way to visualize the dynamics of the network.
The process of adding a new point without having to re-run the entire dimensionality reduction algorithm is called incremental dimensionality reduction or online dimensionality reduction.

This approach is often used when dealing with large datasets that are constantly growing, where re-running the entire dimensionality reduction algorithm each time a new point is added would be computationally expensive and time-consuming. Instead, incremental dimensionality reduction algorithms update the projection of the existing points based on the new point, and can be more efficient than re-running the entire algorithm.
Some popular incremental dimensionality reduction techniques include incremental PCA (Principal Component Analysis) and online t-SNE (t-Distributed Stochastic Neighbor Embedding).

## Getting started

To get a feel for how projection components work, invoke the script `Simbrain Menu > Scripts > highDimensionalProjection.bsh`. Run the network, and periodically randomize network activations by clicking in the network window, and pressing "N" and "R". This will give you a sense of how the projection component works. Each new state of the network is a separate dot in the component, and the red dot is the current state.

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


## GPT


## Component Panel

- **Add**: Add a time series to the plot.
- **Remove**: Remove a time series from the plot.
- **Clear Graph Data**: Clears all data from the plot.
- **Show Graph Properties**: Opens up properties menu for the plot.

## Example

The projection component shown here begins with no datapoints, and then plots 54 points in a **limit cycle**, that occur in a network with 5 neurons. The network is in a kind of oscillatory state where it repeatedly visits the same 54 states in sequence. This dynamical pattern is directly visible in the projection, which shows a 2-dimensional projection of the 5 dimensional space. The example shows a case where the data have been removed (with the "eraser" button) and the simulation re-run, so that we can watch the limit cycle initially take form, and then watch the system cycle through that structure once. Each dot corresponds to one state of that network, where the red dot is current state, and the green dots are previous states (colors can be changed in the **datapoint coloring** dialog). Points that are close to each other in the projection component correspond to patterns of activity that are similar.

<!-- TODO --> Add GIF

## Choosing a projection method

Dimensionality reduction is a large, complex field. Numerous techniques exist for projecting high dimensional data to lower dimensional spaces that can be visualized. To get a feel for what a high dimensional object looks like, the user can choose different methods of visualizing it. Each will introduce its own distortions (there is no way to look directly at an object in more than 3 dimensions), but by using multiple methods intuition about that object can be gained.

The projection method is chosen in the main combo box, in the upper right of the component (it is set to PCA in the image above). Projection methods available in Simbrain are documented on the **projection methods** page. Different projection methods are used in different ways. PCA and Coordinate are fairly straightforward; just select those options and the data will immediately be projected. However, Sammon requires that an appropriate step size be set and that it be iterated. Triangulation and NN Subspace require that some points have already been added to the projection component, which are used to determine how subsequent points are plotted. If one of these is chosen and there are not sufficiently many points already in the plot, the warning icon warning icon will bes shown.

## Setting up a new projection

When a projection component is first opened, and it has not been **coupled** to another component (usually a network), there are no dots, since no states have been sent to the projection component yet. An easy way to start is to set this up is to plot the states of a neuron group. Right click on a neuron group interaction box, and choose `Send vector coupling to > Projection > Set Point`.

Now, with each update of the workspace, state information is sent to the projection component. Each new state is displayed as a red dot. The set of dots that appear in the projection component window represent the states that have been visited by the associated network since it was first coupled to the projection component. This is a kind of picture of the history of a network's activity. As the network is updated the user can watch new dots appear as new states arise. In some cases there are no new states, and the network just repeatedly visits states it has visited before.

When Simbrain is running users can add one or more projection component windows, each of which projects some subset of the network's state variables to two dimensions. This allows users to independently study different aspects of the network component. For example, one projection component might represent the activity at the input nodes of a network, another might represent activity at the hidden nodes, another might represent the aggregate activity of the entire network, and another might represent the changing values of the network's weights as it learns.

## Couplings

Data is fed to a projection component using **couplings**. The image here uses the graphical notation set up on the couplings page.

Vector couplings attach to a "set point" consumer that sets all 6 values of the projection consumer. This is the most natural way to set up a projection component. Typically this is done by coupling from a neuron group (see **this page**). When a vector coupling to a projection is created, the dimensionality of the projection component is reset automatically (though this is currently not reflected in the GUI until after the next workspace update)

Scalar couplings attach to a single "dimension" consumer. In this mode, the number of dimensions the projection accepts must be manually set using the `set dimensions` menu item. At each update, the "input vector" begins as a zero-vector and then the vector is filled with values from any dimension consumers that receive data

<!-- TODO --> Add image

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


# MENUS

## File

- **Open**: Opens plot component files as .xml not only with underlying data, but all associated preferences and information.
- **Save/Save As**: Saves projection components using the xml style encoding. The xml files stores plot data as well as related preferences and information.
- **Export / Import**:Exports or imports the data as human-readable .csv (comma separated values) files. High dimensional data can be imported, which is the main way of using the projection component as a free-standing tool to analyze existing data. The high or low dimensional data can also be exported to .csv for viewing or analysis in other programs, like R or Matlab.

## Edit

- **Preferences**: Opens the **preferences** dialog.
- **Set dimensions**: Set the dimensions of the underlying data. Note that dimension are automatically reset when a vector coupling is connected to the component.
- **Datapoint Coloring**: Adjusts the colors for the data points. See **datapoint coloring** for more information.

# Toolbar and Dialog Elements

- **Status Bar**:    The status bar shows the current dimensionality of the high dimensional data, the current number of data points, and for the **Sammon** method, the current error.
- **Projection Selector**:   This drop down box allows you to select which **projection method** to use on the data.
- **Iterate Indefinitely**:  Pressing this button will cause the program to iterate the algorithm an indefinite number of steps until the Stop button, , is pressed. Only **Sammon maps** uses this and related buttons.
- **Stop Iteration**:    Pressing this button will cause the program to stop iterating the algorithm.
- **Iterate One Step**:  Pressing this button will cause the projection algorithm to iterate once.
- **Erase data**:    This button clears both the high dimensional data set and low dimensional data set from the program.
- **Randomize data**:    This button randomizes the points in the low dimensional set. Useful for bumping the Sammon map out of local minima, and for exploring different possible projections of a given dataset under the Sammon map.
- **Warning Label**: This symbol warns the user that the current method works best when more datapoints are already added.
- **Step Size**: This field scales the amount points are moved on each iteration. Note this item is only displayed if the **Sammon map** is selected.
- **First and Second Dimension**:    This field controls which dimensions of the high-dimensional data are projected to the horizontal and vertical axes of the display. Note this item is only displayed if Coordinate Projection is selected. For more info see the discussion at **coordinate preferences**.


## Right-Click Menu

- The context menu is a **[JFreeChart menu](./#jfreechart-right-click-menu)**.

# Preferences

Projection preferences are set in the `Edit>Preferences ...` menus and directly in the **toolbar**. Depending on which projection method is set, different preferences will appear for editing in the preference dialog.

## General Preferences

New datapoint tolerance: When datasets are initially loaded, or when data are added to an existing dataset we want to ignore repeated points. Even if a new point is not exactly the same as some other point in the set, it may be "close enough" to be considered the same point. This field allows one to set a tolerance level for deciding whether two points are the same. If "2" is specified in this field, for example, then any new point within a radius of 2 of some existing point will not be added to the dataset (where "radius" is Euclidean distance in the n-dimensional space determined by the **dimension** of the high dimensional data). Note that repeated points are allowed in the low-dimensional dataset; this field only applies to the high-dimensional data.

## Projector Preferences: Coordinate

First and second dimension (toolbar): control which dimensions of the high-dimensional data are projected to the horizontal and vertical axes of the display. The projection is immediately updated when these combo boxes are changed.

Automatically use most variant dimensions: If this is selected then the program selects the two most variant axes of the high dimensional dataset for coordinate projection. Note: to "find" the most variant dimensions again, you must re-select coordinate projection (just click on the combo-box but don't change the current selection). The most variant dimensions are decided upon when this method is initially selected, but are not dynamically updated as a simulation runs.

## Projector Preferences: Sammon

Step size (toolbar): How much the points should be incremented at each iteration of the Sammon map. The bigger the step size is the faster the projection algorithm will run but if the step size is too large the projected image will explode. One can generally experiment with different step sizes to get the right one. If iteration is progressing very slowly, one can just try something large, like 100, 300, or even 1000. If the dataset "explodes" (in which case everything in the display may contract to a point), press the randomize button to start over. Tip: A step size of a little less than 1 is good for objects with about a dozen points while a step size in the hundreds is good for objects with hundreds of points.



