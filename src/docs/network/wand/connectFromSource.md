---
title: Connect From Selection
layout: default
parent: Wand Tool
grand_parent: Networks
has_children: false
---

# Connect From Selection Action

Creates synapses from currently selected neurons to neurons touched by the wand. This provides a quick way to build specific connectivity patterns by painting connections.

The action uses a configurable [connection strategy](../../connections/) to determine which synapses to create and how to initialize their weights. Different strategies allow for different patterns of connectivity between the source neurons and the painted targets.

# Parameters

## Connection Strategy

The connection strategy determines which synapses to create and how to initialize their weights. Common strategies include:

- **All to All**: Creates connections from every source neuron to every touched neuron
- **One to One**: Pairs up source neurons with touched neurons in sequence
- **Sparse**: Creates connections probabilistically based on connection density
- **Fixed Degree**: Creates a fixed number of connections per source neuron

See the [connection strategies](../../connections/) documentation for more details on each type.

For [common properties](.#common-properties) like Letter and Color, see the main wand tool page.

# Using Connect From Selection

1. Select source neurons in the network (these will be the pre-synaptic neurons)
2. Press `1` to designate them as source neurons (they will turn red)
3. Select the Connect From Selection action in the wand palette
4. Activate wand mode if not already active
5. Paint over target neurons to create connections from source neurons to each touched neuron
6. Press `Esc` to clear source neuron designation when done

# Use Cases

## Fan-Out Patterns

Select a single source neuron and paint over multiple targets to create a fan-out connection pattern. All targets will receive connections from the source.

## Convergent Patterns

Select multiple source neurons and paint over a single target (or small group) to create convergent connections where many neurons project to a common target.

## Custom Weight Patterns

Use different connection strategies to create various weight initialization patterns. For example, use a sparse strategy with specific density, or configure an All to All strategy with custom weight distributions.