---
title: Training Networks
layout: default
parent: Networks
has_children: false
nav_order: 150
---

# Training Networks in Simbrain

Training networks in Simbrain is handled in several ways. Local learning rules can be set up in synapses. That is discussed in [synapses](synapses/). Other forms of training are handled using special dialogs and commands described here.

# Supervised Learning

Includes backprop and SRN.

These networks have a training set and controls to manage trainig them. The main point of entry is the training dialog.

## Supervised Training Dialog

Some version of a training dialog is used in many places in Simbrain, including: [backprop](../network/backpropnetwork.html), [least mean square nets](../network/lmsnetwork.html), [simple recurrent nets](../network/srn.html), [echo state nets](../network/echostatenetwork.html), [hopfield nets](../network/hopfieldnetwork.html), [competitive nets](../network/competitivenetwork.html), and [self-organizing maps](../network/som.html). For items specific to a particular network type see those pages. If you open one of these and double click on the interaction box, you'll get the main training dialog.

TODO: Put in a new screenshot and add buttons /  menu items missing below

Generally, there is a main training tab, either one or two input data tabs, and a [validation tab](testInputs.html).

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

Includes competitive network, Hopfield, Resricted Boltzmann Machine, and SOM Network.

These networks are similar to supervised but only have input data. There is no target data.  The dialog is different

TODO: Put in a new screenshot and add menu items / buttons missing below

Menu commands

 **Train on Curent Pattern:** Apply the training algorithm to the pattern currently in the network.

# Immediate Learning

 A nice way to get a feel for how things work, and for tuning a network too. Each time you select a source and target neuron or neuron array, and press `L` (for learn) the network learns by one increment, treating the current activations of the source and target as a single training examples. You can watch things happen in real time. Repeatedly press to implement learning. Finds the shortest path between source (Red selection) and target (green selection) and trains those using backprop.



# Training Data

These tabs allow a user to edit the [training set](https://en.wikipedia.org/wiki/Test_set) for a learning algorithm. Training a network generally involves specifying one or more tables of data. These tables can be quickly edited (e.g. column data can be normalized and all data randomized). Cf. the [table documentation](../../Utils/Tables/Tables.html).

[Unsupervised learning](https://en.wikipedia.org/wiki/Unsupervised_learning) uses one input table (som, competitive, hopfield), while [supervised learning](https://en.wikipedia.org/wiki/Supervised_learning) (backprop, lms, simple recurrent, echo state) uses input and target tables. Each row of these tables corresponds to one input or target vector.

Columns correspond to neurons: input neurons for input data, output neurons for target data. In a supervised learning example, if a network has 3 inputs nodes and 2 output nodes, then the input table will have three columns, and the target table will have 2 columns. The input and target tables should have the same number of rows, and each input / target row pair is a single "training example" from the overall training set. Each row of the input data table is an input vector, and the corresponding row of the target data table is the desired vector that should be produced for that input, if training is successful.

For example, suppose we want to train a network to compute the classic exclusive-or or XOR function, via these associations:

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

