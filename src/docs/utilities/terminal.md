---
title: Terminal
layout: default
parent: Utilities
has_children: false
---

# Terminal

The Simbrain console can be used to test or debug simulations. It is an instance of a [beanshell](https://github.com/beanshell/beanshell) console that provides an interactive Java environment with access to Simbrain's workspace and components.

To add a Console to a workspace, use the console button in the toolbar. For a sense of some things you can do in the console enter `help();` or `tips();`.

## Features

The console is similar to a Unix or Mac terminal window. The syntax is Java, and you have direct access to the `workspace` and `desktop` variables, allowing you to manipulate simulations programmatically.

The console automatically imports several Simbrain packages for convenient access to network components, neuron and synapse update rules, layouts, connections, trainers, groups, and custom simulations.

The discussion of scripting is also useful, since scripts also use beanshell. The console allows beanshell to be used dynamically.

## File Menu

- **Import**: Load a saved console session
- **Export**: Save the current console session
- **Rename**: Rename the console window
- **Close**: Close the console window