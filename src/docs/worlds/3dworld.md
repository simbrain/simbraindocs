---
title: 3D World
layout: default
parent: Worlds
nav_order: 56
---

# 3D World

`View3DSensor` provides a pseudo-3D first-person rendering of an OdorWorld scene from an agent-centered viewpoint. The approach uses classic [ray casting](https://en.wikipedia.org/wiki/Ray_casting) ideas associated with older ["2.5D" first-person graphics](https://en.wikipedia.org/wiki/2.5D). It is not a separate Simbrain world component. It is a sensor in [Odor World](odorworld) that exposes image-like outputs for coupling. The sensor also renders a configurable wall and sky and so it packs a 3d environment into a single sensor. Shown below is a sensor output showing the first-person image brightness values coupled to an [Image world](imageworld).

![3D View Sensor rendering example](/assets/images/threedsensor.png)


This approach allows for 3d simulations without a heavyweight 3d library, which is well-suited to the goals of Simbrain.This keeps experiments fast and practical for standard desktop machines while still supporting embodied visual tasks. The output can be configured as relatively small pixel arrays, then coupled directly to neural networks.


Conceptually, the sensor asks: if the camera were at this location, facing this heading, with this field of view, what would it see? It then uses [ray casting](https://en.wikipedia.org/wiki/Ray_casting) in the 2D world to estimate visible walls, floor, and sprites and reconstruct a first-person image from that point of view. Internally this is rendered as a [buffered image](https://docs.oracle.com/javase/8/docs/api/java/awt/image/BufferedImage.html) with [RGBA channels](https://en.wikipedia.org/wiki/RGBA_color_model).

To get a feel for how this works, try the 3d sims in `Simulations > Vision'.

## Sensor Parameters

The 3D sensor exposes these user-editable parameters in the sensor dialog:

- **Field of View:** Horizontal field of view in degrees
- **View Distance:** Maximum render distance in pixels
- **Width:** Output image width in pixels
- **Height:** Output image height in pixels
- **Horizon Position:** Vertical horizon location in the rendered image
- **Camera Height:** Camera height above ground
- **Wall Height:** Height of boundary walls relative to camera height
- **Billboard Sprites:** If enabled, sprites always face the camera
- **Sky Color:** Color of the sky or ceiling region
- **Wall Color:** Base color used for boundary walls

It also supports the common relative-location sensor properties from OdorWorld:

- **Label:** Shows up in the coupling menu and can be used to identify the sensor
- **Sensor Angle:** Determines the angle from the agent's center of perspective at which the sensor is placed
- **Sensor Length:** Determines the distance from the agent's center to the sensor location

## Coupling Outputs

`View3DSensor` can produce:

- **Brightness** (default visible producer): Per-pixel grayscale intensity computed from the rendered image
- **Red:** Per-pixel red channel values from the rendered image
- **Green:** Per-pixel green channel values from the rendered image
- **Blue:** Per-pixel blue channel values from the rendered image

Each output is a flattened array of size `Width * Height`. 

For grid-style neuron arrays or collections, dimensions should match the sensor output shape to get reasonable output. For example, a `10 x 10` sensor output (`Width=10`, `Height=10`) should be coupled to a `100`-neuron square array.
