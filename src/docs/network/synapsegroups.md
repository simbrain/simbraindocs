---
title: Synapse Groups
layout: default
parent: Networks
has_children: false
nav_order: 110
---

# Synapse Groups

Synapse groups are collections of synapses linking a source to a target [neuron group or collection](./neurongroups). In a large network, operating on synapses individually would be impractical; synapse groups offer a way to manipulate all synapses in a group at once.

## Transient Wrapper Concept

Synapse groups act as lightweight, transient wrappers around collections of synapses. They provide organizational structure to group related synapses for easier management and enable batch operations to apply changes to all synapses simultaneously. They track relationships between source and target neuron collections and control visibility of individual synapses within the group.

The transient nature means synapse groups can be created, modified, and deleted without affecting the underlying synapse data structure, making them flexible organizational tools.

## Connection Strategy Integration

Synapse groups are associated with a [connection strategy](connections), which holds randomizers and parameters related to the connectivity of the synapse group. This allows you to specify connection parameters such as probability distributions, distance functions, and connectivity patterns. You can make incremental adjustments by modifying parameters and reapplying them (for example, slowly increasing sparsity), and dynamically reconfigure the group by changing connection strategies without recreating the entire group.

## Excitatory/Inhibitory Separation

Synapse groups automatically handle [polarity](neurons#polarity) management. Synapses are assigned excitatory or inhibitory properties based on source neuron polarity. Group operations respect individual synapse polarities, and the entire group's polarity balance can be adjusted through connection strategy parameters.

<!-- TODO: Show some pics -->

Synapse groups are created in the same way synapses are. See [building basics](buildingBasics). You can select a source neuron group and press `1` and target neuron group and press `3` or use appropriate menu commands.

## Synapse Group Properties

The synapse group dialog contains four tabs, each of which links to another component used elsewhere in Simbrain, with an apply button that applies changes to the group.

- **Weights**: Allows you to edit the individual synapse strengths using a [synapse adjustment dialog](synapses/synapseAdjustment)

- **Update Rule**: Allows you to set all of the update rules (that is, local learning rules) of the synapses in this group at once. Note that only one rule can be specified in this dialog. If multiple rules are desired then synapses must be made visible and edited directly, or a [custom simulation](../simulations) can be used.

- **Connection Strategy**: See [connection strategy](connections). Each synapse group is associated with a connection strategy that can be incrementally adjusted.

- **Weight Matrix**: Allows you to view and edit synapse strengths in a tabular format. Cells represent connections between source neurons (rows) and target neurons (columns). Values can be edited directly, randomized, or loaded/saved from .csv files. The viewer can be opened from the synapse group properties dialog or by right-clicking on a synapse group and selecting `Show weight matrix...`.



## Right Click Menu

- **Edit synapse group...**: Edit group properties. This opens the group properties panel which includes the above sections. This is the same as double-clicking on the interaction box.

- **Delete synapse group**: Delete the synapse group

- **Rename synapse group...**: Change the name of the synapse group

- **Select synapses**: Select all synapses in the group. Primarily useful when synapses are visible.

- **Select incoming neurons**: Selects all pre-synaptic neurons for synapses in this group

- **Select outgoing neurons**: Selects all post-synaptic neurons for synapses in this group

- **Show weight matrix...**: Shows the weight matrix viewer for this group of synapses

- **Clamp / Unclamp synapses**: Clamps or unclamps all synapses in this group. When clamped, learning will cease.

- **Enable / Disable synapses**: Enables or disables all synapses in this group. When disabled, they stop passing information along (functionally equivalent to temporarily removing the group).

- **Toggle synapse visibility**: Toggles whether individual synapses in the group are visible

- **Couplings**: Create couplings to send or receive data from other Simbrain components (see [couplings](../../workspace/couplings.html))


