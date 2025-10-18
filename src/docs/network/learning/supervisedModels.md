---
title: Supervised Models
layout: default
parent: Learning
grand_parent: Networks
has_children: false
nav_order: 20
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

# Network File Menu

The File menu (in the network file menu) contains several relevant commands.
- **Export Data to CSV**: Export the input and target data to a CSV file.
- **Import Data from CSV**: Import data from a CSV file.
- **Import Data from ARFF**: Import data from an ARFF file (Attribute-Relation File Format). Note that this only supports numeric attributes.

# Training 

When the play button is pressed in the training panel, the supervised model trains on the data in the table. That is, the input table rows are sequentially (or randomly, see randomize below) fed in as activations of the source neurons, the network is iterated a specified number of times (see iterations per pattern), activations in the target neurons are compared with values in the target table, and the network is updated using backpropagation.  The process is repeated for a number of training epochs (by default indefinitely), or until a stop condition is reached.

## Properties

The toolbar and properties of the training interface determine how training happens. See also [training](.).

- **Learning Rate**: The rate at which the network learns. Higher values mean faster learning but can lead to instability. See [Backprop](../subnetworks/backprop).

- **Momentum**: Helps accelerate learning by considering the previous weight update. Values typically range from 0 to 1.

- **Randomize**: If checked, training examples are presented in random order rather than sequentially.

- **Training Mode**: Determines how training examples are presented:
  - **Online**: Weights are updated after each training example
  - **Batch**: Weights are updated after all training examples have been presented

- **Iterations per pattern**: Number of times the network is iterated after an input pattern is applied and before backprop is applied. Useful for recurrent networks.

- **Num Epochs**: Specifies after how many epochs training should be stopped. Epochs refers to complete passes through the training set. This is useful for comparing networks, and replicability. If this is set to 0 the training will continue indefinitely or until stop conditions are met.

- **Stop Condition - SSE**: Stop training when the sum of squared errors falls below this value. If set to 0 this condition is ignored.

- **Stop Condition - MSE**: Stop training when the mean squared error falls below this value. If set to 0 this condition is ignored.

- **Stop Condition - Accuracy**: Stop training when the validation accuracy percentage reaches this value. If set to 0 this condition is ignored. See [accuracy](trainingNetworks#accuracy).

- **Validation Split**: Proportion of data to use for validation. When set, this fraction of data is held out and not used for training, but used to compute validation metrics.

- **Test**: Test button applies the current input row to the source neurons and propagates activations through the network, showing results in the target neurons without updating weights.

- **Step**: Run one iteration of the training algorithm.

