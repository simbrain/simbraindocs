---
title: Short Term Plasticity
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 80
---

# Short Term Plasticity

Short Term Plasticity (STP) models transient changes in synaptic strength that occur on short timescales, distinct from long-term plasticity mechanisms like Hebbian learning. STP can model both **Short Term Depression (STD)** and **Short Term Facilitation (STF)**, sometimes referred to as "UDF" for Use, Depression, and Facilitation.

## How STP Works

STP dynamically modifies synaptic strength based on the firing history of the source neuron. The mechanism involves two key variables:

- **U (Use/Facilitation)**: Probability of neurotransmitter release, increases with use
- **R (Depression)**: Available neurotransmitter resources, decreases with use

### Mathematical Model

The STP model uses the following equations:

**Use variable update:**
$$u_{new} = U + u \cdot (1 - U) \cdot e^{-ISI/F}$$

**Depression variable update:**
$$R_{new} = 1 + (R - u \cdot R - 1) \cdot e^{-ISI/D}$$

Where:
- $ISI$ = Inter-spike interval (time since last spike)
- $U$ = Mean use parameter
- $D$ = Depression time constant
- $F$ = Facilitation time constant

**Effective synaptic strength:**
$$w_{effective} = w \cdot R \cdot u$$

## Parameters

### Core Parameters

- **Mean Use (U)**: Base probability of neurotransmitter release (0-1)
- **Depression Time Constant (D)**: Time scale for depression recovery (ms)
- **Facilitation Time Constant (F)**: Time scale for facilitation decay (ms)

### Recommended Settings

**For Short Term Depression (STD):**
- U = 0.45
- D = 750 ms
- F = 50 ms

**For Short Term Facilitation (STF):**
- U = 0.15
- D = 50 ms
- F = 750 ms

## Usage

### Adding STP to Synapses

1. **Select synapses** you want to modify
2. **Press `Cmd/Ctrl+E`** to open synapse properties
3. **Set Spike Responder** to "Short term plasticity"
4. **Configure parameters** as needed
5. **Apply changes**

### STP with Different Neuron Types

- **Spiking neurons**: STP responds to actual spikes
- **Rate-based neurons**: STP responds when activation exceeds spike threshold
- **Neuron arrays**: STP can be applied to weight matrices connecting arrays

## Applications

STP is particularly useful for:

- **Temporal dynamics**: Creating time-dependent responses
- **Adaptation**: Allowing networks to adapt to input patterns
- **Memory traces**: Maintaining short-term memory of recent activity
- **Noise reduction**: Filtering out brief, spurious inputs
- **Pattern recognition**: Enhancing sensitivity to temporal patterns

## Integration with Other Features

- **Spike Responders**: STP works with JumpAndDecay spike responders
- **Learning Rules**: Can be combined with long-term learning mechanisms
- **Weight Matrices**: STP can be applied to connections between neuron arrays
- **Visualization**: STP effects are visible in synapse strength displays

## Troubleshooting

**STP not working:**
- Ensure the spike responder is set to "JumpAndDecay"
- Check that the source neuron is actually spiking
- Verify parameter values are reasonable (U between 0-1, D and F positive)

**Too much/too little effect:**
- Adjust the Mean Use parameter (U)
- Modify time constants (D and F) to change response speed
- Check the base synaptic strength

**Performance considerations:**
- STP adds computational overhead
- Consider using it selectively on important connections
- Monitor simulation speed with large networks