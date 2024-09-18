---
title: Image World
layout: default
parent: Worlds
has_children: false
nav_order: 60
---

# Image World

ImageWorld is a tool designed for managing sets of images and using them
as inputs to other components, primarily neural networks. The interface
can be used to create and edit sets of images.

The component can be used to model visual processing, for example retinal
processing, or machine learning vision applications.

To get a quick sense of how image world works, try running the [simulations](../simulations) in `simulations > Image World`

# Image Album

The Image Album window is where images are loaded and processed with
filters. Any PNG format image can be used and the default image is
unfiltered, but filters, or sensor matrices, can be applied by selecting
from several built-in options or customizing one manually.

To load an Image, click on the `file` button on top of the toolbar and
click `Load Images..` Then select an image of the PNG format.

# Filters

Each image in an image album has a raw form that can be used by selecting `unfiltered`. However one or more filters can be added on "top" of the raw image and used to send data via couplings to networks.

To apply filters, select a built-in filter by clicking on the `Filter`
dropdown on top of the toolbar and select one of the pre-made sensor
matrices: Gray `150 x 150`, Color `100 x 100`, Threshold `10x10` and threshold
`250 x 250`.

A filter can be customized by clicking on the 'Add Filter' button
(represented by a '+' sign) by the 'Filter' dropdown on the toolbar. A
dialogue will appear allowing for edits to be made to the following
parameters:

Parameters:

- **Name**: A string label associated with the filter

- **Width**: Determines the width of the image filter in pixels

- **Height**: Determines the height of the image filter in pixels

- **Filter**: Determines the type of image filter, there are three
    options: Identity, Grey Scale, and Threshold
    - Identity: Does not change the image. Used when the image should be up or downsampled but not otherwise changed.
    - Gray Scale: Applies a filter in monochromatic shades from black
        to white
    - Threshold: Applies a filter in black and white without shading.
        The threshold minimum of 0.0 applies an all-white filter, and
        the maximum of 1.0 applies an all-black filter, therefore, a
        value of 0.5 is recommended.

Once a filter is applied, further edits can be made by clicking the
'Edit Filter' button by the 'Add Filter' button. You can refer back to
previous filters by searching for their name in the 'Filters' drop down
menu in the toolbar.

# Creating and Saving an Image

Instead of importing an image, you have the option to craft your own by
clicking and dragging your cursor to sketch out a desired image.

Once you are satisfied with your first image, click the camera icon
adjacent to the arrows to store the image.

You can either extend the existing image or start afresh by selecting
the 'clear canvas' option with the eraser tool. Remember to save each
image by clicking the camera icon after completion.

When prepared for the neural network to replicate your artwork, initiate
the process by pressing the 'play' button atop the SimBrain interface.
Navigate through your saved images using the left and right green arrows
located at the bottom of the canvas window.

# Image Processing

The neural network analyzes the shape within the image, identifying
features such as edges, contours and contrast.

Depending on its training, the neural network classifies the shape or
detects specific objects within the image.

As the neural network processes the image, the results are immediately
reflected in the interface of the 'inputs' and the process allowing
observation of the network\'s behavior dynamically.

# Menu Commands

- **File**: todo
- **Load Images**: todo
- **Save Current Image**: todo
- **Save All Images**: todo
- **Copy**: todo
- **Paste**: todo
- **Import from xml**: todo
- **Export to xml**: todo
- **Rename**: todo
- **Close**: todo
- **Edit**: todo
- **Reset Canvas**: todo
- **Create Filter Coupling**: todo
