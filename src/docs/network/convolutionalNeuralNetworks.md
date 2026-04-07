---
title: Convolutional Neural Networks
layout: default
parent: Networks
has_children: false
nav_order: 125
---

# Convolutional Neural Networks

Convolutional neural networks use tensor layers and spatial connectors to process image-like data. In Simbrain, a CNN is built from [TensorLayer](#tensor-layers) nodes connected by [convolution](#convolution-kernels), [pooling](#pooling), and [flatten](#flattening) connectors. A [ConvolutionalNeuralNetwork](subnetworks/convolutionalNeuralNetwork) subnetwork can wrap the whole pipeline so one network update performs a full forward pass.

Simbrain's visual tools make CNNs easier to inspect than they are in many code-only settings. Tensor layers show their spatial shape and channel contents directly, connector dialogs show how stride and padding change those shapes, kernel views show what each filter is learning, and receptive field tracing shows which input window contributes to a particular downstream activation.

<img src="/assets/images/cnn/cnn_example.png" alt="A Simbrain convolutional neural network connected to an image world" style="width:650px;"/>

## Creating a CNN

There are two ways to build a CNN. The [Convolutional Neural Network subnetwork](subnetworks/convolutionalNeuralNetwork) creation dialog steps through the whole architecture in one place: input shape, convolution and pooling stages, dense layers, and output size.

You can also build a CNN outward from an initial tensor layer. Add a tensor layer, right-click it, and use `Add Conv Layer...`, `Add Pool Layer...`, or `Add Flatten Layer` to add the next compatible stage. After flattening to a NeuronArray, continue with outgoing neuron arrays and weight matrices. Once the pipeline reaches the desired output NeuronArray, select the input tensor as the source, select the output NeuronArray as the target, and use `Create convolutional neural network` to wrap the pipeline in a subnetwork.

The tensor-layer list shows each stage and its resulting shape. Convolution stages expose:

- **Kernel Size**: Spatial size of the convolution kernel.
- **Num Filters**: Number of output filters and output channels.
- **Stride**: Step size used when moving the kernel across the input.
- **Padding**: Valid (unpadded) keeps the kernel inside the input. Same (padded) allows the kernel to extend beyond the original edges.
- **Activation**: Output tensor activation function. Options are Linear, ReLU, Sigmoid, and Tanh.

Pooling stages expose:

- **Pool Size**: Spatial size of the pooling window.
- **Stride**: Step size used when moving the pooling window.
- **Pooling Type**: Max or Average.

A useful way to think about convolution and pooling is that both move a sliding box across the tensor. Kernel size or pool size sets the box size, stride sets how far the box jumps at each step, and padding determines whether that box may extend beyond the original input edge. When stride is smaller than the window, neighboring windows overlap; when it equals the window, they just touch; when it is larger, there are gaps.

## Tensor Layers

A TensorLayer stores activations in height, width, channel order. Tensor layers are displayed as image-like nodes, with one channel shown in the main view and optional thumbnails for the remaining channels.

<img src="/assets/images/cnn/tensor.png" alt="Tensor layer showing one selected channel and a thumbnail strip" style="width:350px;"/>

- **Activation Function**: Element-wise function applied after input accumulation.
- **Clamped**: If selected, incoming inputs are ignored during update.
- **Thumbnail Strip**: Shows all channels as thumbnails below the main channel image.
- **Activations**: Current tensor values.
- **Biases**: Per-element bias values.

The TensorLayer activation functions are part of the tensor/CNN system. They do not reuse ordinary neuron update rules, even when the names are similar. For example, TensorLayer ReLU is separate from the ReLU clipping option described for [Linear](neurons/linear) neurons.

Tensor layers can also be coupled to external components. A single channel can be coupled as a two-dimensional array, and a three-channel tensor can be used as an RGB image source or target.

## Convolution Kernels

A ConvolutionConnector connects one tensor layer to another using learned kernels. Kernel weights are arranged by filter and input channel. The connector can show either a single kernel at a time or all kernels in a grid.

<div style="display:flex; align-items:flex-start; gap:24px; flex-wrap:wrap;">
  <img src="/assets/images/cnn/kernelview_single.png" alt="Single convolution kernel view" style="width:250px;"/>
  <img src="/assets/images/cnn/kernelview_all.png" alt="Convolution kernel grid view" style="width:300px;"/>
</div>

- **Kernel Size**: Spatial size of each kernel.
- **Num Filters**: Number of output filters.
- **Stride**: Step size used when applying the kernel.
- **Padding**: Valid (unpadded) or Same (padded).
- **Increment amount**: Amount added or subtracted when changing kernel weights using keyboard controls.
- **Kernel Grid**: Shows all kernels in a grid instead of one selected filter and channel.
- **Kernels**: Editable kernel-weight tensor.

The row labels in the grid correspond to filters, and the column labels correspond to input channels. In single-kernel mode, arrow controls move through filters and channels.

With `Valid` padding the kernel must stay fully inside the input, so spatial dimensions usually shrink and border cells contribute less. With `Same` padding, the input is padded so that stride-1 convolution preserves the spatial height and width; with larger strides, the output is still reduced according to the stride.

## Pooling

A PoolingConnector downsamples a tensor layer without learned weights. Pooling preserves the number of channels and changes the spatial dimensions according to the pool size and stride.

- **Pool Size**: Spatial size of the pooling window.
- **Stride**: Step size used when moving the pooling window.
- **Pooling Type**: Max selects the largest activation in the window. Average averages the window.

Pooling in Simbrain is unpadded. This is like `Valid` convolution in that the pool window must fit inside the source tensor. A common setup is `poolSize = stride`, which creates non-overlapping downsampling windows; if the input dimensions do not divide cleanly, leftover border rows or columns are dropped.

## Flattening

A FlattenConnector bridges the tensor pipeline to the array-based network system. It copies a tensor's activations into a NeuronArray, after which ordinary dense layers and WeightMatrix connectors can be used.

Flattening is the point where a CNN pipeline changes from spatial tensor processing to conventional array-based processing.

## Receptive Field Tracing

Hovering over tensor activations shows how spatial operations map across layers. This is useful for understanding padding, stride, convolution windows, and pooling windows.

<img src="/assets/images/cnn/forwardTracing.png" alt="Forward receptive field tracing through a convolution connector" style="width:650px;"/>

Forward tracing shows the current kernel or pooling-window footprint and the activation it maps to in the next tensor layer. Backward tracing starts from a single activation and shows the source-region footprint that produced it, expanding the receptive field through earlier layers.

<img src="/assets/images/cnn/backwardTracing.png" alt="Backward receptive field tracing through a convolutional neural network" style="width:650px;"/>

The trace display uses these network preferences:

- **Receptive field trace color**: Color used for forward trace boxes and connector highlights.
- **Backward trace color**: Color used for backward trace boxes and connector highlights.
- **Receptive field trace mode**: Auto Navigate changes the visible channel or filter to the traced one. Highlight Matched shows traces only when the matching channel is already visible. Highlight All shows trace boxes without switching the current view.

## Training

Right-click the CNN interaction box and select `Train...` to open the CNN training dialog. The training dialog provides step, run, stop, randomize, trainer properties, loss display, optional testing metrics, and an error plot.

CNN training uses the same general training concepts described in [Supervised Learning](learning/supervisedLearning) and [Training Parameters](learning/trainingParameters), but the trainer updates convolution kernels, tensor biases, and dense weights in the CNN pipeline.

- **Learning Rate**: Learning rate used by Adam updates.
- **Beta1**: Exponential decay rate for first-moment estimates in Adam.
- **Beta2**: Exponential decay rate for second-moment estimates in Adam.
- **Batch Size**: Mini-batch size used for each training iteration.
- **Loss Function**: Loss used to train the output layer. Options are SSE and Cross Entropy.
- **Weight Initialization Strategy**: Dense-layer weight initialization strategy.
- **Stopping Condition**: Optional automatic stopping conditions used while running.
- **Test Configuration**: Controls periodic evaluation on testing data.
- **Compute Accuracy**: Computes classification accuracy when targets are one-hot encoded.

When a CNN training dialog creates a default dataset, tensor inputs are initialized with simple synthetic image patterns such as lines, boxes, plus signs, and blobs. Each sample is stored as a flat row sized to the input tensor, but values are placed using the tensor's height, width, and channel indexing so they map directly to TensorLayer activations; targets are one-hot output vectors. For multi-channel tensors, the pattern is drawn strongly in one primary channel and can be ghosted at lower intensity into the other channels.
