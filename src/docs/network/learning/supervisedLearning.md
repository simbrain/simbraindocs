---
title: Supervised Learning
layout: default
parent: Learning
grand_parent: Networks
has_children: false
nav_order: 10
---

# Supervised Learning

Supervised learning involves training networks using input and output data pairs. An input vector is fed into a network and compared with the output vector that results. The errors that occur are propagated backwards through the network, updating the weights using algorithms like [backpropagation](https://en.wikipedia.org/wiki/Backpropagation).

## Training Interface

Most supervised learning in Simbrain is handled through a training dialog with a common structure:

<img src="/assets/images/trainingDialog.png" style="width:500px;"/>

The dialog contains three main areas:

1. **Training controls and parameters** at the top for configuring the training algorithm. See [Training Parameters](trainingParameters) for details on loss functions, optimizers, stopping conditions, and other settings.

2. **Training and testing tabs** in the middle showing progress:
   - **Training tab**: Displays training progress including current iteration, error/loss values, and accuracy (if enabled)
   - **Testing tab**: When test data is provided, displays validation metrics to monitor generalization performance

3. **Data tables** at the bottom showing the training data, which can be edited and analyzed using Simbrain [data tables](/docs/utilities/tables)

A play button initiates training, which continues until a stopping condition is reached or training is manually stopped.

This dialog appears when training various types of [subnetwork](../subnetworks/) or when using [supervised models](supervisedModels) created on the fly.

## Supervised Learning Methods

In Simbrain, the main approaches for supervised learning are:

- [Supervised Models](supervisedModels): A flexible framework for training arbitrary collections of neuron arrays and groups connected by weight matrices or synapse groups
- [Backprop Networks](../subnetworks/backprop): Traditional feedforward networks trained with backpropagation
- [Classifiers](../subnetworks/classifier): Trained in one go rather than iteratively

## Training Data

[Training set data](https://en.wikipedia.org/wiki/Training,_validation,_and_test_data_sets) is displayed in two tables:

1. **Input data** (also called sample or test data): Patterns fed into the network
2. **Target data** (also called labels or desired values): The outputs the network should produce

The training dataset should contain examples of all patterns you want the network to learn. For example, if you are building a classifier for different types of fruit images, you need many images of each type of fruit in the dataset.

Columns correspond to neurons and rows correspond to training examples. If a network has 3 input nodes and 2 output nodes, then the input table will have three columns and the target table will have 2 columns. The input and target tables must have the same number of rows, and each input/target row pair is a single training example.

Each row of the input data table is an input vector, and the corresponding row of the target data table is the desired output vector that should be produced for that input if training is successful.

The training data is viewed in a [table](../../utilities/tables), which provides operations for editing, analyzing, and visualizing training data.

