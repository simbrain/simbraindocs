---
title: What's New in 4.0
layout: default
has_children: false
nav_order: 5
---

# What's new in Simbrain 4

Simbrain 4.0 involved a complete rewrite of Simbrain that occurred between 2015 and 2025. During this time, most of the code was migrated to [Kotlin](https://kotlinlang.org/) and refactored, unit-tests were added, and hundreds of new features were introduced.

# New or improved components

* A [neuro-evolutionary](evolution/) framework was added with 10 evolution simulations. Evolve neural networks, virtual robots, and multi-agent systems.
* A full [simulation environment](simulations/) was introduced with over 70 simulations organized into 14 categories, replacing the earlier scripting environment.


# Network

* [Undo/redo](network/buildingBasics#undoredo-capabilities) (Finally!)
* The major change is array-based neural networks, including a carefully developed GUI (see [neuron arrays and matrices](network/arraysMatrices)) for visualizing array and matrix operations in Simbrain's signature intuitive style. Array operations enable matrix-based computations for neuron arrays and weight matrices, with support for batch processing and vectorized operations.
* Introduction of [transformer blocks](network/arraysMatrices#transformer-block) and support for language models.
* [Supervised models](network/learning/supervisedModels) that allow for using backprop on the fly on a source and target set of neurons or neuron arrays, including through paths of diverging and reconverging weights. The framework includes multiple optimizers (Adam, SGD) and flexible weight initialization strategies.
* [Neuron collections](network/neurongroups#neuron-collection) were introduced as a new way of organizing neurons. These are lightweight wrappers on neurons that can overlap.
* [Neuron groups](network/neurongroups) were reorganized and expanded. [Competitive](network/neurongroups/competitive), [SOM](network/neurongroups/selfOrganizingMap), and [winner-take-all](network/neurongroups/wta) became specialized neuron group types rather than subnetworks, making it easier to create these architectures. New [normalization](network/neurongroups/normalization) and [softmax](network/neurongroups/softmax) group types were also added.
* Over 20 [neuron update rules](network/neurons) are now available, including biologically detailed models ([Morris-Lecar](network/neurons/morrisLecar), [Izhikevich](network/neurons/izhikevich), [FitzHugh-Nagumo](network/neurons/fitzhughNagumo)) and modern ML activations like [GELU](network/neurons/gelu) (for transformers), [Kuramoto](network/neurons/kuramoto), [Allostatic](network/neurons/allostatic), and [Softmax](network/neurons/softmax).
* New [connection strategies](network/connections) including [distance-based](network/connections/distanceBased) and [fixed-degree](network/connections/fixedDegree) connections.
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

[Odor World](worlds/odorworld) has been significantly rewritten to function as a standard 2D game engine for embodied agent simulations.

* Zooming and panning support for navigating larger environments
* Tilemap system with [Tiled](https://www.mapeditor.org/) editor integration for creating complex worlds
* Animated sprites for dynamic entity visualization
* New [object sensor](worlds/odorworld#object-sensor) type provides a simplified alternative to [smell sensors](worlds/odorworld#smell-sensor) for detecting specific entity types by name (e.g., "Swiss cheese") without requiring full vector-based smell source configuration
* [Sensors and effectors](worlds/odorworld#sensors-and-effectors) for movement (straight movement, turning), speech, hearing, bump detection, and tile sensing enable sophisticated embodied agent behaviors

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
