---
title: Speech Synthesizer
layout: default
parent: Worlds
has_children: false
nav_order: 100
published: true
---

# Speech Synthesizer

Speech Synthesizer is an experimental world component that produces spoken audio from text, phoneme strings, or articulatory feature vectors. It uses [eSpeak NG](https://github.com/espeak-ng/espeak-ng) for speech output, and can be driven manually or through [couplings](../workspace/couplings). Text couplings can send ordinary text to be pronounced or phoneme strings in [Kirshenbaum notation](https://chromium.googlesource.com/chromiumos/third_party/espeak-ng/+/HEAD/docs/phonemes/kirshenbaum.md). Double-array couplings can send articulatory feature vectors from networks or other components.

Speech Synthesizer is not yet available as a general-purpose component in the standard component menus, but it can be accessed through simulations.

To get a feel for the component, use `Simulations > Language > Synthesizer demo` or `Simulations > Language > NETtalk`.

# Interface

The component window shows the current utterance, a history of spoken text or phoneme strings, and the most recent feature vector received by the synthesizer. The settings section can be expanded to configure voice and decoding options.

- **Currently speaking**: Displays the utterance currently being played, or remains blank when the synthesizer is idle.
- **History**: Shows the accumulated text or phoneme history sent to the synthesizer. The history can be cleared from the component.
- **Most recent feature vector**: Shows the last articulatory feature vector received. This is useful when the component is coupled to a network output layer.
- **Settings**: Contains voice, synthesis, and feature-vector decoding parameters.

# Settings

The following settings are available in the component's settings section.

- **Voice**: Speaking voice or accent. Current options are American (en-us), Received Pronunciation (en-gb-x-rp), Scottish (en-gb-scotland), Lancastrian (en-gb-x-gbclan), West Midlands (en-gb-x-gbcwmd), Caribbean (en-029), New York City (en-us-nyc), and Shavian (en-shaw).
- **Feature decoder**: Decoder used for articulatory feature vectors. The current decoder is Articulatory features, inspired by the NETtalk reading-aloud model.
- **Buffering**: Controls how feature-vector inputs are spoken. Speak each phoneme speaks each decoded phoneme as soon as a feature vector arrives. Buffer until flush signal accumulates decoded phonemes until the feature buffer is flushed, which is useful when a sequence of feature vectors should be spoken as a word-like unit.
- **Max buffer size**: Safety cap on the feature buffer in buffered mode. When the cap is reached, the buffer is automatically flushed.
- **Speed (80-450 wpm)**: Speaking speed in words per minute.
- **Pitch (0-99)**: Voice pitch.
- **Amplitude (0-200)**: Voice volume.

# Inputs

Speech Synthesizer exposes separate input methods for the three supported forms of speech input.

## Text

Plain text input is sent to the synthesizer as ordinary written language. The synthesizer decides how the words should be pronounced.

## Phonemes

Phoneme input bypasses ordinary text-to-pronunciation conversion. This is useful when another model has already produced a phonetic representation or when a simulation needs direct control over pronunciation. The current implementation accepts phoneme strings in [Kirshenbaum notation](https://chromium.googlesource.com/chromiumos/third_party/espeak-ng/+/HEAD/docs/phonemes/kirshenbaum.md).

## Articulatory Feature Vectors

Feature-vector input is a symbolic speech-code representation, not a raw acoustic signal. The current feature vector has 26 values. The first 21 values describe articulatory properties such as place, manner, voicing, vowel quality, and silence. The last 5 values encode stress or syllable information. This representation is inspired by the [NETtalk reading-aloud model](https://papers.cnl.salk.edu/PDFs/NETtalk_%20A%20Parallel%20Network%20That%20Learns%20to%20Read%20Aloud%201988-3562.pdf) and the [UCI NETtalk corpus](https://archive.ics.uci.edu/dataset/150/connectionist%2Bbench%2Bnettalk%2Bcorpus).

This representation sits between [phonetics](https://en.wikipedia.org/wiki/Phonetics) and [phonology](https://en.wikipedia.org/wiki/Phonology). It is phonological in that the vector identifies abstract sound categories used by a language model, but the categories are named for phonetic properties of speech production, especially [articulatory phonetics](https://en.wikipedia.org/wiki/Articulatory_phonetics). The vector does not model continuous tongue, lip, or acoustic motion. It uses binary features that mark whether a phoneme belongs to a class.

The feature names correspond to broad speech-production categories:

- Labial, dental, alveolar, palatal, velar, and glottal describe [place of articulation](https://en.wikipedia.org/wiki/Place_of_articulation), where the vocal tract is constricted for consonants.
- Stop, nasal, fricative, affricate, glide, and liquid describe [manner of articulation](https://en.wikipedia.org/wiki/Manner_of_articulation), how airflow is shaped or obstructed.
- Voiced marks whether the vocal folds vibrate during the sound, the distinction described by [voice](https://en.wikipedia.org/wiki/Voice_(phonetics)).
- High, medium, low, front, central, and back describe [vowel height](https://en.wikipedia.org/wiki/Vowel_height) and [vowel backness](https://en.wikipedia.org/wiki/Vowel_backness), rough positions of the tongue body for vowels.
- Tense marks [vowel tenseness](https://en.wikipedia.org/wiki/Tenseness), a contrast between tense and lax vowel qualities in English-like vowel systems.
- Silent marks a no-sound or continuation position, useful for word boundaries and letters that do not correspond to an audible phoneme.
- The final stress features, `>`, `<`, `0`, `1`, and `2`, are one-hot markers for syllable or [stress](https://en.wikipedia.org/wiki/Stress_(linguistics)) information from the NETtalk-style corpus.

When a feature vector is received, the synthesizer finds the nearest known phoneme pattern and sends that phoneme to eSpeak NG. This allows neural-network outputs to be interpreted as speech-like symbols, including noisy or intermediate outputs, but the vector itself is not directly converted into a waveform.

In buffered mode, each feature vector contributes one decoded phoneme to an internal buffer. The buffer can be spoken by calling the flush input or by sending a flush signal.

# Couplings

Speech Synthesizer can consume and produce values for coupling with other workspace components.

## Consumers

- **speakText**: Speak ordinary text.
- **speakPhonemes**: Speak a phoneme string.
- **speakFeatureVector**: Decode a feature vector to a phoneme and speak or buffer it.
- **flushOnSignal**: Flush the buffered feature-vector phonemes when the incoming signal is at least 1.

## Producers

- **currentUtterance**: Current utterance being played, or an empty string when idle.
- **transcription**: Accumulated text or phoneme history spoken by the synthesizer.
- **featureVector**: Most recent feature vector received by the synthesizer.
