---
title: Neuron Arrays and Weight Matrices
layout: default
parent: Networks
has_children: false
nav_order: 80
---

# Neuron Arrays and Weight Matrices

Simbrain originated as a way to focus intuition on loose or "free"-standing neurons and their connections, which model neuroscience or else show how the connection to neuroscence works in an intuitive way. However most neural networks software use vectors and matrices to represent neural networks, which make computations far more efficient.

In Simbrain 4 array-based approaches have been incorporated (using [Smile matrix](https://haifengl.github.io/linear-algebra.html) objects), and are integrated in such a way that they can be used alongside all the existing machinery, using similar GUI visualizations. Arrays and matrices provide efficient operations for large-scale neural network simulations and support modern machine learning workflows.

<img src="/assets/images/neuronArrayWeightMatrix.png" alt="Neuron array and weight matrix" style="width:400px;"/>

## Neuron Arrays

Neuron arrays are collections of neurons backed by Smile matrices, stored as column vectors. They provide efficient computation for large numbers of neurons while maintaining compatibility with Simbrain's visualization and update systems.

### Display Modes

Neuron arrays can be displayed in multiple ways:
- **Line mode**: Shows neurons as a horizontal or vertical line
- **Grid mode**: Arranges neurons in a rectangular grid
- **Circle mode**: Displays individual neurons as circles
- **Image mode**: Shows activations as a color-coded pixel image

Toggle between these modes using the right-click menu or the GUI tab in the neuron array dialog.

### Array Operations

Neuron arrays support several operations:
- **Layer normalization**: Normalize activations across the array
- **Bias handling**: Each neuron can have an individual bias value
- **Increment/decrement**: Adjust all activations by a fixed amount
- **Clear**: Reset all activations to zero
- **Randomize**: Set activations to random values

## Weight Matrices

Weight matrices represent connections between neuron arrays or neuron groups. They provide efficient matrix-based computation for large-scale networks and support various learning rules and operations.

### Matrix Structure

Weight matrices have dimensions of target size × source size. Each entry represents the connection strength from a source neuron to a target neuron. The matrix supports both excitatory and inhibitory connections, with automatic masking to separate these connection types.

### Matrix Operations

Weight matrices support numerous operations:
- **Diagonalize**: Create an identity-like matrix
- **Randomize**: Fill with random values
- **Randomize symmetric**: Create symmetric random matrices
- **Zero diagonal**: Remove self-connections
- **Clear**: Set all weights to zero

### Mathematical Properties

For square matrices, additional operations are available:
- **Eigenvalues**: Calculate and display eigenvalues
- **Spectral radius**: Set the maximum eigenvalue to control network dynamics

## Creating Arrays and Matrices

An array can be inserted into a Network Window through two methods:

1) Insert > "Add Neuron Array"
2) Pressing the Keyboard shortcut "Y"

