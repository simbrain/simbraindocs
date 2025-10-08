---
title: Naka Rushton
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
---

# Naka-Rushton Neuron

With this activation function, **weighted inputs** to a neuron are interpreted as stimuli intensities and the activation of the neuron is interpreted as a spike rate. For standard values of its parameters there is a gradual increase in firing until the neuron fires near its maximum rate.

The activation of this type of neuron will tend to follow a value *S*(*W*) which is defined as:

$$
S(W) = 
\begin{cases} 
\frac{u W^N}{\sigma N + W^N} & \text{for } W \geq 0 \\
0 & \text{for } W < 0
\end{cases}
$$

In this equation *W* is weighted inputs, *u* is upper bound (which here represents maximum spike rate), *N* is steepness, and sigma is the semi-saturation constant. This is roughly a sigmoidal function with a lower asymptote of 0 and an upper asymptote of *u*. This is realistic because the number of times a neuron fires in an interval of time is always non-negative.

The way in which the activation value *a* is made to follow *S*(*W*) is by making *S*(*W*) the fixed point of the simple differential equation:

$$
\frac{da}{dt} = \frac{-a + S(W)}{\tau}
$$

The time constant &#964; controls the rate at which activation tends toward the fixed point.

## Adaptation

If useAdaptation is set to true, then the activation (spike rate) will tend towards zero. This models "spike rate adaptation," according to which neurons have finite resources which prevent them from rapidly spiking indefinitely.

Adaptation is modeled by adding an adaptation variable *A*, which increases the steepness of the sigmoidal-like function *S* by increasing the semi-saturation constant, and thereby moving the fixed point of the activation function towards its minimum value.

$$
S(W) = 
\begin{cases} 
\frac{u W^N}{(\sigma + A)^N + W^N} & \text{for } W \geq 0 \\
0 & \text{for } W < 0
\end{cases}
$$

*A* is a function of the activation of the neuron:


$$ \frac{dA}{dt} = \frac{-A + 0.7a}{\tau_A} $$


So the neuron will "adapt" more rapidly when it is firing more. Adaptation is controlled by its own time constant, Ta, which should be much larger than Ti, so that the adaptation will occur more slowly than the overall evolution of the firing rate.

The value of *A* can be observed via the tool tip on a neuron's graphical representation.

Both differential equations are implemented by integrating a differential equaton using the Euler method. The time-step of the Euler method is a global variable.

See Hugh Wilson, *Spikes, Decisions, and Actions,* Oxford: Oxford University Press, pp. 19-22, and 81-82.

## Parameters

- **Steepness**: Controls the sharpness of the sigmoidal activation curve.
- **Semi-Saturation Constant**: The input value at which output reaches half of the upper bound.
- **Time Constant**: How quickly activation moves toward its steady-state.
- **Use Adaptation**: Enables spike-rate adaptation dynamics.
- **Adaptation Parameter**: Scales the influence of current activation on adaptation.
- **Adaptation Time Constant**: Controls how quickly adaptation returns to baseline.

For all other parameters, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)


