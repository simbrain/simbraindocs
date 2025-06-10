---
title: Oja
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 60
---

# Oja

**[Hebbian learning](https://en.wikipedia.org/wiki/Hebbian_theory)** rules suffer from the tendency for weights to grow without bound. Several modifications have been introduced to address this, with **[Oja's rule](https://en.wikipedia.org/wiki/Oja%27s_rule)** being one of the most prominent.  
Oja's rule stabilizes synaptic growth by slowing learning as the sum of squared incoming weights approaches a target normalization factor. This is described by the update rule:  

$$
\Delta w = \text{learningRate} \cdot \bigl( \text{input} \cdot \text{output} - \frac{\text{output}^2 \cdot w}{\text{normalizationFactor}} \bigr)
$$  

For weight matrices, the update is:  

$$
\Delta W = \text{learningRate} \cdot \bigl( \text{output} \cdot \text{input}^T - W \cdot \text{input} \bigr)
$$  

In this rule:  
- *ε* is the learning rate  
- *a<sub>t</sub>* is the post-synaptic activation  
- *a<sub>s</sub>* is the pre-synaptic activation  
- *w* is the weight strength  
- *η* is the normalization factor towards which the sum of squared weights tends  

To maintain this normalization effect, all weights attached to a neuron should use this rule with the same *η* value.

Note that the strength of this synapse is **clipped** within its specified lower and upper bounds. Clipping may interfere with the intended normalization effect. Similarly, clipping the target neuron’s activation value could also interfere.

See Peter Dayan and Larry Abbott, *Theoretical Neuroscience,* Cambridge, MA: MIT Press, pp. 290–291.

# Preferences
- **Learning rate**: The learning rate *ε*.
- **Normalize to**: The target normalization factor *η* for the sum of squared incoming weights.