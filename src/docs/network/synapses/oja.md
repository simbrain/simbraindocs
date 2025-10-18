---
title: Oja
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 60
---

# Oja's Rule

**[Hebbian learning](https://en.wikipedia.org/wiki/Hebbian_theory)** rules suffer from the tendency for weights to grow without bound. Several modifications have been introduced to address this, with **[Oja's rule](https://en.wikipedia.org/wiki/Oja%27s_rule)** being one of the most prominent.  Oja's rule stabilizes synaptic growth by slowing learning as the sum of squared incoming weights approaches a target normalization factor. For example, if the normalization factor is 4, and there is a single weight, its value should approach 2 or -2.

Here is the rule:

$$
\Delta w = \epsilon \cdot \bigl( a_\text{source}  \cdot a_\text{target} - \frac{a_\text{target}^2 \cdot w}{N} \bigr)
$$  


where:  
- $$\epsilon$$ is the learning rate
- *a<sub>t</sub>* is the post-synaptic activation  
- *a<sub>s</sub>* is the pre-synaptic activation  
- *w* is the weight strength  
- $$N$$ is a normalization factor which determines the value the weight will tend to. To maintain this normalization effect, all weights attached to a neuron should use this rule with the same *N* value.

Note that the strength of this synapse is **clipped** within its specified lower and upper bounds. Clipping may interfere with the intended normalization effect. Similarly, clipping the target neuron’s activation value could also interfere.

See Peter Dayan and Larry Abbott, *Theoretical Neuroscience,* Cambridge, MA: MIT Press, pp. 290–291.

Connect a clamped input node to an unclamped target node with an Oja synapse and try random inputs and weight values, and you should see convergence to weight values whose square is the normalization factor. You can plot the weight's value by right clicking and using `Time Series Plot`. When you do this and randomize the weight repeatedly, you should see it repeatedly converge to, for example, 1 and -1 (for a normalization factor of 1), or 3 and -3 (for a normalization factor of 9). It is a 2 attractor system in weight space. 

# Parameters
- **Learning rate**: The learning rate $$\epsilon$$.
- **Normalization Factor**: The normalization factor $$N$$ for the sum of squared incoming weights