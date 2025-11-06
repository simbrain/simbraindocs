---
title: Training Parameters
layout: default
parent: Learning
grand_parent: Networks
has_children: false
nav_order: 15
---

# Training Parameters

This page provides a comprehensive reference for parameters used when training neural networks in Simbrain. These parameters apply to various trainable components including [supervised models](supervisedModels), [backprop networks](../subnetworks/backprop), and other supervised learning approaches.

## Loss Function

The error metric used during training:
- **SSE (Sum of Squared Errors)**: For regression tasks
- **MSE (Mean Squared Error)**: For regression tasks
- **[Cross Entropy](https://en.wikipedia.org/wiki/Cross-entropy)**: For classification tasks

## Optimizer

The optimization algorithm for updating weights during training.

### Momentum Optimizer

Uses learning rate and [momentum](https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Momentum) parameters.

- **Learning Rate**: Controls the step size for weight updates
- **Momentum**: Value between 0-1 that helps accelerate learning by considering previous weight updates

### Adam Optimizer

[Adaptive moment estimation](https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Adam) with adaptive learning rates.

- **Learning Rate**: Initial learning rate
- **Beta1**: Controls the exponential decay rate for first moment estimates
- **Beta2**: Controls the exponential decay rate for second moment estimates

### AdamW Optimizer

[Adam with decoupled weight decay](https://arxiv.org/abs/1711.05101) for better [regularization](https://en.wikipedia.org/wiki/Regularization_(mathematics)).

- **Learning Rate**: Initial learning rate
- **Beta1**: Controls the exponential decay rate for first moment estimates
- **Beta2**: Controls the exponential decay rate for second moment estimates
- **Weight Decay**: Regularization parameter that prevents overfitting
- **Learning Rate Decay**: Gradually reduces learning rate during training

## Update Type

Determines how training examples are presented and when weights are updated. The key distinction is between online methods (which apply weight updates immediately after each example) and batch methods (which accumulate gradients across multiple examples before updating weights).

- **Stochastic**: Randomly selects one training example, computes gradients, and immediately updates weights. This is an online method (see [stochastic gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent))
- **Sequential Online**: Processes all training examples in sequential order, updating weights immediately after each one. This online approach is required for temporal sequence learning (e.g., SRN networks) where the order of examples matters
- **Epoch**: Accumulates gradients from all training examples processed in order, then applies the accumulated weight update once. This batch method provides more stable gradients
- **Batch**: Accumulates gradients from a fixed-size randomly selected batch of examples, then applies the accumulated weight update. This batch method balances stability and computational efficiency (see [mini-batch gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Iterative_method))
  - **Batch Size**: Number of examples to process together before updating weights (only visible when Batch is selected)

## Weight Initialization Strategy

Strategy for initializing network weights before training begins. These strategies help ensure proper gradient flow during training and can significantly impact learning performance.

- **[Xavier](https://proceedings.mlr.press/v9/glorot10a.html)**: General purpose initialization, works well for sigmoid and tanh activations. Also known as Glorot initialization
- **[He](https://arxiv.org/abs/1502.01852)**: Designed for ReLU activation functions. Scales weights based on the number of input connections
- **LeCun**: Designed for SELU activation functions. Classic initialization method that scales weights based on the number of inputs

When training is initiated, the selected strategy automatically initializes all weight matrices in the network. You can also manually apply these strategies to individual weight matrices using the [weight matrix histogram dialog](../arraysMatrices#weight-matrix-histogram-dialog), which provides visual feedback and allows experimentation with different initialization approaches.

## Stopping Condition

Conditions that determine when training automatically stops.

- **Max Iterations**: Maximum number of training iterations before stopping
- **Use Error Threshold**: When enabled, stops training when error falls below the specified threshold
  - **Error Threshold**: Target error value (only visible when Use Error Threshold is checked)
- **Use [Early Stopping](https://en.wikipedia.org/wiki/Early_stopping)**: When enabled, stops training when test error stops improving (requires test data to be available)
  - **Early Stopping Patience**: Number of test evaluations to wait for improvement before stopping (only visible when Use Early Stopping is checked)
  - **Early Stopping Min Delta**: Minimum improvement required to reset patience counter (only visible when Use Early Stopping is checked)

## Test Configuration

Settings for testing the network on validation data during training to monitor generalization.

- **Enabled**: When checked, the network is periodically tested on validation data during training
- **Test Frequency**: How often to test on validation data, measured in training iterations (only visible when Enabled is checked)

## Compute Accuracy

When checked, calculates and displays classification accuracy for networks with [one-hot encoded](https://en.wikipedia.org/wiki/One-hot) targets.

Accuracy is computed per input pattern as follows: If all output neuron activations are within a threshold distance of their target activations, the pattern is counted as "correct." Accuracy is displayed as a percentage: (Number of Correct Patterns / Total Number of Patterns) × 100.

This threshold-based approach provides a practical measure of how well the network matches target patterns, accounting for small numerical variations that don't significantly impact functionality.

## Toolbar Actions

Common actions available in training interfaces:

- **Test**: Applies the current input row to the source neurons and propagates activations through the network, showing results in the target neurons without updating weights
- **Step**: Runs one iteration of the training algorithm
- **Play/Stop**: Starts or stops continuous training
- **Randomize**: Reinitializes network weights and biases using the selected weight initialization strategy

## Data Table Actions

The training and testing data tables support various operations for editing, analyzing, and visualizing training data. See [Tables](../../utilities/tables) for complete documentation of available operations, including:
- Import/Export CSV
- Randomization and filling
- Visualization tools (Box plots, Correlation/Matrix plots, PCA projections)
- Structural editing (add/remove rows and columns)

