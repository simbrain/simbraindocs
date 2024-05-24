---
title: Preferences
layout: default
parent: Workspace
has_children: false
nav_order: 40
---

# SIMBRAIN PREFERENCES

There are several ways to set overall Simbrain preferences. A few things can be set in the GUI, and others can be set in a configuration file.

## GUI Preferences

Simulation Delay: use this to slow down a simulation, by specifying a number of milliseconds to sleep between workspace iterations.  The default is 0, so that the workspace runs at its maximum speed.

## Configuration file

The text file {SimbrainHome}/etc/config.properties contains a variety of properties can be set. Most are self-explanatory. Simply change these using a text editor and restart Simbrain.

## Local Preferences

Other properties are automatically set in local **preferences** files. For example, the various graphical preferences for networks (background color, "hot" node color, etc.). Most of these preferences can be reverted using "revert to defaults" in relevant dialogs.