---
title: Connect From Source
layout: default
parent: Wand Tool
grand_parent: Networks
has_children: false
---

# Connect From Source Action

Creates synapses from currently selected neurons to neurons touched by the wand. This provides a quick way to build specific connectivity patterns by painting connections.

# Parameters

## Weight

The strength value for newly created synapses.

## Only if no existing synapse

When checked, skips creating a synapse if one already exists from the source to the target neuron. This prevents duplicate connections and is typically left enabled.

## Letter

Single character displayed on the toolbar button when this action is selected.

## Color

Color of the wand cursor when this action is active.

# Using Connect From Source

1. Select source neurons in the network (these will be the pre-synaptic neurons)
2. Press `1` to designate them as source neurons (they will turn red)
3. Select the Connect From Source action in the wand palette
4. Activate wand mode if not already active
5. Paint over target neurons to create connections from all source neurons to each touched neuron
6. Press `Esc` to clear source neuron designation when done

# Use Cases

## Fan-Out Patterns

Select a single source neuron and paint over multiple targets to create a fan-out connection pattern. All targets will receive connections from the source.

## Convergent Patterns

Select multiple source neurons and paint over a single target (or small group) to create convergent connections where many neurons project to a common target.