Weight Matrices can be added by connecting any two neuron arrays or neuron groups. The simplest way to connect two objects is using the [1-2 trick](./buildingBasics.html#source-and-target-objects).

## Matrix Integration

Simbrain uses efficient matrix operations for array-based computation. This provides:

### Benefits
- Fast computation for large networks
- Efficient memory usage
- Modern neural network compatibility

### Integration with Other Components
Arrays can connect with other network components:
- Neuron groups can connect to arrays via weight matrices
- Arrays can connect to synapse groups
- Mixed neuron and array networks are supported 

## PSR Matrix

The Post-Synaptic Response (PSR) matrix is a key innovation in Simbrain that extends traditional matrix-vector multiplication to support spiking neural networks.

### Traditional vs PSR Computation

In typical neural networks:
- Output = Weight Matrix × Input Vector

In Simbrain, this is split into two steps:
1. **PSR Matrix Creation**: Each row of the weight matrix is element-wise multiplied by the input vector
2. **Summation**: Row sums of the PSR matrix produce the final output

This factorization allows spike responders to modify individual synaptic responses before summation, enabling more biologically realistic computation.

### Spike Response Integration

The PSR matrix can be processed by [spike responders](./spikeresponders.html) before summation, allowing for:
- Non-linear synaptic responses
- Temporal dynamics at individual synapses
- Biologically plausible computation models

### Excitatory and Inhibitory Separation

Weight matrices maintain separate masks for excitatory and inhibitory connections:
- **Excitatory mask**: Binary matrix marking positive weights
- **Inhibitory mask**: Binary matrix marking negative weights

These masks enable separate processing of excitatory and inhibitory inputs, which is important for biologically realistic models.

## Neuron Array Right Click Menu

- **Cut:** Cut selected neurons, (connected) synapses, and neuron groups

- **Copy:** Copy selected neurons, (connected) synapses, and neuron groups 

- **Paste:** Paste copied neurons, (connected) synapses, and neuron groups 

- **Duplicate:** Duplicate selected neurons, (connected) synapses, and neuron groups 

- **Edit:**

- **Delete:** Delete selected node(s)

- **Connect Selected Objects...:** Creates synapse, weight matrix, etc. between selected source and target entities

- **Toggle Line / Grid:** Toggle line / grid style

- **Toggle Horizontal / Vertical Layout:** Toggle horizontal / vertical layout

- **Toggle Circle Mode:** Toggle activation rendering mode between circle and image

- **Toggle Bias Visibility:** Toggle whether biases are visible

- **Create Supervised Model:** Create supervised model with using the current activation as target for immediate training

- **Input Data...:** Opens a dialog that can be used to send inputs to this layer

- **Add Current Pattern to Input Data:** Add the current activation of this layer to the input data table

- **Randomize Selection:** Randomize Selected Elements (r)

- **Randomize Bias:** Randomize biases of selected nodes

- **Edit Components:** Edit the entries of the matrix or array

- **Plot Activations:** Plot neuron activations across available graph type

- **Plot Biases:** Plot neuron biases across available graph type

- **Add Coupled Image World:** Couples an image world to this neuron array

- **Record Activations:** Start recording activations to a data world

- **Record Biases:** Start recording biases to a data world


## Weight Matrix Right Click Menu

- **Cut:** Cut selected neurons, (connected) synapses, and neuron groups 

- **Copy:** Copy selected neurons, (connected) synapses, and neuron groups 

- **Paste:** Paste copied neurons, (connected) synapses, and neuron groups 

- **Duplicate:** Duplicate selected neurons, (connected) synapses, and neuron groups 

- **Delete:** Delete selected node(s)

- **Randomize Selection:** Randomize Selected Elements (r)

- **Diagonalize:** Diagonalize array

- **Transpose Weight Matrix Image (Current Target -> Source):** Transpose the weight matrix image

- **Plot Weight Matrix:** Plot weight matrix across available graph type

- **Show Eigenvalues:** Show eigenvalues for this matrix if it is a square

- **Set Spectral Radius:** Rescale matrix so that max eigenvalue is the specified value

- **Randomize Symmetric:** Use network weight randomizer to randomize the matrix symmetrically

- **Zero Diagonal:** Effectively removes self-connections (in the reccurent case)


## Differences with Synapse Groups

While weight matrices and synapse groups both represent connections, they have different capabilities:

### Weight Matrices
- Fast computation for large networks
- Best for fully-connected layers
- Support matrix operations (eigenvalues, spectral radius)
- Learning rules work on entire matrix

### Synapse Groups
- Individual synapse properties
- Support connection delays
- More learning rule options
- Can connect any network components
- Support for sparse connectivity


## Weight Matrix Dialog Options

### Properties Tab

- **Label**: Optional string description for identification
- **Update Priority**: Determines update order in network (lower numbers update first)
- **Increment Amount**: Amount to increment all weights when using keyboard shortcuts
- **Clamped**: Prevents weight updates during learning (see [Clamping](../neurons#clamping))
- **Learning Rule**: Specifies how weights change during training
- **Spike Responder**: Processes PSR matrix entries (see [Spike Responders](./spikeresponders.html))

### Weight Matrix Tab

- **Matrix Editor**: Direct editing of weight values in spreadsheet format
- **Import/Export**: Load weights from files or save current values
- **Visualization**: Color-coded display of weight magnitudes
- **Statistics**: View weight distribution, min/max values, and norms

For detailed matrix editing instructions, see [Weight Matrix Viewer](./networkDialogs.html#weight-matrix-viewer--editor/).

### Data Tab

- **PSR Matrix**: View post-synaptic response values
- **Weight Array**: Access weight values for coupling
- **Matrix Properties**: View matrix dimensions and statistics

## Neuron Array Dialog Options:

### Main Tab

- **Activations**: Current activation values for all neurons
- **Label**: Optional string description for identification
- **Labels**: Individual labels for each neuron in the array
- **Clamped**: Prevents activation updates (see [Clamping](../neurons#clamping))
- **Bias Array**: Individual bias values for each neuron
- **Use Layer Norm**: Applies layer normalization after each update
- **Increment Amount**: Amount to increment all activations using keyboard shortcuts
- **Update Priority**: Determines update order in network (lower numbers update first)

### GUI Tab

- **Show Activations**: Display activations as color-coded pixel image
- **Grid Mode**: Show neurons in rectangular grid vs. single line
- **Circle Mode**: Display individual neuron circles instead of image
- **Vertical Layout**: Orient array vertically instead of horizontally
- **Biases Visible**: Show bias values as small indicators

### Update Rule Tab

- **Update Rule**: Neuron update function (Linear, Sigmoidal, etc.)
- **Upper Bound**: Maximum activation value
- **Lower Bound**: Minimum activation value
- **Clipping Type**: How to handle out-of-bounds values
  - **None**: No clipping applied
  - **Clip**: Hard clipping to bounds (piecewise linear)
  - **Floor**: Minimum clipping only (ReLU-style)
- **Slope**: Linear rule slope parameter

For more information on update rules, see [Neuron Update Rules](./neurons.html#update-rules).
