---
title: Worlds
layout: default
has_children: true
nav_order: 40
---

# Worlds

Worlds are components that interact with Network components by giving and/or receiving information. They provide environmental contexts for neural networks, from simple data storage to complex virtual environments.

# Available World Types

## Data and Text Worlds
- [Data World](dataworld) - Store and manipulate tabular data
- [Text World](textworld) - Language processing and token embeddings

## Sensory Worlds
- [Image World](imageworld) - Visual processing and image filtering
- [Sound World](soundworld) - Audio processing and sound analysis
- [Odor World](odorworld) - 2D virtual environment for agents

# Common Features

All worlds can be [coupled](../workspace/couplings) to networks to exchange information. They typically provide:

- **Inputs to networks**: Sensory data, stored values, or environmental states
- **Outputs from networks**: Actions, predictions, or processed information
- **Interactive interfaces**: Real-time manipulation and visualization
