---
title: Sound World
layout: default
parent: Worlds
has_children: false
nav_order: 100
published: false
---

# Sound World

Sound World is an experimental component that generates audio output in response to signals from neural networks and other components via [couplings](../workspace/couplings). It provides a way to sonify network activity and create simple audio feedback for simulations.

The component currently supports a **Beeper** sound generator that produces sine wave tones with configurable frequency, duration, and volume. Sound World allows networks to control these parameters dynamically, making it useful for experiments in sensory feedback, auditory learning, and real-time audio synthesis.

# Creating a Sound World

To create a new Sound World component:

- `Insert > New World > Sound World` from the menu
- Right click on the desktop and select `Insert > New World > Sound World`
- Click on the world icon and select `Sound World`

# Beeper Sound Generator

The Beeper generates simple sine wave tones (beeps) with configurable properties. Each beep is a pure tone at a specified frequency, played for a specified duration at a specified volume.

## Properties

The following properties can be configured by opening the Sound World preferences or editing the Beeper directly:

- **Duration**: Length of each beep in seconds
- **Max Duration**: Maximum allowed duration for safety (prevents excessively long beeps)
- **Frequency**: Frequency of the sine wave tone in Hz (higher values = higher pitch)
- **Volume**: Volume level from 0.0 (silent) to 1.0 (maximum)

## Couplings

Sound World provides several consumer couplings that allow other components (primarily networks) to trigger sounds and control their properties:

- **playBeepAtVolume**: Play a beep with a specified volume. The incoming value (0.0 to 1.0) sets the volume for that beep.
- **playBeepAtFrequency**: Play a beep at a specified frequency. The incoming value (in Hz) sets the pitch of the beep.
- **playBeepForDuration**: Play a beep for a specified duration. The incoming value (in seconds) sets how long the beep lasts.

These couplings allow networks to generate audio feedback based on their activity. For example, you could couple neuron activation to frequency to create a pitch that varies with neural activity, or couple to volume to create sounds that get louder as neurons activate more strongly.

# Menu Commands

## File Menu

- **Import from xml**: Import Sound World configuration from a `.xml` file
- **Export to xml**: Export Sound World configuration to a `.xml` file

## Help Menu

- **Help**: Link to this documentation page

# Example Use Cases

- **Auditory feedback**: Provide audio feedback for network learning or behavior (e.g., beep when a network reaches a target state)
- **Sonification**: Convert network activity patterns into sound to understand dynamics through auditory perception
- **Conditioning experiments**: Create auditory stimuli paired with network inputs for conditioning simulations
- **Real-time monitoring**: Monitor network activity through sound while focusing visual attention elsewhere

Note: Sound World is marked as experimental. The current implementation provides basic beeper functionality, and additional sound generation capabilities may be added in future versions. 