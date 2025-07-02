---
title: Synapse Groups
layout: default
parent: Networks
has_children: false
nav_order: 100
---

# Synapse Groups

Synapse groups are colletions of synapses linking a source to a target [neuron group or collection](./neurongroups). In a large network, operating on synapses individually would be impractical; synapse Groups offer a way to manipulate all synapses in a group at once.

Synapse groups are associated with a [connection strategy](../connections.html), which holds randomizers and parameters related to the connectivity of the synapse group. Thus you can specify these parameters and adjust and reapply them incrementally, for example slowing increasing the sparsity of a connection.

<!-- TODO: Show some pics -->

Synapse groups are created in the same way synapses are. See [building basics](buildingBasics). You can select a source neron group and press `1` and target neuron group and press `3` or use appropriate menu commands.

## Synapse Group Properties

The synapse group dialog contains four tabs, each of which links to another component used elsewhere in Simbrain, with an apply button that applies changes to the group.

**Weights:** Allows you to edit the individual synapse strengths using a [synapse adjustment dialog](networkDialogs)

**Update Rule:** Allows you to set all of the update rules (that is, local learning rules) of the synapses in this group at once. Note that only one rule can be specified in this dialog. If multiple rules are desird then synapses must be made visible and edited directly, or a [custom simulation](../simulations) can be used.

**Connection Strategy:** See [connection strategy](connections). Each synapse group is associated with a connection strategy that can be incrementally adjusted.

**Weight Matrix:** Allows you to edit the individual synapse strengths using a [weight matrix editor](networkDialogs)



## Right Click Menu

**Edit:** Edit group properties. This opens the group properties panel which includes the above sections. This is the same as double-clicking on the interaction box.

**Delete Synapse Group:** Delete the group.

**Rename Synapse Group:** Change the name of the synapse group

**Select Synapses:** Select all neurons in the group. Suggest using this primarily when synapses are [visible](#synapseVisibility).

**Select Incoming Neurons:** Selects all pre-synaptic neurons for synapses in this group.

**Select Outgoing Synapses:** Selects all post-synaptic neurons for synapses in this group.

**Adjust synapses:** Opens the [synapse adjustment panel](../weightVisualization.html#adjustSynapseDialog) for this group of synapses. But note that it is suggested that the synapse group dialog be preferred for this kind of manipulation and visualization.

**Show Weight Matrix:** Shows the [weight matrix viewer](../weightVisualization.html#weightMatrixViewer) for this group of synapses.

**Freeze / Unfreeze synapses:** [Freezes or unfreezes](../synapse.html#Frozen) all synapses in this group. Learning will cease.

**Enable / Disable synapses:** [Enables or disables](../synapse.html#Enabled) all synapses in this group. They will stop passing information along; functionally equivalent to (temporarily) removing the group.

**Toggle synapse visibility:** Toggles [synapse visibility](#synapseVisibility).

**Send Vector Coupling To:** Copies all activation values in the synapse group and represents them as a vector where each element in the vector is the activation value of a single synapse in the group. This creates a coupling such that this vector is forwarded to some other component in Simbrain. See the [couplings](../../workspace/Couplings.html) page.

**Receive Vector Coupling from:** Takes some vector forwarded from some other component and sets the activation values of the synapsess in the group based on the incoming vector.


