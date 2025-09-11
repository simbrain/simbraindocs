---
title: Undo/Redo Capabilities
layout: default
parent: Networks
has_children: false
nav_order: 95
---

# Undo/Redo Capabilities

Simbrain provides comprehensive undo/redo functionality for network operations, allowing you to reverse most network modifications and experiment freely without fear of losing work.

## Keyboard Shortcuts

- **Undo**: `Ctrl+Z` (Windows/Linux) or `Cmd+Z` (Mac)
- **Redo**: `Ctrl+Y` or `Ctrl+Shift+Z` (Windows/Linux) or `Cmd+Y` or `Cmd+Shift+Z` (Mac)

## What Can Be Undone

### Structural Changes
These operations create undoable actions:

- **Adding Elements**: Neurons, neuron groups, neuron collections, text objects
- **Deleting Elements**: All network models and their associated components
- **Connection Operations**: Creating synapses, weight matrices, synapse groups
- **Subnetwork Operations**: Adding supervised models, subnetworks
- **Layout Changes**: Moving, aligning, spacing network elements

### Specific Undoable Operations

**Neuron Operations**:
- Adding individual neurons
- Adding neuron groups with specified numbers of neurons
- Creating neuron collections from selected neurons
- Applying layouts to neuron sets

**Connection Operations**:
- Connecting neurons using any connection strategy
- Creating weight matrices between layers
- Creating synapse groups between neuron groups
- Manual connection creation

**Network Modifications**:
- Adding subnetworks (backprop networks, SOMs, etc.)
- Creating supervised models on-the-fly
- Adding text objects for annotations
- Moving and repositioning network elements

**Organization Operations**:
- Aligning selected elements horizontally or vertically
- Spacing elements evenly
- Nudging elements in small increments

## What Cannot Be Undone

### Property Changes
These operations do not create undoable actions:

- **Parameter Modifications**: Changing neuron update rules, synapse weights, network parameters
- **Activation Changes**: Setting neuron activations, clamping/unclamping neurons
- **Visual Properties**: Changing colors, visibility settings, display preferences
- **Training Operations**: Running training algorithms, updating weights through learning

### System Operations
- **File Operations**: Saving, loading, importing network files
- **Workspace Operations**: Creating or modifying couplings to other components
- **Preference Changes**: Modifying network preferences and global settings

## Undo/Redo Management

### Undo History Dialog

Access the undo history through the Edit menu to see:
- **Complete Action List**: All undoable actions in chronological order
- **Current Position**: Where you are in the undo/redo timeline
- **Jump to Point**: Go directly to any point in the action history

### Stack Behavior

The undo system uses a dual-stack approach:
- **Undo Stack**: Stores actions that can be undone
- **Redo Stack**: Stores actions that can be redone

When you perform a new action after undoing:
- The redo stack is cleared
- You cannot redo past the new action
- This prevents branching histories that could cause confusion

### Memory Management

- Undo actions store the minimum information needed to reverse operations
- Large operations may require significant memory for undo data
- The undo stack has practical limits to prevent memory issues

## Best Practices

### Experimental Workflow
1. **Save Before Major Changes**: Create save points before large modifications
2. **Use Undo Freely**: Experiment knowing you can easily reverse changes
3. **Check Undo History**: Use the history dialog to understand what can be undone

### Understanding Limitations
- **Parameter Tweaking**: Use copy/paste for parameter experiments since parameter changes aren't undoable
- **Training Experiments**: Save networks before training sessions since training isn't undoable
- **Complex Operations**: Break complex modifications into smaller undoable steps

## Implementation Details

The undo system tracks:
- **Network Model References**: What objects were created or deleted
- **Location Information**: Where objects were positioned
- **Relationship Data**: How objects were connected

Each undoable action contains:
- **Description**: Human-readable description of the operation
- **Undo Function**: Code to reverse the operation
- **Redo Function**: Code to re-apply the operation

This design ensures that structural network changes can be reliably reversed while maintaining network integrity.
