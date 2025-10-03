---
title: Text World
layout: default
parent: Worlds
has_children: false
nav_order: 100
---

# Text World

Text World transforms text into numbers and numbers into text, primarily for modeling language processing. It enables networks to "read" text, produce simulated speech, and develop connectionist models of language. Text World can also be used more generally to incorporate text processing into simulations, for example to log information or issue commands to networks.

The component uses **token embeddings** that associate text tokens with vector representations, which can be coupled to neural networks and other components via [couplings](../workspace/couplings).

Example simulations: See `simulations > NLP` for demonstrations of Text World functionality.

<img src="/assets/images/textWorld.png" alt="Text World" style="width:500px;"/>

# Creating a Text World

To create a new Text World component:

- `Insert > New World > Text World` from the menu
- Right click on the desktop and select `Insert > New World > Text World`
- Click on the world icon and select `Text World`

# Token Embeddings

Text World uses **token embeddings** to associate string tokens (words, characters, or subwords) with vector representations. Each token maps to a vector of numbers that can be consumed by neural networks. The token embedding can be viewed and edited via `View > Word embedding editor...`

## Embedding Types

Text World supports three embedding types, each with different properties:

### One-Hot Encoding

Each token maps to a unique vector with a single 1 and zeros elsewhere. This creates an identity matrix where each token has a distinct, orthogonal representation.

- **Remove stopwords**: If enabled, common words (e.g., "the", "and") are excluded from the embedding
- **Convert all upper case to lower case**: If enabled, all tokens are normalized to lowercase

One-hot encoding is simple and efficient for small vocabularies but becomes impractical for large vocabularies due to the high dimensionality (one dimension per unique token).

### Co-Occurrence

Creates dense vector representations based on word co-occurrence patterns in a training document. Words that appear in similar contexts will have similar vector representations.

- **Window size**: Context window size in tokens (minimum: 1). Determines how far to look for co-occurring words.
- **Bidirectional**: If true, considers context both before and after each token. If false, only considers preceding context.
- **Use PPMI**: If true, applies Positive Pointwise Mutual Information transformation to reduce the impact of frequent but uninformative co-occurrences.
- **Remove stopwords**: If enabled, common words are excluded before building the co-occurrence matrix
- **Convert all upper case to lower case**: If enabled, normalizes all tokens to lowercase

Co-occurrence embeddings capture semantic relationships between words based on distributional similarity. Larger window sizes capture broader topical relationships, while smaller windows capture tighter syntactic relationships. PPMI weighting is generally recommended for better semantic representations.

### Custom

Allows loading pre-trained embeddings from external sources (e.g., Word2Vec, GloVe). Custom embeddings must be manually loaded from files.

- **Remove stopwords**: Excluded in custom embeddings
- **Convert all upper case to lower case**: Normalization setting for custom embeddings

Use custom embeddings when you need pre-trained, high-quality word vectors trained on large corpora. These typically provide better semantic representations than can be achieved from small training documents.

## Tokenizers

Tokenization determines how text is split into individual tokens. Text World supports multiple tokenization strategies:

- **Simple Tokenizer**: Splits text on whitespace and punctuation boundaries. Configurable options for handling punctuation, spaces, and newlines.
- **Byte Pair Encoding (BPE)**: Advanced subword tokenization that learns merge rules from training text. BPE can handle unknown words by breaking them into known subword units.

The tokenizer can be configured via the `Preferences` dialog or when extracting embeddings from a document.

## Extracting Embeddings from Documents

To create an embedding from a text document:

1. Use the `Extract embedding...` toolbar button (or through the coupling menu when creating a new text world)
2. Select a training document (`.txt` file)
3. Configure the embedding type (One-Hot, Co-Occurrence, or Custom)
4. Configure the tokenizer options
5. The embedding will be generated from the unique tokens found in the document

The training document should be representative of the vocabulary and language patterns you want to model. Larger documents generally produce better co-occurrence embeddings.

# Display Options

Text World provides several options for visualizing tokens in the main text area. These can be configured via `Edit > Preferences`:

- **Auto advance**: If true, automatically advance to the next token on each workspace update. This allows the text to be "read" sequentially during simulation.

- **Highlight current token**: If true, highlight the currently selected token with a background color. This provides visual feedback about which token is currently active for couplings.

- **Show token boundaries**: If true, draw rectangles around each token to show how the text has been tokenized. Useful for understanding how the tokenizer is parsing the text.

- **Stop at end**: If true, stop workspace updates when the end of the text is reached. If false, the position wraps back to the beginning.

# Sampling Strategy

When consuming probability vectors from a network (e.g., language model outputs), Text World can sample tokens from the distribution using different strategies. This is configured via `Edit > Preferences`:

- **Greedy**: Always selects the most probable token. Deterministic and produces the most likely output, but can be repetitive.

- **Top-K Sampling**: Samples from the top K most probable tokens. The `k` parameter controls how many tokens to consider (higher values increase diversity).

- **Top-P Sampling** (Nucleus Sampling): Samples from the smallest set of tokens whose cumulative probability exceeds threshold `p`. The `p` parameter controls the probability threshold (typical value: 0.9). Higher values include more tokens and increase diversity.

Sampling strategies are primarily relevant when using Text World for text generation with neural language models. Greedy produces the most predictable output, while Top-K and Top-P balance between probable completions and creative variety.

# Couplings

Text World supports both producing and consuming data:

- **Producing vectors**: The current token's vector representation can be sent to neurons or neuron groups. Use `Edit > Create TextWorld Coupling` to create producer couplings. The `currentVector` producer sends the embedding vector for the currently selected token.

- **Consuming vectors**: Vector data from networks can be matched to the closest token in the embedding, which is then displayed in the text area. The `displayClosestWord` consumer finds the nearest neighbor in the embedding space.

- **Producing strings**: The current token as a string can be sent to other components via the `currentToken` producer.

- **Consuming strings**: Text can be added to the text area via the `addTextAtCursor` or `addTextAtEnd` consumers.

- **Record embeddings**: Text World can send its vector sequence to a Data World for recording. Use `Edit > Record word embeddings` to create this coupling automatically.

- **Couple plots**: Token vectors can be sent directly to plot components for visualization. Use `Edit > Couple Plots` to create plot couplings (e.g., projection plots to visualize word vector spaces).

# Menu Commands

## File Menu

- **Import from xml**: Import Text World configuration from a `.xml` file
- **Export to xml**: Export Text World configuration to a `.xml` file
- **<span id="load-text">Load text...</span>**: Load text content from a `.txt` file into the text area
- **Rename**: Rename the current Text World window
- **Close**: Close the current Text World window

## Edit Menu

- **<span id="find-replace">Find / Replace...</span>** (**Ctrl/Cmd+F**): Open find and replace dialog to search for text patterns and replace them
- **Record word embeddings**: Create a coupling to a Data World component that records the token vector sequence over time
- **Couple Plots**: Create couplings to plot components for real-time visualization of token embeddings (e.g., projection plots)
- **Create TextWorld Coupling**: Open the coupling interface to create connections between Text World and other components
- **<span id="preferences">Preferences</span>**: Open the preferences dialog to configure display options, tokenizer, sampling strategy, and other settings

## View Menu

- **<span id="word-embedding-editor">Word embedding editor...</span>**: Open a table view to inspect and manually edit the token-to-vector mappings. This shows the complete embedding matrix with tokens as rows and vector dimensions as columns.

## Help Menu

- **Help**: Link to this documentation page

## Toolbar

- **Word embedding editor**: [Word embedding editor...](#word-embedding-editor)
- **Text World Preferences**: [Preferences](#preferences)



