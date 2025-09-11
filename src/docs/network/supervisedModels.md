---
title: Supervised Models
layout: default
parent: Networks
has_children: false
nav_order: 105
---

# Supervised Models

An innovative feature in Simbrain 4, the ability to train arbitrary collections of neuron arrays, collections, or groups linked via weight matrices or synapse groups. 

<img src="/assets/images/supervisedModel.png" style="width:300px;"/>

Using the source-target format, a source set of neurons is connected to a target set of neurons and using `ctrl/command-M` a supervised model is added and it can be trained on the fly. The neurons must be connected by weight matrices of synapse groups. Note: All paths backwards are automatically computed and multiple paths including skip connections can be trained in this way.

The model transiently wraps around a set of objects using a source and target neuron array, collection, or group (which  must be conneted by intervening weight matrices or synapse groups), and can be used to train them.  Finds the shortest path between source (Red selection) and target (green selection) and sets up backprop between them. 

# How to create a supervised model

1. Create two neuron groups, neuron arrays, or neuron collections (henceforth "neurons")
2. Connect them using 1-2 or 1-3
3. Select the input neurons interaction box and click `1`
4. Select the target neurons interaction box and right click and select `create supervised model`
5. A box should appear showing the model

# Apply Immediate Learning

Supervised models support "immediate learning", where you simply make the model, press `L`, and the network learns by one increment, treating the current activations of the source and target as a single training examples. You can watch things happen in real time. Repeatedly press to implement learning.

# Path Finding Algorithm

Supervised models automatically find the shortest path between source and target layers using a breadth-first search algorithm. The `computeOrderedUpdatePath` function:

- Starts from the target layer and works backward to find all connected source layers
- Creates an ordered set of layers for proper forward pass execution
- Supports skip connections and multiple paths between source and target
- Handles both weight matrices and synapse groups as connection types

The algorithm ensures that layers are processed in the correct dependency order during training, allowing for complex network architectures with multiple pathways.

# Training Workflow

## Creating Training Data

When a supervised model is created, it automatically generates initial training data. For most layers, this creates a simple binary dataset. For activation sequences, the data is flattened to handle temporal patterns.

## Forward Pass

During training, the model performs a forward pass through all layers in the computed order:

- Input layers receive activation values from training data
- Each subsequent layer processes inputs from previous layers
- Skip connections are properly handled
- Final outputs are compared to target values

## Backpropagation

The model uses standard backpropagation to compute gradients:

- Loss is computed using the configured loss function (SSE, MSE, RMSE, or Cross-Entropy)
- Gradients flow backward through the ordered layer path
- Weight matrices and synapse groups are updated using the specified optimizer
- Both weights and biases are updated during training

## Training Configuration

Supervised models inherit training configuration from `SupervisedTrainerConfig`:

- **Loss Functions**: SSE (default), MSE, RMSE, Cross-Entropy (for softmax outputs)
- **Optimizers**: Various optimization algorithms for weight updates
- **Weight Initialization**: Strategy for initializing network weights
- **Test Configuration**: Optional testing on held-out data

# Compatible Components

Supervised models work with these Simbrain components:

- **Neuron Arrays**: Standard matrix-based neuron collections
- **Neuron Groups**: Individual neuron collections
- **Neuron Collections**: Abstract neuron collections
- **Weight Matrices**: Matrix-based connections between layers
- **Synapse Groups**: Individual synapse collections

The model automatically detects the connection types and sets up appropriate training pathways.
