---
title: What's New in Simbrain 4
layout: default
has_children: false
nav_order: 5
---

# What's new in Simbrain 4

Simbrain 4 is the first major release since Simbrain 3.07. During the long development cycle between those releases, most of the codebase was rewritten or refactored, the project was migrated to [Kotlin](https://kotlinlang.org/), unit tests were added, and many new features were introduced.

This page highlights some of the most important additions since the previous tagged release, with an emphasis on new capabilities users are likely to notice right away.

# Highlights

* [Neuron arrays, weight matrices, and tensors](network/arraysMatrices) are now deeply integrated into the network system, bringing modern array-based computation into Simbrain's visual workflow.
* [Convolutional neural networks](network/convolutionalNeuralNetworks) can now be built in the GUI, with tensor displays, kernel views, and receptive-field tracing that make convolutions easier to understand.
* [Transformer blocks](network/arraysMatrices#transformer-block) and modern ML components such as [GELU](network/neurons/gelu) were added, and Simbrain now includes a working tiny language model that can be trained and visually inspected.
* The [wand tool](network/wand/) adds a new way to interact with networks by painting activations, inducing spikes, pruning weights, or creating connectivity patterns directly on the canvas.
* The [connection strategy](network/connections) framework now supports multiple reusable patterns for generating connectivity, including sparse, fixed-degree, distance-based, and one-to-one projections.
* A flexible [supervised learning](network/learning/supervisedModels) framework supports on-the-fly training through complex pathways with multiple optimizers and initialization strategies.
* [Odor World](worlds/odorworld) was substantially expanded with tilemaps, animated sprites, additional sensors and effectors, and a lightweight [3D view sensor](worlds/3dworld) for first-person visual tasks.
* [Image World](worlds/imageworld) was rewritten around an [image processing pipeline](worlds/imageworld#pipelines-and-couplings), with image albums, filters, and a live editor.
* [Text World](worlds/textworld) now provides a unified NLP environment with token embeddings, multiple tokenizers including byte-pair encoding, and support for language-model-style workflows.
* A full [simulation environment](simulations/) with dozens of example simulations now replaces the earlier scripting-centered workflow.


# Network

* [Undo/redo](network/buildingBasics#undoredo-capabilities) (Finally!)
* The largest architectural change is support for array- and tensor-based neural networks. [Neuron arrays and weight matrices](network/arraysMatrices) make vectorized computation a first-class part of Simbrain while preserving the interactive visual style of earlier versions. Arrays support multiple display modes, direct inspection by zooming, matrix operations, and array-specific rules such as [Softmax](network/arraysMatrices/softmax) and [Winner Take All](network/arraysMatrices/wta).
* [Convolutional neural networks](network/convolutionalNeuralNetworks) were added, including tensor layers, convolution and pooling connectors, flattening into dense layers, CNN training dialogs, and receptive-field tracing that shows exactly which input region contributes to a downstream activation.
* [Transformer blocks](network/arraysMatrices#transformer-block) were added together with support for language-model-style simulations. Simbrain includes a small working language model that can be trained and inspected visually, making concepts like tokenization, embeddings, self-attention, and next-token prediction easier to explore.
* [Supervised models](network/learning/supervisedModels) allow backpropagation to be applied on the fly between selected source and target layers, including across paths with diverging and reconverging weights. The framework includes multiple optimizers and flexible weight initialization strategies.
* The [wand tool](network/wand/) provides a fast way to perturb running networks, paint activation patterns, induce spikes, sculpt weights, and dynamically create or prune connections.
* [Neuron collections](network/neuroncollections) were introduced as a new way of organizing neurons. These are lightweight wrappers on neurons that can overlap.
* Over 20 [neuron update rules](network/neurons) are now available, including biologically detailed models ([Morris-Lecar](network/neurons/morrisLecar), [Izhikevich](network/neurons/izhikevich), [FitzHugh-Nagumo](network/neurons/fitzhughNagumo)) and modern ML activations like [GELU](network/neurons/gelu) (for transformers), [Kuramoto](network/neurons/kuramoto), and [Allostatic](network/neurons/allostatic).
* The [connection strategy](network/connections) system has been expanded so users can generate dense, sparse, one-to-one, recurrent, and spatially organized projections while separately controlling topology, weight initialization, and excitatory / inhibitory ratios.
* New [subnetwork types](network/subnetworks) including [restricted Boltzmann machines](network/subnetworks/restrictedBoltzmannMachine)
* A [classifier](network/subnetworks/classifier) object was added, which wraps the [Smile](https://haifengl.github.io/classification.html) machine learning framework. 
* [Spike responders](network/spikeresponders) were reorganized into a dedicated framework with improved support for modeling synaptic dynamics.

# Plots

* A new [pixel plot](plots/pixelPlot) was introduced for visualizing neuron arrays and matrices as pixel grids, useful for displaying activation patterns and image data.
* The [projection plot](plots/projectionPlot) was rewritten with support for dimensionality reduction techniques (PCA, t-SNE, Sammon mapping) to visualize high-dimensional network dynamics. New coloring managers enable better visualization of temporal patterns and data relationships.
* [Time series plots](plots/timeSeries) were updated with improved auto-range capacities for better tracking of dynamic data ranges.
* [Raster plots](plots/rasterPlot) were updated with improved spike visualization and performance.
* Other plot types ([bar charts](plots/barChart), [histograms](plots/histogram), [pie charts](plots/pieChart)) remain available for data analysis.
    
# Odor World

[Odor World](worlds/odorworld) has been significantly rewritten and expanded as a platform for embodied agent simulations.

* Zooming and panning support for navigating larger environments
* Tilemap system with [Tiled](https://www.mapeditor.org/) editor integration for creating complex worlds
* Animated sprites for dynamic entity visualization
* New [object sensor](worlds/odorworld#object-sensor) type provides a simplified alternative to [smell sensors](worlds/odorworld#smell-sensor) for detecting specific entity types by name (e.g., "Swiss cheese") without requiring full vector-based smell source configuration
* [Sensors and effectors](worlds/odorworld#sensors-and-effectors) for movement (straight movement, turning), speech, hearing, bump detection, and tile sensing enable sophisticated embodied agent behaviors
* A lightweight [3D view sensor](worlds/3dworld) uses ray casting to create first-person visual inputs that can be coupled directly to arrays and networks, enabling simple 3D perception experiments without a heavyweight 3D engine

# Image World

[Image World](worlds/imageworld) was completely rewritten (formerly Vision World) with an [image processing pipeline](worlds/imageworld#pipelines-and-couplings) architecture.

* [Image album](worlds/imageworld#image-albums) system allows loading and cycling through multiple images for training and testing
* [Live image editor](worlds/imageworld#drawing-and-editing-tools) for on-the-fly modification and experimentation
* Image processing [operations](worlds/imageworld#available-operations) including [edge detection](worlds/imageworld#edge-detection), [Gabor filters](worlds/imageworld#gabor-filter), [grayscale conversion](worlds/imageworld#grayscale), [thresholding](worlds/imageworld#threshold), and [resizing](worlds/imageworld#resize) for preprocessing visual inputs
* Pipeline system enables chaining multiple operations for complex image transformations

# Text World

[Text World](worlds/textworld) was completely rewritten with improved NLP capabilities (merged from separate Display and Reader components).

* [Token embeddings](worlds/textworld#token-embeddings) management with support for custom embeddings and pre-trained models
* Multiple [tokenization methods](worlds/textworld#tokenizers) (simple word-based and [byte-pair encoding](worlds/textworld#tokenizers)) and [embedding types](worlds/textworld#embedding-types) ([one-hot](worlds/textworld#one-hot-encoding), [co-occurrence](worlds/textworld#co-occurrence) with sliding window, [custom](worlds/textworld#custom) pre-trained)
* Bytepair encoding visualization for understanding subword tokenization using the "show token boundaries" feature
* Integration with language model workflows through token embeddings

# Other

* The preference framework was rewritten
* The [tables](utilities/tables) and [data world](worlds/dataworld) have been completely rewritten on top of the Smile framework.
