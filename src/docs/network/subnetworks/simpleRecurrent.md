---
title: Simple Recurrent
layout: default
grand_parent: Networks
parent: Subnetworks
has_children: false
nav_order: 80
---

# Simple Recurrent Network

An SRN or Simple Recurrent Network (or Elman Network) is a kind of recurrent network. They are useful for discovering patterns in temporally extended data. They are essentially variants on a **backprop network** which is trained to associate inputs together with a memory of the last hidden layer state with output states. In this way, for example, the network can predict what item will occur next in a stream of patterns. To see an SRN in action see the "srn_temporalXOR.zip" workspace and the "elmansPhonemes.bsh" script.

## History

According to **this site**: "The Simple Recurrent Network (SRN) was conceived and first used by Jeff Elman, and was first published in a paper entitled Finding structure in time (Elman, 1990). The paper was ground-breaking for many cognitive scientists and psycholinguists, since it was the first to completely break away from a prior commitment to specific linguistic units (e.g. phonemes or words), and to explore the vision that these units might be emergent consequences of a learning process operating over the latent structure in the speech stream. Elman had actually implemented an earlier model in which the input and output of the network was a very low-level spectrogram-like representation, trained using a spectral information extracted from a recording of his own voice saying 'This is the voice of the neural network'. We will not discuss the details of this network, except to note that it learned to produce this utterance after repeated training, and contained no explicit feature, phoneme, syllable, morpheme, or word-level units."

<!-- TODO: Add image -->

## Training

Training a network involves specifying input data, target data, and then running the algorithm. This process is covered **here**. The overall method is the same as with **backprop networks**. However, there is an important difference with SRNs. It is assumed that a given input to an SRN will occur *after* previous patterns have occurred. For example, in the "srn_temporalXOR.zip" workspace, a network has been trained to perform a **logical exclusive or** in time. So an input of 1 after a 0 should produce a 1. But the same input of 1 after another 1 should produce a 0.

## Creation Dialog

- **Number of Input Nodes:** Number of input nodes.
- **Number of Hidden Nodes:** Number of hidden nodes (also number of nodes in context layer).
- **Number of Output Nodes:** Desired number of output nodes.
- **Hidden / Output Neuron Type:** Set hidden neuron to desired type. Some variant on a **discrete sigmoidal** neuron.

## Right Click Menu

Generic right-click items are described on the **neuron group** page.

- **Edit/Train SRN:** Open edit dialog to train SRN network.
- **Clear SRN:** Clear all activation and set hidden unit nodes to 0.5, as is sometimes suggested for good performance.
- **View/Edit Data:** View and edit training set data (input data and target data).
