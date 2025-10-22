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

Determines how training examples are presented and when weights are updated.

- **Stochastic**: Weights are updated after each randomly selected training example (see [stochastic gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent))
- **Epoch**: Weights are updated after processing all training examples in order
- **Batch**: Weights are updated after processing a fixed-size batch (see [mini-batch gradient descent](https://en.wikipedia.org/wiki/Stochastic_gradient_descent#Iterative_method))
  - **Batch Size**: Number of examples to process together (only visible when Batch is selected)

## Weight Initialization Strategy

Strategy for initializing network weights before training begins.

- **[Xavier](https://proceedings.mlr.press/v9/glorot10a.html)**: General purpose initialization, works well for sigmoid and tanh activations
- **[He](https://arxiv.org/abs/1502.01852)**: Designed for ReLU activation functions
- **LeCun**: Designed for SELU activation functions

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

