---
title: Training Networks
layout: default
parent: Learning
grand_parent: Networks
has_children: false
nav_order: 10
---

# Training Networks in Simbrain

The most common way to train neural networks is using algorithms like [backprop](https://en.wikipedia.org/wiki/Backpropagation) to update weights and biasses. This functionality is handled via a special interface and set of dialogs. Most of these dialogs have a common structure, similar to this one

<img src="/assets/images/trainingDialog.png" style="width:500px;"/>

The data used to train the network is shown at the bottom here, which can be edited and analyzed using Simbrain [data tables](/docs/utilities/tables). A play button usually initiates training. Parameters guiding the training are set using the other fields. Supervised learning involves two main tables, while unsupervised learning involves just one. 

This dialog appears when training various types of [subnetwork](../subnetworks/), or when using [supervised models](supervisedModels) created on the fly. 

Networks can learn in other ways, in particular via local learning rules like the [Hebb rule](https://en.wikipedia.org/wiki/Hebbian_theory) can be set up in synapses. That is discussed in [synapses](../synapses/). 


## Data

The bottom part of these dialogs allows a [training set](https://en.wikipedia.org/wiki/Test_set) for a learning algorithm to be specified Columns correspond to neurons: input neurons for input data, output neurons for target data. 

In a supervised learning example, if a network has 3 inputs nodes and 2 output nodes, then the input table will have three columns, and the target table will have 2 columns. The input and target tables should have the same number of rows, and each input / target row pair is a single "training example" from the overall training set. Each row of the input data table is an input vector, and the corresponding row of the target data table is the desired vector that should be produced for that input, if training is successful.

# Supervised Learning

[Classifiers](../subnetworks/classifier) also belong here, but they are trained in one go, not iteratively.

Supervised learning involves input / output data pairs. An input vector is fed in to a network and compared with the output vector that results. The errors that occur are propagated backwards through the network, updating the weights. In Simbrain the two main ways to engage in supervised learning are via [backprop](../subnetworks/backprop) networks, and [supervised models](supervisedModels).

## Accuracy

Accuracy for network training is computed per input pattern as follows:

If all output neuron activations are within a threshold distance (default 0.05) of their target activations, the pattern is counted as "correct." Accuracy is displayed as a percentage: (Number of Correct Patterns / Total Number of Patterns) × 100.

This threshold-based approach provides a practical measure of how well the network matches target patterns, accounting for small numerical variations that don't significantly impact functionality.

<!-- TODO --> Image showing train dialog with Accuracy label

# Unsupervised Learning

For [unsupervised learning](https://en.wikipedia.org/wiki/Unsupervised_learning) in Simbrain most subnetworks provide a dialog like the one shown at the top of the page, but with just one table.  See also [competitive networks](../subnetworks/competitive), [SOM](../subnetworks/selfOrganizingMap), and [Hopfield](../subnetworks/hopfield).

Another form of unsupervised learning (not available in the dialog form above) occurs when local rules are applied to individual synapses. See [synapses](../synapses/). Some forms of unsupervised learning occur when updating networks linked to worlds, with learning rules set in the synapses connecting network nodes to [sensors or effectors](../../worlds/odorworld/entities.html#sensors). 

# Training Data Tables

[Training set data](https://en.wikipedia.org/wiki/Training,_validation,_and_test_data_sets) consists of (1) **input data**, sometimes called sample, input, or test data and (2) **target data** (supervised learning only), sometimes called a label, desired value, or just target. The training dataset should contain examples of all patterns you want the network to learn. For example, if you are building a classifier for different types of fruit images, you need many images of each type of fruit in the dataset.

The training data is viewed in a [table](../../utilities/tables).

Additional operations for preparing training data are available via the toolbar. See the table docs for more information.

