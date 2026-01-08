---
title: Short Term Plasticity
layout: default
grand_parent: Networks
parent: Spike Responders
has_children: false
nav_order: 40
---

# Short Term Plasticity

Short term plasticity (STP) is a spike responder that models dynamic changes in synaptic strength based on recent spike history. It can simulate both short-term depression (STD) and short-term facilitation (STF), phenomena observed in biological synapses where the effectiveness of synaptic transmission changes depending on recent activity.

This responder is sometimes referred to as UDF for Use, Depression, and Facilitation, after its three main parameters. It adapts the post-synaptic response based on the availability of synaptic resources (depression) and the buildup of facilitation factors.

## Biological Mechanisms

The model implemented here captures two primary biological mechanisms that operate in opposite directions at the presynaptic terminal:

**Depression** models neurotransmitter depletion. When a neuron fires repeatedly in rapid succession, it progressively depletes its readily available pool of neurotransmitter vesicles. Each action potential releases some fraction of these vesicles, and if the neuron fires again before the vesicles can be replenished, fewer neurotransmitters are available for release. This causes the postsynaptic response to weaken with repeated firing, even though the presynaptic neuron continues to spike. The synapse becomes temporarily less effective until the neurotransmitter pool has time to recover.

**Facilitation** models calcium accumulation in the presynaptic terminal. Each action potential causes calcium ions to flow into the terminal. While most of this calcium is quickly removed, some residual calcium remains for hundreds of milliseconds. This residual calcium makes it easier for neurotransmitter vesicles to fuse with the presynaptic membrane during subsequent spikes. When calcium levels are elevated from recent activity, vesicles bind to the membrane more readily and release their contents more efficiently. This causes the postsynaptic response to strengthen with repeated firing, making the synapse temporarily more effective.

These two mechanisms operate simultaneously but through independent cellular processes. Depression reflects resource limitation (running out of neurotransmitter), while facilitation reflects enhanced release machinery (more efficient vesicle fusion). The balance between these opposing forces determines whether a synapse shows net depression or facilitation during repetitive activity. Synapses with slow neurotransmitter replenishment and fast calcium clearance tend to be depressing, while those with fast replenishment and slow calcium clearance tend to be facilitating. Note that other biological mechanisms can also contribute to short-term plasticity, but these two capture the most prominent effects observed at many synapses.

## Mathematical Model

STP works by modulating the jump height of an underlying spike responder (currently only Jump and Decay is supported). The modulated jump height is computed as:

$$
\text{jumpHeight} = R \cdot w \cdot u
$$

where $$R$$ is the resource availability (depression variable), $$w$$ is the synaptic strength, and $$u$$ is the use variable (facilitation variable).

The facilitation and depression variables are updated after each spike according to:

$$
u = U + u(1-U)e^{ISI/F}
$$

$$
R = 1 + (R - uR - 1)e^{ISI/D}
$$

where $$ISI$$ is the inter-spike interval (time since last spike), $$U$$ is the mean use parameter, $$F$$ is the facilitation time constant, and $$D$$ is the depression time constant.

## Parameters

- **Mean Use**: Fraction of available resources consumed to produce the post-synaptic current. This determines how much of the available synaptic resources are used with each spike.

- **Mean Depression**: Time constant in ms for short-term depression (STD). Higher values produce more STD. Depression models the depletion of synaptic resources with repeated spiking.

- **Mean Facilitation**: Time constant in ms for short-term facilitation (STF). Higher values produce more STF. Facilitation models the accumulation of factors that enhance transmission with repeated spiking.

- **Spike Responder**: The underlying spike responder whose jump height is modulated by STP. Currently only Jump and Decay is supported. The STP mechanism sets the maximum response of this responder.

- **U**: Use/Facilitation variable. This state variable tracks the current facilitation level and is visible in the synapse property editor.

- **R**: Depression variable. This state variable tracks the current resource availability and is visible in the synapse property editor.

## Recommended Settings

**For Short Term Depression (STD):**
- U = 0.45
- D = 750 ms
- F = 50 ms

**For Short Term Facilitation (STF):**
- U = 0.15
- D = 50 ms
- F = 750 ms

For more detailed information on the biological mechanisms and computational models of short-term plasticity, see:
- [Scholarpedia article on short-term synaptic plasticity](http://www.scholarpedia.org/article/Short-term_synaptic_plasticity)
- [Synaptic Plasticity (Wikipedia)](https://en.wikipedia.org/wiki/Synaptic_plasticity#Short-term_plasticity) - Overview of short-term plasticity mechanisms
- [Tsodyks & Markram (1997)](https://doi.org/10.1073/pnas.94.2.719) - Classic paper introducing the computational model used here
- [Zucker & Regehr (2002)](https://doi.org/10.1146/annurev.physiol.64.092501.114547) - Comprehensive review of short-term synaptic plasticity