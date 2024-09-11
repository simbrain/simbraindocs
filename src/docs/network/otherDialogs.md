---
title: Other dialogs
layout: default
parent: Networks
has_children: false
nav_order: 100
---

# Other Dialogs

Some of these dialogs also exist as panels in other dialogs.

# Synapse Adjustment Dialog

This is the main dialog for adjusting collections of weights. The dialog is invoked by selecting a group of weights and clicking `ctrl/cmd-R` or in association with a [synapse group](synapsegroups).

The top part of this dialog shows a [statistics panel](#statistics-panel) for the selected set of synapses. The tabbed panels can be used to adjust the synapses in various ways, in each case by pressing an `Apply` button. Changes are shown immediately in the statistics panel.

Note: If applied to weights whose source neuron is excitatory or inhibitory and thus shows up with a red or blue border (see [polarity](neurons/#polarity)), changes made in the panel can be be "flipped" to respect that neuron's polarity. Thus, for example, if you set the weights on a fully connected set of inhibitory neurons to a distribution with mean 1, the result will be a distriution of weights with mean -1. 

<img src="/assets/images/synapseAdjustmentPanel.png" alt="Synapse Adjustment Panel" style="width:400px;"/>

## Statistics Panel

The top part of the adjust synapses tab shows basic statistics about a populations of synapses, including a [histogram](../plots/histogram). The histogram and stats can be configured to focus on excitatory, inhibitory, or both kinds of synapse:

- **Both**: Show all synapses, regardless of whether they are excitatory or inhibitory, and modify all at once.
- **Overlay**: If "Overlay" is selected, it will display these values for all synapses in the group, using the absolute value of all inhibitory weight values.
- **Excitatory**: Show only weights with strength above 0.
- **Inhibitory**: Show only weights with strenth below 0.

## Randomizer

Use a [randomizer](../utilities/randomizers) to select a probability distribution and use it to set weight strengths.

## Perturber

Use a [randomizer](../utilities/randomizers) to select a probability distribution and use it to add values to weight strengths.

## Pruner

Remove all synapses whose absolute value is below the provided threshold by pressing the `prune` button. For example, if the threshold is $$.25$$ and a weight is $$.1$$ or $$-.1$$, it will be removed.

## Scaler

Scale all synapse values up or down by changing their strengths as much as the indicated percentage.

## Polarizer

Change the set of weights to have the indicated ratio of excitatory to inhibitory. The polarizer attempts to produce a ratio that is consistent with the polarity of source neurons, if polarized soure neurons are used. See [Excitatory / Inhibitory Ratio](#excitatory--inhibitory-ratio).

# Weight Matrix Viewer

The weight matrix viewer allows weights connecting two sets of neurons to be viewed in a tabular format. They can be used either for **free neurons** or within **synapse groups**.

One can manipulate the strength of connections through the weight matrix viewer. Clicking on a cell allows one to manipulate the synaptic strength of the connection represented by the cell. Cells can also be selected (e.g. using `ctrl/command-A`) or shift-selected, and then groups of them randomized or otherwise altered. Values can also be loaded from a .csv file. Their values can also be saved to a .csv file (see toolbar below)

### Weight Matrix Viewer for Free Neurons

To view the synapses connecting two sets of loose neurons set **source and target neurons** and then select Show Weight Matrix from the insert menu or by right clicking on any of the relevant neurons. Cells in the table correspond to connections between source (red) neurons as rows and target (green) neurons as columns. Values in these cells represent the strengths of connections. Non-existent connections are represented by gray boxes (see the image below).

### Synapse Group Weight Matrix Viewer

In this context the matrix represents the weights of a **synapse group**, which connects a source and target neuron group. Cells in the table correspond to connections between neurons in the source neuron group (rows) and target neuron group (column). Values in these cells represent the strength of connections.

Note: Currently the weight matrix viewer is disabled for synapse groups with more than 10,000 synapses. This is due to the fact that a table of that size would be unnavigable, and of dubious use. At that size individual synapses are much less important. This is also to prevent users from accidentally attempting to view _extremely_ large tables (much greater than 10,000 entries), which can cause the JVM to run out of memory.


### Weight Matrix Viewer Toolbar

- **Randomize**: Pressing the Random button will uniformly randomize the strength of all connections represented in the weight matrix viewer between two numbers (default (1,-1))

- **Preferences**: Pressing the Preferences button will allow one to set the upper and lower bounds on the viewer's randomize function.

- **Open**: Pressing the Open button allows one to open a .csv file and set the values of the connections represented by the viewer to the values specified in the file. The .csv being loaded must have the same dimensions as the weight matrix of the synapse group.

- **Save**: Pressing the Save button allows one to save the weight matrix as a .csv file.



# Excitatory / Inhibitory Ratio

This panel or dialog changes the ratio of excitatory and inhibitory synapses in a set of weights. A main slider bar determines this percentage of excitatory weights. The two text fields can also be used to set more precise ratios.

This can be thought of as a way of **polarizing** a set of weights. This is straightforward in the case of nonpolar neurons, which is more common. But when neurons are excitatory or inhibitory the underlying logic is more complex, and attempts to create the requested ratio in a way that respects the polarity of the neurons.  
