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

- **Mean Use**: Fraction (0 to 1) of available resources consumed to produce the post-synaptic current. This determines how much of the available synaptic resources are used with each spike.

- **Mean Depression**: Time constant in ms for short-term depression (STD). Higher values produce more STD. Depression models the depletion of synaptic resources with repeated spiking.

- **Mean Facilitation**: Time constant in ms for short-term facilitation (STF). Higher values produce more STF. Facilitation models the accumulation of factors that enhance transmission with repeated spiking.

- **Spike Responder**: The underlying spike responder whose jump height is modulated by STP. Currently only Jump and Decay is supported. The STP mechanism sets the maximum response of this responder.

- **U**: Use/Facilitation variable. This state variable tracks the current facilitation level and is visible in the synapse property editor.

- **R**: Depression variable. This state variable tracks the current resource availability and is visible in the synapse property editor.

Typical parameters for modeling STD: U=0.45, D=750ms, F=50ms, with a responder decay of 20ms. For STF: U=0.15, F=750ms, D=50ms.

See the [Scholarpedia article on short-term synaptic plasticity](http://www.scholarpedia.org/article/Short-term_synaptic_plasticity) for more details.