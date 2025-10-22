---
title: Restricted Boltzmann Machine
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 65
---

# Restricted Boltzmann Machine

A Restricted Boltzmann Machine (RBM) is an unsupervised learning model that can learn hidden representations of data. RBMs are a type of generative neural network that can model the probability distribution of input data and generate new samples similar to the training data. They consist of two layers: a visible layer (representing the input data) and a hidden layer (representing learned features), with connections only between layers (no connections within a layer).

RBMs are particularly useful for:
- Feature learning and dimensionality reduction
- Pre-training deep neural networks
- Generative modeling and pattern completion
- Data compression and denoising

The network uses a contrastive divergence algorithm for training, which alternates between positive and negative phases to adjust weights and biases.

<!-- TODO: Add image showing RBM structure -->

## Algorithm

The RBM implements a two-phase learning algorithm based on the energy function:

**Energy Function:**

$$
E = -\sum_i (v_i \cdot \text{bias}_{v_i}) - \sum_j (h_j \cdot \text{bias}_{h_j}) - \sum_i \sum_j (v_i \cdot w_{ij} \cdot h_j)
$$

where $$ v $$ are visible units, $$ h $$ are hidden units, and $$ w $$ are weights.

**Training Process:**

1. Positive Phase: Given visible data, compute hidden unit probabilities using sigmoid activation, then sample binary values from these probabilities.

2. Negative Phase: From the sampled hidden states, reconstruct the visible layer and then re-compute hidden states (this gives "reconstructed" or "negative" samples).

3. Weight Updates: Update weights and biases based on the difference between positive and negative phases:
   ```
   Δw = learning_rate * (positive_gradient - negative_gradient)
   ```

4. Sampling: Both visible and hidden units use stochastic binary sampling, where sigmoid outputs are treated as probabilities for setting units to 1 or 0.

## Training

RBMs implement the `UnsupervisedNetwork` interface and can be trained on datasets loaded into the network. The general process is covered in [Unsupervised Learning](../learning/unsupervisedLearning). Double-click the interaction box to open the training dialog.

RBMs use the contrastive divergence algorithm for training. The interaction box displays the current energy state of the network, which should generally decrease during training to indicate convergence.

## Creation / Editing

When creating an RBM, you specify:

- **Number of visible inputs**: The number of input neurons, corresponding to the dimensionality of your input data (e.g., 784 for 28x28 pixel images).

- **Number of hidden units neurons**: The number of hidden neurons that will learn feature representations. This is typically smaller than the visible layer for compression tasks or larger for feature extraction.

### Initial Data
By default, a random dataset is generated for initial training. You can replace this with your own data through the training interface.

## Network Structure

- Visible Layer: Input neurons arranged in a grid layout with sigmoid activation
- Hidden Layer: Feature neurons arranged in a grid layout with sigmoid activation  
- Weight Matrix: Fully connected weights between visible and hidden layers
- Biases: Both visible and hidden layers have bias terms that are learned during training
- Energy Display: Shows the current energy state of the network

## Properties and Parameters

- Grid Mode: Both layers are displayed in grid format for better visualization
- Bias Display: Bias values can be shown or hidden in the GUI
- Stochastic Sampling: Units use probabilistic binary activation rather than continuous values
- Randomization: Weights and biases can be randomized using network preferences
- Training Data: Supports loading custom datasets for training

## Usage Tips

- Start with a smaller hidden layer for basic feature extraction
- Monitor the energy function - it should generally decrease during training
- The network can be used for pattern completion by setting some visible units and letting the network fill in missing values
- For best results, normalize input data to the range [0,1]
- The stochastic nature means identical inputs may produce slightly different outputs

## Right Click Menu

Common right-click items are described on the [subnetwork](.) page.

- **Edit / Train RBM:** Opens the training dialog to edit and train the RBM.
- **Train On Current Pattern:** Train the RBM on the current visible layer activations.
- **Randomize:** Randomize weights, biases, and neuron activations.