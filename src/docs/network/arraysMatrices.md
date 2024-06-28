---
title: Neuron Arrays and Weight Matrices
layout: default
parent: Networks
has_children: false
nav_order: 30
---

# Neuron Arrays and Weight Matrices

Simbrain originated as a way to focus intuition on loose or "free"-standing neurons and their connections, which model neuroscience or else show how the connection to neuroscence works in an intuitive way. However most neural networks software use vectors and matrices to represent neural networks, for the obvious reason that it is vastly more efficient. In Simbrain 4 these broadly array-based approaches have been incorproated, and integrated to work alongside all the existing machinery and to carry over as much of the emphasis on intuitive GUI visualization as possible

 <img src="/assets/images/neuronArrayWeightMatrix.png" alt="Neuron array and weight matrix" style="width:400px;"/>

## Neuron Arrays
 
These are represenations of arrays of neurons. They are column vectors in the underlying code. They can be represented as a line or grid by using a toggle button. They are updated using the same [update logic](updateLogic.html) as with free neurons. In fact the rule objects are shared.


## Weight matrices
 
These are represenations of weights. They can be updated using shared local learning rules. They are shadowed by a matrix of post synaptic responses to allow for for spiking rules in a matrix setting. Right click context menu allows common operations.