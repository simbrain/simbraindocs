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

When the play button is pressed in the training panel, the supervised model trains on the data in the table. The input table rows are fed in as activations of the source neurons (sequentially or randomly depending on the Update type setting), the network is iterated to compute outputs, activations in the target neurons are compared with values in the target table, and the network weights are updated using [backpropagation](https://en.wikipedia.org/wiki/Backpropagation). The process continues until a stopping condition is reached or training is manually stopped.

## Properties

The toolbar and properties of the training interface determine how training happens. See also [training](.).

- **Loss Function**: The error metric used during training. Options include SSE (sum of squared errors) for regression, MSE (mean squared error) for regression, and [Cross Entropy](https://en.wikipedia.org/wiki/Cross-entropy) for classification tasks.

- **Optimizer**: The optimization algorithm for updating weights. Available optimizers:
  - **Momentum Optimizer**: Uses learning rate and [momentum](https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Momentum) parameters. Momentum (0-1) helps accelerate learning by considering previous weight updates.
  - **[Adam](https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Adam) Optimizer**: Adaptive moment estimation with learning rate, Beta1, and Beta2 parameters for controlling moment estimates.
  - **[AdamW](https://arxiv.org/abs/1711.05101) Optimizer**: Adam with decoupled weight decay, adding Weight Decay and Learning Rate Decay parameters for better [regularization](https://en.wikipedia.org/wiki/Regularization_(mathematics)).

- **Update type**: Determines how training examples are presented:
  - **Stochastic**: Weights are updated after each randomly selected training example (see [stochastic gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent)).
  - **Epoch**: Weights are updated after processing all training examples in order.
  - **Batch**: Weights are updated after processing a fixed-size batch (see [mini-batch gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Iterative_method)). The Batch size parameter specifies how many examples to process together.

- **Weight Initialization Strategy**: Strategy for initializing network weights before training. Options include [Xavier](https://proceedings.mlr.press/v9/glorot10a.html) (general use), [He](https://arxiv.org/abs/1502.01852) (for ReLU networks), and LeCun (for SELU networks).

- **Stopping Condition**: Conditions for automatically stopping training:
  - **Max Iterations**: Maximum number of training iterations before stopping.
  - **Use Error Threshold**: When enabled, stops training when error falls below the specified Error Threshold value.
  - **Use [Early Stopping](https://en.wikipedia.org/wiki/Early_stopping)**: When enabled, stops training when test error stops improving. Requires test data to be available.
    - **Early Stopping Patience**: Number of test evaluations to wait for improvement before stopping (only visible when Use Early Stopping is checked).
    - **Early Stopping Min Delta**: Minimum improvement required to reset patience counter (only visible when Use Early Stopping is checked).

- **Test Configuration**: Settings for testing during training:
  - **Enabled**: When checked, the network is tested on validation data during training to monitor generalization.
  - **Test Frequency**: How often to test on validation data, in training iterations (only visible when Enabled is checked).

- **Compute Accuracy**: When checked, calculates and displays classification accuracy for networks with [one-hot encoded](https://en.wikipedia.org/wiki/One-hot) targets. See [accuracy](trainingNetworks#accuracy).

## Toolbar Actions

- **Test**: Applies the current input row to the source neurons and propagates activations through the network, showing results in the target neurons without updating weights.

- **Step**: Runs one iteration of the training algorithm.

- **Play/Stop**: Starts or stops continuous training.

- **Randomize**: Reinitializes network weights and biases using the selected weight initialization strategy.

