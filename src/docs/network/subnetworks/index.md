---
title: Subnetworks
layout: default
parent: Networks
has_children: true
nav_order: 130
---

# Subnetworks

Subnetworks are a special kind of network model that can encompass multiple [neuron groups](../neurongroups), [synapse groups](../synapsegroups), [neuron arrays](../arraysMatrices), [weight matrices](../arraysMatrices), and custom update rules. They appear in the network with an outline around their components and a custom interaction box that shows the subnetwork name.

<!-- TODO: Add image -->

Subnetworks provide a way to organize complex network structures and implement specialized algorithms like backpropagation, self-organizing maps, and restricted Boltzmann machines. Some subnetworks include built-in training capabilities accessible through their interaction box.

For more information on specific types of subnetwork, see the items in the menu on the right.

The input nodes of many subnetworks are, by default, clamped. This makes it easier to manually set and test their values. However, if you want to connect other neurons to the input nodes of a subnetwork, you should unclamp the input neurons.

# Common Menu Items

Right-click on a subnetwork's interaction box to access these common menu items. Specific subnetworks may have additional menu items described on their individual pages.

- **Clear (C):** Clear all activations in the subnetwork (set to 0).
- **Randomize (R):** Randomize the subnetwork using its specific randomization logic. Some subnetworks (like Hopfield and Restricted Boltzmann Machine) have their own built-in randomizers that are used instead of the network preference randomizers. Other subnetworks use the default randomizers configured in [network preferences](../ui/networkPreferences#randomizers).
- **Cut:** Copy the subnetwork and delete it.
- **Copy:** Copy the subnetwork to buffer so it can be pasted.
- **Rename:** Rename the subnetwork.
- **Remove:** Delete the subnetwork.
- **Edit:** Open the editor dialog for the subnetwork.




