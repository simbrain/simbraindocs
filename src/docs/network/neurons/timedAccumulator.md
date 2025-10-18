---
title: Timed Accumulator
layout: default
grand_parent: Networks
parent: Neurons
has_children: false
published: false
---

# Timed Accumulator Neuron Model

The Timed Accumulator Neuron is a stochastic spiking neuron model commonly used in cortical branching simulations. The model employs a timed accumulator that normalizes its inputs using the softmax function. This function assigns each synaptic weight a probability value, and the neuron spikes with a probability proportional to the softmax'd value of that weight. 

The neuron can also spike spontaneously with a certain probability and has a refractory period where it cannot spike again for a set amount of time.

## Softmax Function

The softmax function used to normalize inputs is defined as:

$$
\text{softmax}(x_i) = \kappa \cdot \frac{\exp(x_i)}{\sum \exp(X \cdot b)}
$$

Where:
- $$ x_i $$ are the synaptic weights,
- $$ b $$ controls the steepness of the softmax function,
- $$ \kappa $$ acts as a global gain parameter.

## How It Works

The neuron updates its state in discrete time steps. During each time step, the model first checks if the neuron is in the refractory period. If not, it calculates the softmax probabilities for each incoming synapse and decides whether to spike based on these probabilities and a random draw. If the neuron spikes, it enters the refractory period for a predefined time. If no spike occurs, the neuron remains inactive.

The update rule for the neuron is as follows:

1. If the neuron is in the refractory period, it cannot spike and will return without any change.
2. If the neuron spikes spontaneously (with probability `baseProb`), the activation is set to 1, and it spikes.
3. If the neuron does not spike spontaneously, it checks each synapse's softmax probability to determine if it should spike based on the incoming synapse strength and the softmax probability.
4. The spike probability for each synapse is given by:

$$
P(\text{spike}) = \frac{\kappa \cdot \text{PSR}}{\text{expSum}}
$$

Where:
- **PSR** is the **Post-Synaptic Response** for the synapse,
- **expSum** is the sum of the exponentiated synaptic weights.

## Parameters

### Ref. Period

The refractory period defines how long it takes before the neuron can spike again after a spike. Controls the duration of inactivity after each spike.

### Spike Prob.

The probability that the neuron will spike spontaneously regardless of input. Raising this allows for spontaneous firing in the absence of significant inputs.

### Shape Parameter (b)

The parameter that controls the steepness of the softmax function. Affects how dramatically the neuron responds to varying synaptic weights.

### Gain ($$ \kappa $$)

Scales the probability of spikes based on the synaptic weights. Allows for adjustment of overall spiking probability, influencing the strength of the neuron's response.


For other adjustable properties like noise and sigmoid function type, see [common neuron properties](/docs/network/neurons/index#common-neuron-properties)



