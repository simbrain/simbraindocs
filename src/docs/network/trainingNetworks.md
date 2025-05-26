---
title: Training Networks
layout: default
parent: Networks
has_children: false
nav_order: 15
---

# Training Networks in Simbrain

The most common way to train neural networks is using algorithms like [backprop](https://en.wikipedia.org/wiki/Backpropagation) to update weights and biasses. This functionality is handled via a special interface and set of dialogs. Most of these dialogs have a common structure, similar to this one

<img src="/assets/images/trainingDialog.png" style="width:500px;"/>

The data used to train the network is shown at the bottom here, which can be edited and analyzed using Simbrain [data tables](/docs/utilities/tables). A play button usually initiates training. Parameters guiding the training are set using the other fields. Supervised learning involves two main tables, while unsupervised learning involves just one. 

This dialog appears when training various types of [subnetwork](/docs/network/subnetwork), or when using [supervised models](/docs/network/supervisedModels) created on the fly. 

Networks can learn in other ways, in particular via local learning rules like the [Hebb rule](https://en.wikipedia.org/wiki/Hebbian_theory) can be set up in synapses. That is discussed in [synapses](synapses/). 


## Data

The bottom part of these dialogs allows a [training set](https://en.wikipedia.org/wiki/Test_set) for a learning algorithm to be specified Columns correspond to neurons: input neurons for input data, output neurons for target data. 

In a supervised learning example, if a network has 3 inputs nodes and 2 output nodes, then the input table will have three columns, and the target table will have 2 columns. The input and target tables should have the same number of rows, and each input / target row pair is a single "training example" from the overall training set. Each row of the input data table is an input vector, and the corresponding row of the target data table is the desired vector that should be produced for that input, if training is successful.

# Supervised Learning

[Classifiers](docs/network/subnetworks/classifier) also belong here, but they are trained in one go, not iteratively.

### Training Tab

This is the main tab, where training takes place. It is also the tab that varies most from one network type to the next. Shown here is an example of the training tab for a backprop network. Buttons are included for randomizing weights, iterating the algorithm, and tracking error. In other cases (e.g. Hopfield, or LMS using offline training) there is just a single button which runs the algorithm a single time.

Some buttons that occur in training tabs include:

 **Play:** Run the training algorithm. If it's an iterative method, repeatedly iterate until the stop button is pressed.

 **Iterate:** Iterate the algorithm once.

 **Show Updates:** If this is selected, then you will see the weights change in Simbrain while the algorithm is run. This slows things down but is pedagogically useful.

 **Preferences:** Show preferences dialog for the current training method.

 **Randomize:** Randomize the weights of the network being trained. Usually, this randomizes the weights and biases, but the details of randomization depend on the network type. Useful between "restarts," for example, if you suspect you are stuck in a local minimum in weight space using backprop or LMS.

 **Reset:** Some networks (e.g. SOM) require special re-initialization and so a reset button is included. In these cases, a common workflow is to set up a network, set up inputs, and press a training button, occasionally tweaking, resetting, and re-running.

 **Iterations:** How many times an iterative algorithm has been iterated so far.

 **Error:** For iterative networks, the current error, shown both as a progress bar and as a time series relative to the current iteration number.

 **Clear button (time series):** Clears the error time series data.

 **Preferences button (time series):** Preferences for the error time series.

# Unsupervised Learning

[Unsupervised learning](https://en.wikipedia.org/wiki/Unsupervised_learning) uses one input table (som, competitive, hopfield), while [supervised learning](https://en.wikipedia.org/wiki/Supervised_learning) (backprop, lms, simple recurrent, echo state) uses input and target tables.

There is no target data in the dialog.

Examples include Resricted Boltzmann Machines and SOM Networks.

<img src="/assets/images/unsupervisedTrainingDialog.png" style="width:300px;"/>

Only one button is needed

**Train on Curent Pattern:** Apply the training algorithm to the pattern currently in the network.


<!-- For example, suppose we want to train a network to compute the classic exclusive-or or XOR function, via these associations:

 0,0 → 0  
 1,0 → 1  
 0,1 → 1  
 1,1 → 0

To do this, we need to set the input and training tables as follows:

| Input Data | Target Data |
|------------|--------------|
| 0,0        | 0            |
| 1,0        | 1            |
| 0,1        | 1            |
| 1,1        | 0            |

 -->