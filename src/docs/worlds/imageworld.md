---
title: Image World
layout: default
parent: Worlds
has_children: false
nav_order: 60
---

# Image World

ImageWorld is a tool designed for managing sets of images and using them as inputs to other components, primarily neural networks. The interface can be used to display, create, and edit sets of images that are sent to networks.

The component can be used to model visual processing, for example retinal processing, or machine learning vision applications.

To get a quick sense of how image world works, try running the [simulations](../simulations) in `simulations > Image World`

# Filters and Couplings

Each image in an image album has a raw form that can be used by selecting `unfiltered`. One or more filters is be added on "top" of the raw image. These filters are used to upsample or downsample the image to a specific resolution, and sometimes to convert them to grayscale or color. These filters "pixellate" the image at a specific resolution and in a specific way. They are named in a way that indicates what they do, e.g. `Gray 150 x 150`, `Color 100 x 100`, or `Threshold 10x10`. This image gives a sense of how it works:

<img src="/assets/images/imageWorldFilters.png" alt="Filters" style="width:300px;"/>

The purpose of these filters is to allow the image to [coupled](../workspace/couplings) to a [neuron array](../network/arrasMatrices) or [neuron group or collection](../network/neurongroups) with the appropriate number of neurons.

The filter drop down box can be used to view one of the filters and see its impact on the raw image, or to view the unfiltered image. Regardless of which filter you view, all remain in place, and thus one image can be coupled to a network in multiple ways.

## Editing and adding filters

To edit an existing filter (several are provided by default), select a built-in filter by clicking on the `Filter` dropdown on top of the toolbar and select one. To add one click on the `Add Filter` button, represented by a `+`` sign.

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




# Image Album and Image Editing

Instead of importing an image, you have the option to craft your own by clicking and dragging your cursor to sketch out a desired image. Once you are satisfied with your first image, click the camera icon adjacent to the arrows to store the image.

You can either extend the existing image or start afresh by selecting the 'clear canvas' option with the eraser tool. Remember to save each image by clicking the camera icon after completion.

The Image Album window is where images are loaded and processed with filters. Any PNG format image can be used and the default image is unfiltered, but filters, or sensor matrices, can be applied by selecting from several built-in options or customizing one manually.

To load an Image, click on the `file` button on top of the toolbar and click `Load Images..` Then select an image of the PNG format.

Images can be loaded or also edited directly, using the simple draw interface. This can be done live while the [worksace](../workspace) runs. 

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
