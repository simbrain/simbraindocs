---
title: Least Mean Square
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 70
---

# LMS Network

The LMS (or "least mean squares") Network is a classic type of two-layer feed-forward network that implements the LMS or **Delta rule** for learning. The LMS rule is a form of supervised learning, which means that the user supplies desired input-to-output mappings. In the network shown on the right (available as a workspace called "lmsLetters.zip"), letter patterns have been trained to produce labeled outputs. The network can generalize beyond the inputs it was trained on to recognize letters similar to those in its training set.

The core of the LMS network is its training algorithm. There are two methods available: **iterative** and **offline**.

<!-- TODO: Add image -->

## Creation Dialog

The LMS creation dialog is a variant on the **feed forward** creation dialog, which allows you to set the number of nodes at the input and output layers, and the type of node they are created with.

## Training

Training a network involves specifying input data, target data, and then running the algorithm. This general process is covered **here**.

There are two main ways to train an LMS Network:

### Iterative

The classic method of iteratively minimizing error. Described **here**.

### Offline

Higher performance non-iterative method described **here**.

## Right Click Menu

Generic right-click items are described on the **neuron group** page.

### Edit/Train LMS

Opens edit dialog to edit and train the LMS network.
