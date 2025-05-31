---
title: Classifiers in Simbrain
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 35
---

# Classifiers in Simbrain

<!-- We can take pure machine learning stuff and put it into Simbrain where we don’t see weights, we don't see this neural analog. We just see it in machine learning terms, and we see kind of how they’re similar input output structures, but it’s just kind of framed differently. 

Of course it could also be used just to study the machine learning stuff on its own using Simbrain's visualization -->

The classifier object is a Simbrain front end to a machine learning library, [Smile](https://haifengl.github.io/classification.html) that allows standard [machine learning](https://en.wikipedia.org/wiki/Machine_learning) tools to be interfaced with other Simbrain components. It uses ideas and concepts from the Simbrain GUI to make it easy to use these components. However, these are not neural network implementations.

To get a feel for classifers see the simulations in `simulations > machine learning`

Three types of classifier are supported: Support Vector Machines, Logistic Regression, and KMeans.

Each classifier is trained on a set of input-target pairs, where the inputs are features vectors and targets are sets of class labels. The classifier can then be used to assign class labels to new input patterns. Each class label is associated with one of the output neurons. Usually only one output is active for any input (one-hot, winner-take all)

The classifier is implemented as a [subnetwork](index.html), with:

- An **input layer**, consisting of a set neurons. Input vectors are sometimes called "feature vectors" in machine learning.
- An **output layer**, with one neuron for each possible class. 

Note that the arrow between the input and output layer cannot be clicked on, which is different from [weight matrices](../arraysMatrices) and [synapse groups](../synapsegroups). In most of Simbrain we think about connections between layers in terms of groups of weights. In these machine learning contexts other kinds of algorithms are applied--some inspired by neural networks or sharing structural similarities—-but ultimately based on distinct mathematical and statistical techniques. So that part is black-boxed here.

Still, classifers are first-class components of Simbrain that can interact with other Simbrain components.  Because inputs and outputs are just [neuron groups](../neurongroups), classifiers can be connected to other Simbrain components. For example, the output of a neural network can be passed into a classifier, and its result sent to another network.

# Training and Testing

Double clicking on a classifier's interaction box allows you to train it, test it on new data, and edit it's training and testing data.

In the data tables at the bottom of the dialog all the input and target data are shown.   Clicking on the step button allows specific inputs to be tested. 

The classifier can also be tested on new data simply by passing data to the input layer and updating the workspace. 

# Visualizing the Classifier

Right clicking on the interaction box and selecting `Visualize Classifier` plots all training data and colors the data by class label. As new data are passed through the classifier the new data is shown as a differently colored dot. This allows for an intuitive and fairly standard way of understanding how the classifeir works.

# Creation Parameters

- **Number of inputs:** The dimensionality of the input data (i.e., the number of features per training example)
- **Number of outputs:** The number of class labels (ignored for SVM, which only supports binary classification)
- **Classifier Type:** Select between different supported algorithms

# Support Vector Machine (SVM)

A [support vector machine](https://en.wikipedia.org/wiki/Support_vector_machine) is a binary classifier (that only ever has two output nodes) that separates data into one of two classes by projecting inputs into a higher dimensional space. The model finds a hypersurface that separates the two kinds of inputs in the higher dimensional space using the largest margin possible, as in this image:

<img src="https://upload.wikimedia.org/wikipedia/commons/b/b5/Svm_separating_hyperplanes_%28SVG%29.svg" alt="SVM" style="width:300px;"/>

SVM only supports two output classes. Internally, class labels are encoded using a bipolar scheme (-1 and 1).

## Parameters

- **Polynomial Kernel Degree:** The degree of the structure used to separate the two classes.  When the degree is 1, the surface is linear. Higher degrees allow the model to capture more complex, nonlinear relationships between features, but also risk overfitting.
- **Soft margin penalty (C):** A regularization parameter that controls the trade-off between maximizing the margin and correctly classifying training points. Larger values prioritize correct classification (resulting in a smaller margin and potential overfitting), while smaller values allow more misclassifications in order to achieve a larger margin and better generalization.
- **Tolerance:** The stopping criterion for the optimization algorithm. Smaller values lead to more precise convergence but longer training times. Larger values result in faster training but less precise solutions.

# Logistic Regression

The [logistic regression classifier](https://en.wikipedia.org/wiki/Logistic_regression) fits a model that outputs probabilities for each class based on the input features. It uses the statistical technique of maximum likelihood estimation to find the parameters of either a sigmoid or a softmax function, depending on whether the task involves two classes (two output nodes in Simbrain) or more (three or more output nodes in Simbrain). These parameters are optimized so that the predicted outputs match the training labels as closely as possible. This is easiest to visualize in the binary (two-category, two output node) case, where a sigmoid function is fit. For example, in the figure below, the input might be the number of hours studied (this would be a case of just one input node), and the target indicates whether each person passed an exam:

<img src="https://upload.wikimedia.org/wikipedia/commons/c/cb/Exam_pass_logistic_curve.svg" alt="logistic regression" style="width:300px;"/>


Thus the raw output of logisic regression is a probability distribution, which can be shown in Simbrain, and which can often be useful to look out. The input is classified by selecting the class with the highest predicted probability.

## Parameters

- **Show probabilities:** If enabled, each output neuron displays a probability of class membership (a posterior probability) relative to the current input. Together they form a probability distribution over classes. If disabled only one output is highlighted, corresponding to the highest probability output.

## K Nearest Neighbors (KNN)

The [KNN Classifier](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) assigns a class label to an input based on the most common label among the $$K$$ closest inputs in the training set. The idea is illusrated in this figure. The green dot corresponds to the current input or feature vector. The 3 nearest neighbors are found in the dataset (here $$K=3$$) and the green dot is classified with the triangles since most of the neighbors are triangles. 

<img src="https://upload.wikimedia.org/wikipedia/commons/e/e7/KnnClassification.svg" alt="KNN" style="width:300px;"/>

The method works well for small datasets. 

Note that the classifier does not need to be trained, it simply finds nearby points in the training set.

### Parameters

- **K:** The number of nearest neighbors used for classification

