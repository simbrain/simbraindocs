---
title: Short Term Plasticity
layout: default
grand_parent: Networks
parent: Synapses
has_children: false
nav_order: 80
published: false
---

# Short Term Plasticity

Short Term Plasticity (STP) models transient changes in synaptic strength that occur on short timescales, distinct from long-term plasticity mechanisms like Hebbian learning. STP can model both **Short Term Depression (STD)** and **Short Term Facilitation (STF)**, sometimes referred to as "UDF" for Use, Depression, and Facilitation.

## Biological Mechanisms

The model implemented here captures two primary biological mechanisms that operate in opposite directions at the presynaptic terminal:

**Depression** models neurotransmitter depletion. When a neuron fires repeatedly in rapid succession, it progressively depletes its readily available pool of neurotransmitter vesicles. Each action potential releases some fraction of these vesicles, and if the neuron fires again before the vesicles can be replenished, fewer neurotransmitters are available for release. This causes the postsynaptic response to weaken with repeated firing, even though the presynaptic neuron continues to spike. The synapse becomes temporarily less effective until the neurotransmitter pool has time to recover.

**Facilitation** models calcium accumulation in the presynaptic terminal. Each action potential causes calcium ions to flow into the terminal. While most of this calcium is quickly removed, some residual calcium remains for hundreds of milliseconds. This residual calcium makes it easier for neurotransmitter vesicles to fuse with the presynaptic membrane during subsequent spikes. When calcium levels are elevated from recent activity, vesicles bind to the membrane more readily and release their contents more efficiently. This causes the postsynaptic response to strengthen with repeated firing, making the synapse temporarily more effective.

These two mechanisms operate simultaneously but through independent cellular processes. Depression reflects resource limitation (running out of neurotransmitter), while facilitation reflects enhanced release machinery (more efficient vesicle fusion). The balance between these opposing forces determines whether a synapse shows net depression or facilitation during repetitive activity. Synapses with slow neurotransmitter replenishment and fast calcium clearance tend to be depressing, while those with fast replenishment and slow calcium clearance tend to be facilitating. Note that other biological mechanisms can also contribute to short-term plasticity, but these two capture the most prominent effects observed at many synapses.

For more detailed information on the biological mechanisms and computational models of short-term plasticity, see:
- [Synaptic Plasticity (Wikipedia)](https://en.wikipedia.org/wiki/Synaptic_plasticity#Short-term_plasticity) - Overview of short-term plasticity mechanisms
- [Tsodyks & Markram (1997)](https://doi.org/10.1073/pnas.94.2.719) - Classic paper introducing the computational model used here
- [Zucker & Regehr (2002)](https://doi.org/10.1146/annurev.physiol.64.092501.114547) - Comprehensive review of short-term synaptic plasticity

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

- **Mean Use**: Fraction of available resources consumed to produce the post-synaptic current.
- **Mean Depression**: Time constant in ms for short term depression (STD). Higher values produce more STD.
- **Mean Facilitation**: Time constant in ms for short term facilitation (STF). Higher values produce more STF.
- **Spike Responder**: Short term plasticity sets the max response of this responder (typically JumpAndDecay with convolution enabled).

## Recommended Settings

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