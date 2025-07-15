---
title: Neuron Arrays and Weight Matrices
layout: default
parent: Networks
has_children: false
nav_order: 80
---

# Neuron Arrays and Weight Matrices

Simbrain originated as a way to focus intuition on loose or "free"-standing neurons and their connections, which model neuroscience or else show how the connection to neuroscence works in an intuitive way.  However most neural networks software use vectors and matrices to represent neural networks, which make computations far more efficient. 

In Simbrain 4 array-based approaches have been incorporated (using [Smile matrix](https://haifengl.github.io/linear-algebra.html) objects), and are integrated in such a way that they can be used alongside all the existing machinery, using similar GUI visualizations.

<img src="/assets/images/neuronArrayWeightMatrix.png" alt="Neuron array and weight matrix" style="width:400px;"/>

## Neuron Arrays
 
These are represenations of arrays of neurons. They are column vectors in the underlying code. They can be represented as a line or grid by using a toggle button. They are updated using the same [update logic](updateLogic.html) as with free neurons. In fact the rule objects are shared.

## Weight matrices

These are represenations of weights. They can be updated using shared local learning rules. They are shadowed by a matrix of post synaptic responses to allow for for spiking rules in a matrix setting. Right click context menu allows common operations.

## Creating Arrays and Matrices

An array can be inserted into a Network Window through two methods:

1) Insert > "Add Neuron Array"
2) Pressing the Keyboard shortcut "Y"

Weight Matrices can be added by connecting any two neuron arrays or neuron groups. The simplest way to connect two objects is using the [1-2 trick](./buildingBasics.html#source-and-target-objects). 

## PSR Matrix

In a typical connnectionist network, the weight matrix is matrix multiplied by a vector "input" to produce a vector "output" (batch computations can also be done but that is covered elsewhere). However, to account for spike responses, this matrix product is factored into two parts in Simbrain. (1) The input vector is elementwise (Hadamard) multiplied by each row of the matrix. This is the PSR Matrix. Each row of the matrix is like a post-synaptic response along the various points on a dendrite. Then later (2) the row sums of the PSR matrix can be taken, which is equivalent to the traditional matrix-vector multiplication.  However, the PSR Matrix can also be updated using spike responders.

<!-- TODO: Picture. Show many to one case, where it's clear the results must first be multiplied then summed -->

## Neuron Array Right Click Menu

**Cut:** Cut selected neurons, (connected) synapses, and neuron groups 
**Copy:** Copy selected neurons, (connected) synapses, and neuron groups 
**Paste:** Paste copied neurons, (connected) synapses, and neuron groups 
**Duplicate:** Duplicate selected neurons, (connected) synapses, and neuron groups 
**Edit:**
**Delete:** Delete selected node(s)
**Connect Selected Objects...:** Creates synapse, weight matrix, etc. between selected source and target entities
**Toggle Line / Grid:** Toggle line / grid style
**Toggle Horizontal / Vertical Layout:** Toggle horizontal / vertical layout
**Toggle Circle Mode:** Toggle activation rendering mode between circle and image
**Toggle Bias Visibility:** Toggle whether biases are visible
**Create Supervised Model:** Create supervised model with using the current activation as target for immediate training
**Input Data...:** Opens a dialog that can be used to send inputs to this layer
**Add Current Pattern to Input Data:** Add the current activation of this layer to the input data table
**Randomize Selection:** Randomize Selected Elements (r)
**Randomize Bias:** Randomize biases of selected nodes
**Edit Components:** 
**Plot Activations:** Plot neuron activations across available graph type
**Plot Biases:** Plot neuron biases across available graph type
**Add Coupled Image World:**
**Record Activations:**
**Record Biases:**
**Align:**
**Space:**
**Create NeuronArray Coupling:**


## Weight Matrix Right Click Menu

**Cut:** Cut selected neurons, (connected) synapses, and neuron groups 
**Copy:** Copy selected neurons, (connected) synapses, and neuron groups 
**Paste:** Paste copied neurons, (connected) synapses, and neuron groups 
**Duplicate:** Duplicate selected neurons, (connected) synapses, and neuron groups 
**Edit:**
**Delete:** Delete selected node(s)
**Randomize Selection:** Randomize Selected Elements (r)
**Diagonalize:** Diagonalize array
**Transpose Weight Matrix Image (Current Target -> Source):** Transpose the weight matrix image
**Plot Weight Matrix:** Plot weight matrix across available graph type
**Show Eigenvalues:** Show eigenvalues for this matrix if it is a square
**Set Spectral Radius:** Rescale matrix so that max eigenvalue is the specified value
**Randomize Symmetric:** Use network weight randomizer to randomize the matrix symmetrically
**Zero Diagonal:** Effectively removes self-connections (in the reccurent case)
**Create WeigthMatrix Coupling:**



## Differences with synapse group

Synapse groups are collections of synapses and thus have a few extra features, including delays and polarity and more learning rules.


