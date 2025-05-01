---
title: Classifier
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 35
---

# Classifier

The classifier object is a Simbrain front end to a machine learning library, [Smile](https://haifengl.github.io/classification.html) that allows standard [machine learning](https://en.wikipedia.org/wiki/Machine_learning) tools to be interfaced with other Simbrain components. It uses ideas and concepts from the Simbrain GUI to make it easy to use these components. However, these are not neural network implementations.

To get a feel for classifers see the simulations in `simulations > machine learning`

Three types of classifier are supported: Support Vector Machines, Logistic Regression, and KMeans.

Each classifier is trained on a set of input–output examples and can then be used to assign class labels to new input patterns. Internally, a classifier returns a single class label, which is then converted into a one-hot output across a fixed number of output neurons.

The classifier is implemented as a [subnetwork](index.html), with:

- An **input layer**, consisting of a set neurons. 
- An **output layer**, which shows the predicted class
- An optional display of **class probabilities** (for Logistic Regression)

In this way a classifier can be connected to other Simbrain components. However you can also treat a classifier object as a self-standing component by double clicking on the interaction box in the upper-right of a classifier component, and training and testing it.

# Training and Testing

Once a classifier is created double clicking on the interaction box allows you to set data and train it. 

In the data tables at the bottom of the dialog all the input and target data are shown and can be tested.  Clicking on the step and apply buttons tests the current row. That input should show up in the input layer and an appropriate output should activate in the output layer.

When using a regular simbrain network the inputs can be provided by other components.

## Common Parameters

- **Number of inputs:** The dimensionality of the input data (i.e., the number of features per example)
- **Number of outputs:** The number of class labels (ignored for SVM, which only supports binary classification)
- **Classifier Type:** Select between different supported algorithms

## Support Vector Machine (SVM)

A binary classifier that separates data by projecting inputs into a higher dimensional space where datapoints that overlap can be separated using a hyperplane. It is most appropriate for problems with exactly two class labels. SVM only supports two output classes. Internally, class labels are encoded using a bipolar scheme (-1 and 1).


### Parameters

- **Polynomial Kernel Degree:** The degree of the polynomial used in the kernel function.
- **Soft margin penalty (C):** Controls the trade-off between a smooth decision boundary and correctly classifying training points.
- **Tolerance:** The convergence tolerance of the algorithm.


## Logistic Regression

Used for multi-class classification problems. Shows both the predicted class and (optionally) confidence values for each class.

### Parameters

- **Show probabilities:** If enabled, output neurons display a continuous probability distribution over classes instead of a one-hot winner-take-all pattern.

## K Nearest Neighbors (KNN)

Assigns a class label to an input based on the most common label among the k closest training examples.  Works well for small datasets and does not require an explicit training phase but instead stores all training examples


### Parameters

- **K:** The number of nearest neighbors used for classification

