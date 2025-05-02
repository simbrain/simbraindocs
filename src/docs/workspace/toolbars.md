---
title: Toolbars
layout: default
parent: Workspace
has_children: false
nav_order: 60
---

# Toolbars

## Data Toolbar

The data toolbar allows the user to save or load the state of the workspace.

- **Open**: when clicked on will bring up a file chooser, allowing the user to load a saved workspace.
- **Save**: when clicked will bring up a file chooser allowing the user to save the current workspace.

## Global Network Update Toolbar

The global iteration toolbar holds options allowing the user to update all the networks in the workspace simultaneously.

- **Global step update algorithm**: One click will update every network in the workspace by one timestep.
- **Global iteration update algorithm**: One click will continue to updating every network in the workspace iteratively until clicked again. Note that the image on the button becomes that of a "stop" button Stop. Pressing this button will stop the network. Thus the play/stop button acts as a toggle switch.

## Coupling Toolbar

- **Coupling manager**: clicking this icon will bring up the coupling manager, allowing the user to send information between different objects in Simbrain. For more information see: [Couplings](couplings.html).

## Network, Statistic, and Training Toolbar

- The [Network](../network/index.html) creator: clicking this button will open a network window in the workspace. From the network window the user can construct any number of networks available within Simbrain.
- The [World](../worlds/index.html) button, when clicked displays a menu of the different kinds of worlds available in Simbrain. Worlds exist as a sort of virtual place where neural networks in Simbrain can both acquire input and in some cases effect their environment with their output.
- The statistics button brings up a list of statistical visuals, which can be coupled to various aspects of Simbrain's neural networks.
- The console button allows the user command line level access to Simbrain's features.

## Iteration Display

To the right of all toolbars is a display of the current iteration number.  It can be reset to zero by double clicking on it.
