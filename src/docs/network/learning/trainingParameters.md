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

Training automatically stops when any of the enabled stopping conditions is met. Once training stops, you must press play again to resume.

Max iterations always applies and acts as an upper bound on training duration. Two optional stopping conditions can be enabled independently: error threshold stops training when the training error reaches a target value, while [early stopping](https://en.wikipedia.org/wiki/Early_stopping) prevents overfitting by monitoring test error. Early stopping tracks the best test error seen so far and counts consecutive test evaluations that fail to improve upon it. When test error improves by more than the minimum delta, the counter resets to zero. Each time the counter increments, the network is failing to improve and "trying our patience". When the counter reaches the patience value, training stops.

- **Max Iterations**: Maximum number of training iterations before stopping
- **Use Error Threshold**: When enabled, stops training when training error falls below the specified threshold
  - **Error Threshold**: Target error value (only visible when Use Error Threshold is checked)
- **Use Early Stopping**: When enabled, stops training when test error stops improving (requires test data to be available and test configuration to be enabled)
  - **Early Stopping Patience**: Number of consecutive test evaluations without improvement before stopping. For example, with patience set to 3, training continues as long as test error improves within any 3-evaluation window (only visible when Use Early Stopping is checked)
  - **Early Stopping Min Delta**: Minimum improvement in test error required to count as progress and reset the patience counter. For example, with min delta set to 0.01, the test error must decrease by at least 0.01 to reset the counter (only visible when Use Early Stopping is checked)

## Test Configuration

Settings for testing the network on validation data during training to monitor generalization.

- **Enabled**: When checked, the network is periodically tested on validation data during training
- **Test Frequency**: How often to test on validation data, measured in training iterations (only visible when Enabled is checked)

Note: The testing error signal in the error plot will not appear until the first test evaluation occurs. With the default test frequency of 10, the testing signal appears starting at iteration 10

## Compute Accuracy

When checked, calculates and displays classification accuracy for networks with [one-hot encoded](https://en.wikipedia.org/wiki/One-hot) targets.

Accuracy is computed per input pattern as follows: If all output neuron activations are within a threshold distance of their target activations, the pattern is counted as "correct." Accuracy is displayed as a percentage: (Number of Correct Patterns / Total Number of Patterns) × 100.

This threshold-based approach provides a practical measure of how well the network matches target patterns, accounting for small numerical variations that don't significantly impact functionality.

Note: If accuracy displays as "N/A", this indicates the target data is not properly one-hot encoded. Accuracy computation requires targets where each pattern has exactly one value of 1.0 and all other values are 0.0, representing a choice between multiple classes. This is appropriate for classification tasks but not for regression tasks where targets are continuous values.

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

