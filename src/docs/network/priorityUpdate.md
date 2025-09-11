---
title: Priority Update
layout: default
parent: Networks
has_children: false
nav_order: 190
---

# Priority Update

Priority update allows you to control the order in which network models are updated during each iteration. Unlike buffered update, which accumulates inputs first and then updates all models, priority update processes models one at a time in a specific order, allowing for more precise control over network dynamics.

## How Priority Update Works

Priority update follows this algorithm:
```kotlin
for model in prioritySortedNetworkModels:
    model.accumulateInputs()
    model.update()
```

This means each model:
1. **Accumulates its inputs** from other models
2. **Updates immediately** based on those inputs
3. **Makes its new state available** to models that update later

## Setting Priorities

### Individual Neuron Priorities

Each neuron has a **Priority** property that determines its update order:

- **Lower numbers = Higher priority** (updated first)
- **Default priority = 0** for all neurons
- **Priority can be set** in the neuron properties dialog

### Viewing and Managing Priorities

**View Priority Table:**
1. Go to **Network > Show Priority Table** (or use the menu)
2. The dialog shows all network models with their current priorities
3. **Edit priorities** by clicking in the priority column
4. **Sort by priority** to see the update order

**Show Priorities in Network:**
1. Go to **View > Show Neuron Priorities**
2. Priority numbers appear next to each neuron
3. **Toggle off** when not needed to reduce visual clutter

## When to Use Priority Update

Priority update is useful when you need:

- **Sequential processing**: One layer must complete before the next begins
- **Feed-forward behavior**: Information flows in one direction through layers
- **Deterministic order**: Specific update sequence is critical
- **Real-time simulation**: Immediate propagation of changes

### Example: Feed-Forward Network

In a feed-forward network:
1. **Input layer** (priority 0) updates first
2. **Hidden layer** (priority 1) updates second  
3. **Output layer** (priority 2) updates last

This ensures information flows from input to output in a single iteration.

## Setting Up Priority Update

### Step 1: Remove Buffered Update

1. Go to **File > Edit Update Sequence**
2. **Remove** the "Buffered update" action
3. **Add** "Priority update" action

### Step 2: Set Neuron Priorities

1. **Select neurons** in each layer
2. **Press `Cmd/Ctrl+E`** to open properties
3. **Set Priority** for each layer (0, 1, 2, etc.)
4. **Apply changes**

### Step 3: Add Manual Updates

Since priority update only handles neurons, you may need to add manual updates for:
- **Synapse groups**
- **Weight matrices** 
- **Other network components**

Add these as separate actions in the update sequence.

## Priority Update Dialog

The priority update dialog provides a table view of all network models:

**Columns:**
- **Display Name**: Name of the network model
- **Priority**: Current priority value (editable)

**Features:**
- **Edit priorities** by clicking in the priority column
- **Sort by priority** to see update order
- **Auto-save** changes when dialog closes
- **Validation** prevents invalid priority values

## Troubleshooting

**Priority update not working:**
- Ensure "Priority update" is in the update sequence
- Remove "Buffered update" from the sequence
- Check that neurons have different priorities

**Unexpected behavior:**
- Verify priority values are set correctly
- Check that all necessary components are being updated
- Consider if buffered update might be more appropriate

**Performance issues:**
- Priority update can be slower for large networks
- Consider using subnetworks for complex priority schemes
- Monitor simulation speed with different priority settings

## Advanced Usage

### Custom Priority Schemes

You can create complex priority schemes:
- **Input processing**: Priority 0-9
- **Hidden layers**: Priority 10-19  
- **Output generation**: Priority 20-29
- **Learning updates**: Priority 30-39

### Integration with Subnetworks

Subnetworks can have their own internal priority schemes:
- **Feed-forward subnetworks** use priority update internally
- **Hopfield networks** can use sequential or random priority
- **Custom subnetworks** can implement their own update logic

### Scripting Priority Updates

Priority updates can be controlled via scripts:
```kotlin
// Set priority for a group of neurons
selectedNeurons.forEach { it.priority = 1 }

// Add priority update to sequence
workspace.addUpdateAction(PriorityUpdate(network))
```
