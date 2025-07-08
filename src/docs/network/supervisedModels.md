---
title: Supervised Models
layout: default
parent: Networks
has_children: false
nav_order: 105
---

# Supervised Models

An innovative feature in Simbrain 4, the ability to train arbitrary collections of neuron arrays, collections, or groups linked via weight matrices or synapse groups. 

<img src="/assets/images/supervisedModel.png" style="width:300px;"/>

Using the source-target format, a source set of neurons is connected to a target set of neurons and using `ctrl/command-M` a supervised model is added and it can be trained on the fly. The neurons must be connected by weight matrices of synapse groups. Note: All paths backwards are automatically computed and multiple paths including skip connections can be trained in this way.

The model transiently wraps around a set of objects using a source and target neuron array, collection, or group (which  must be conneted by intervening weight matrices or synapse groups), and can be used to train them.  Finds the shortest path between source (Red selection) and target (green selection) and sets up backprop between them. 

# How to create a supervised model

1. Create two neuron groups, neuron arrays, or neuron collections (henceforth "neurons")
2. Connect them using 1-2 or 1-3
3. Select the input neurons interaction box and click `1`
4. Select the target neurons interaction box and right click and select `create supervised model`
5. A box should appear showing the model

# Apply Immediate Learning

Supervised models support "immediate learning", where you simply make the model, press `L`, and the network learns by one increment, treating the current activations of the source and target as a single training examples. You can watch things happen in real time. Repeatedly press to implement learning.
