---
title: Wand Tool
layout: default
parent: Networks
has_children: true
nav_order: 15
---

# Wand Tool

The wand tool provides a way to interact with neural networks by painting activation patterns directly onto neurons and synapses. Think of it as a virtual electrode that lets you inject current into a network, or as a digital brush for sculpting neural activity patterns. It provides a fast, intuitive way to set up network states for testing, create training patterns, and dynamically influence running simulations.

# Activating the Wand

To activate wand mode:

1. Press the `d` key, or
2. Click the wand button in the toolbar (shows the current action's letter in a circle)

The cursor will change to a colored circle indicating the active wand action.

# Using the Wand

Once in wand mode:

1. Click and drag over neurons or synapses
2. All objects within the wand radius will be affected according to the selected action
3. The cursor color indicates which action is currently active

# Repeated "painting" with a wand

Each neuron or synapse is touched only once per click-and-drag to prevent network objects from being repeatedly updated.

Thus, if you want to apply the action again to the same objects, you need to release the mouse button and click again. Think of it like painting with a brush that marks each spot to avoid double-coating until you lift the brush.

# Wand Actions

The wand uses a palette of configurable actions. Each action defines what happens when you paint over network objects. See the individual action type pages for details on configuring each type.

## Cycling Through Actions

Press `d` repeatedly while in wand mode to cycle through available actions. The cursor color and the toolbar button letter change to reflect the current action.

## Common Properties

All wand actions share these properties:

- **Letter**: Single character displayed on the toolbar button when this action is selected. This provides quick visual identification of the active action.

- **Color**: Color of the wand cursor when this action is active. The cursor changes to this color to provide visual feedback about which action is currently in use.

- **Radius**: Radius of the wand effect in screen pixels. Each wand action has its own configurable radius. A larger radius affects more neurons at once, useful for painting broad patterns. A smaller radius provides precision for detailed work. The radius can be edited in the wand palette panel when configuring each action.

The cursor color automatically matches the selected action's color, and the cursor size reflects the configured radius.

# Managing the Wand Palette

## Opening the Palette

Click the dropdown arrow next to the wand toolbar button to open the palette panel. This shows all available actions with their colors and descriptions.

## Selecting an Action

Click on any action in the palette to make it active. The wand cursor color will update immediately.

## Adding Actions

1. Click the `+` button at the bottom of the palette
2. Choose the action type and configure its parameters in the dialog
3. Set the letter and color for the toolbar display
4. Click OK to add it to the palette

## Editing Actions

Double-click on an action in the palette, or click the kebab menu (three dots) to open the configuration dialog. You can modify all parameters including the action type itself.

## Deleting Actions

Click the `×` button on any action row to remove it from the palette. At least one action must remain.

## Importing and Exporting Palettes

Use the Import and Export buttons to save and load custom wand palettes as XML files. This lets you:
- Share palettes between projects
- Create specialized palettes for different tasks
- Backup custom configurations
