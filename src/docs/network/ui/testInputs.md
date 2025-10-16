---
title: Input Tables
layout: default
parent: UI and Tools
grand_parent: Networks
has_children: false
nav_order: 40
---

# Input Tables

Input tables make it easy to dynamically create and test input patterns for [neurons](../buildingBasics), [neuron groups](../neurongroups/), and [neuron arrays](../arraysMatrices). The interface provides a spreadsheet-like matrix where each row represents an input pattern and each column corresponds to a neuron. This is particularly useful for systematically testing how networks respond to different inputs, debugging unexpected behavior, and validating trained networks against known patterns.

To create an input table, right-click on neurons or a layer and choose `Create input table` (for free neurons) or `Input data` (for layers). The table initializes with an identity matrix, providing a convenient starting point that you can then edit. As you work with your network, you can capture interesting activation patterns by right-clicking on a layer and choosing `Add current pattern to input data`, which appends the current activations as a new row. This makes it easy to build up a collection of test cases based on patterns you discover during experimentation.

Once you have patterns in the table, click `Apply Inputs` to send the current row to your neurons. The table can be edited at any time to add, remove, or modify patterns. For testing sequences of inputs, enable Auto Advance to automatically step through rows, and enable Workspace Mode to trigger a complete network iteration after each input, allowing activity to propagate through connected layers. This workflow makes it simple to systematically explore how your network processes different input sequences.

## Interface

The input table window contains a spreadsheet-like matrix editor and toolbar:

- **Insert Row** / **Delete Row**: Add or remove input patterns
- **Apply Inputs**: Send the current row to target neurons
- **Auto Advance**: Automatically advance to the next row after applying inputs
- **Workspace Mode**: Trigger a complete workspace iteration after applying inputs

## How Inputs Are Applied

Input application depends on whether neurons are clamped:

**Clamped neurons:** Input values are set directly as activations. Neurons maintain these values and do not update, which is useful for holding input patterns constant.

**Unclamped neurons:** Input values are added as inputs. Neurons then process these according to their update rules, with the final activation depending on current state, incoming weights, and update rule.

