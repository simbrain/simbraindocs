---
title: Winner Take All
layout: default
grand_parent: Networks
parent: Neuron Groups
has_children: false
nav_order: 50
---

# Winner-Take-All Network

The neuron with the highest **weighted input** in a winner-take-all network takes on an upper value, while all other neurons take on the lower value. In case of a tie, the node that wins is chosen randomly.

## Initialization

When creating a WTA network, you can specify how many neurons are in the network and also values for the parameters listed below. The standard [layouts](../layouts.html) are also available.

## Parameters

**Number of Units:** The number of units in the network.

**Lower Value:** The activation of any node which does not have the greatest weighted input.

**Upper Value:** The activation of the node which has the greatest weighted input.

**Set Winner Randomly:** If selected, there is some chance that the winner is chosen randomly.

**Probability of choosing a random winner:** When "set winner randomly" is selected, this is the probability of randomly choosing a winner.

## Creation/Edit Dialog

Click **here** for listing.

## Right Click Menu

Click **here** for listing.
