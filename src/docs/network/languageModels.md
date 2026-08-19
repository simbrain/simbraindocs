---
title: Language Models
layout: default
parent: Networks
has_children: false
nav_order: 200
---

# Language Models

Language models, which encompass [large language models (LLMs)](https://en.wikipedia.org/wiki/Large_language_model) like ChatGPT, use the modern [transformer architecture](https://en.wikipedia.org/wiki/Transformer_(deep_learning_architecture)) to generate natural language. Simbrain includes two LLM simulations that make a model's running computation visible on the network canvas.

`Simulations > Language > Tiny Language Model` is a small GPT-style transformer for learning. It begins untrained, so you can choose your own text, train it, and run it to generate text and observe how it works.

`Simulations > Language > (Beta) Pretrained Language Model (LFM2.5)` runs the pretrained [LFM2.5-230M](https://huggingface.co/LiquidAI/LFM2.5-230M) model locally with a [Text World](../worlds/textworld) context window. While the tiny language model is more or less a toy model that reproduces the text it is trained on, with limited generalization, LFM is a full working model, akin in performance to early versions of [GPT](https://en.wikipedia.org/wiki/Generative_pre-trained_transformer).

Click a tile or operation glyph to select it, drag empty space to marquee-select, drag a tile to rearrange the diagram, and double-click a tile to trace its input and output paths. Hovering reveals values, shapes, selected-head information, and operation descriptions.

**Note:** This documentation page is still being developed. If you have corrections or comments, please contact us.

## The LLM Engine

Under the hood, these LLM simulations use a tensor-based engine that complements Simbrain's usual neuron, array, and trainer libraries. It represents transformer computations as explicit tensor operations, with an operation plan and training tape for the small teaching model. Its tensors use [off-heap storage](https://docs.oracle.com/en/java/javase/22/core/heap-and-heap-memory.html), outside Java's normal garbage-collected heap, and [BLAS](https://en.wikipedia.org/wiki/Basic_Linear_Algebra_Subprograms) operations. This makes it practical to run the same style of matrix calculations used by contemporary language models while preserving intermediate values for training and inspection.

The pretrained simulation loads the model's original [safetensors](https://huggingface.co/docs/safetensors/index) weights and [tokenizer](https://huggingface.co/docs/tokenizers/index) rather than converting them into a conventional Simbrain training network. The engine can execute those weights locally, retain the activations and caches needed for generation, and expose weights, tensor values, operations, attention heads, and next-token predictions through the diagram.

## Main Components

Language-model diagrams are necessarily dense: a single generated token passes through many learned projections, normalization steps, attention heads, caches, and residual additions.

Data flows from bottom to top in all three figures.

The tiny language model contains most of the components shown below.

<img src="/assets/images/llm/tiny-language-model-full-vocabulary.png" alt="Tiny language model diagram with a full 90-token next-token probability card, residual stream, attention heads, MLP branch, and learned parameters" style="width:800px;"/>

LFM2 has two main displays, depending on whether an attention or convolutional layer is selected. This is the attention-layer view.

<img src="/assets/images/llm/lfm2-attention-view.png" alt="Pretrained LFM2 attention-layer view showing the depth strip, residual stream, query, key, value, caches, attention heads, and MLP" style="width:800px;"/>

This is the convolutional-layer view. Its [one-dimensional convolution](convolutionalNeuralNetworks) moves a short, shared kernel across nearby tokens. Like image convolutions, it preserves local structure through weight sharing, but avoids the full pairwise attention calculation and its intermediate activations.

<img src="/assets/images/llm/lfm2-convolution-view.png" alt="Pretrained LFM2 convolution-layer view showing the depth strip, residual stream, convolution projection, kernel, cache window, and MLP" style="width:800px;"/>


## Diagram Legend

This section defines the main interface elements.

- **[Tensor tile](arraysMatrices)**: A colored rectangle showing a tensor. Hover over a cell to see its exact value. Tall activation tiles have one row per token or context position; a dashed border marks a magnified view.
- **Token history**: In pretrained LFM2, many tall-tile rows are a retained display history. The model normally holds only the current token's activations plus the state required for future tokens. Its context menu can ghost or hide the recorded rows to make that distinction visible.
- **Residual stream**: The wide vertical tiles are the model's shared working state. The straight vertical ribbons are skip connections, and each branch returns a correction to this stream.

  <img src="/assets/images/llm/logit-lens.png" alt="Two residual-stream tiles, their addition junctions, and logit-lens token readouts beside the residual stream" style="width:330px;"/>

- **[Parameter tile and bias strip](arraysMatrices)**: A heavier orange border marks learned weights. A narrow orange-bordered strip is a bias vector. The tiny language model updates these during training; pretrained LFM2 displays existing weights but does not train them.
- **Connector ribbon**: A gray ribbon carries a tensor between tiles. A group of faint ribbons beside it represents parallel head-wise streams. Tick marks and colored segments show how a tensor is partitioned into heads or fused projection chunks.
- **<img src="/assets/images/llm/glyphs/op-add.svg" alt="Addition glyph" style="width:24px; vertical-align:middle;"/> Addition**: Adds inputs, including the corrections that update the residual stream.
- **<img src="/assets/images/llm/glyphs/op-multiply.svg" alt="Multiplication glyph" style="width:24px; vertical-align:middle;"/> Multiply**: Matrix multiplication for a projection, or element-wise multiplication where a branch combines values.
- **<img src="/assets/images/llm/glyphs/op-layer-norm.svg" alt="Layer normalization glyph" style="width:24px; vertical-align:middle;"/> [Layer normalization](https://arxiv.org/abs/1607.06450)**: Normalizes a token representation before a transformer operation.
- **<img src="/assets/images/llm/glyphs/op-layer-norm.svg" alt="Normalization glyph" style="width:24px; vertical-align:middle;"/> <img src="/assets/images/llm/glyphs/op-rotate.svg" alt="Rotation glyph" style="width:24px; vertical-align:middle;"/> Normalize and position attention heads**: This two-part glyph in LFM2 first RMS-normalizes each query or key head, then applies rotary position encoding (RoPE), so attention can use both content and token position.
- **<img src="/assets/images/llm/glyphs/op-softmax.svg" alt="Softmax glyph" style="width:24px; vertical-align:middle;"/> [Softmax](arraysMatrices/softmax)**: Converts scores into a normalized distribution, including the attention distribution.
- **<img src="/assets/images/llm/glyphs/op-cross-entropy.svg" alt="Cross-entropy loss glyph" style="width:24px; vertical-align:middle;"/> [Cross-entropy](learning/trainingParameters)**: Compares a tiny language model prediction with its target during training.
- **<img src="/assets/images/llm/glyphs/op-embed.svg" alt="Embedding lookup glyph" style="width:24px; vertical-align:middle;"/> [Embedding lookup](../worlds/textworld#token-embeddings)**: Converts a token into its vector representation.
- **<img src="/assets/images/llm/glyphs/op-relu.svg" alt="ReLU glyph" style="width:24px; vertical-align:middle;"/> [ReLU](https://en.wikipedia.org/wiki/Rectifier_(neural_networks))**: Applies a rectified linear activation, keeping positive values and replacing negative values with zero.

  <img src="/assets/images/llm/relu-badge.png" alt="Hidden activation tile with a ReLU badge directly above it" style="width:220px;"/>

- **<img src="/assets/images/llm/glyphs/op-split.svg" alt="Split heads glyph" style="width:24px; vertical-align:middle;"/> Split heads**: Divides a representation into independent attention heads.
- **<img src="/assets/images/llm/glyphs/op-merge.svg" alt="Merge heads glyph" style="width:24px; vertical-align:middle;"/> Merge heads**: Recombines attention heads for the output projection.
- **<img src="/assets/images/llm/glyphs/op-cache-write.svg" alt="Cache-write glyph" style="width:24px; vertical-align:middle;"/> Update attention memory**: In LFM2, this arrow-into-a-tray glyph splits the current key or value vector into head segments and appends them as a new row in the key/value cache. Later tokens attend to those cached rows.
- **[Q, K, and V routes](https://arxiv.org/abs/1706.03762)**: Wq, Wk, and Wv are learned projections. Their output tiles are query, key, and value. Query and key form attention scores; softmax normalizes them; those weights mix the values.

  <img src="/assets/images/llm/qkv-connectors.png" alt="Close view of query, key, and value projection connectors, their weights, operation glyphs, tensor tiles, and the attention deck" style="width:800px;"/>

- **<img src="/assets/images/llm/glyphs/stat-heads.svg" alt="Head deck indicator" style="width:24px; vertical-align:middle;"/> Explorable head deck**: A stack of cards means that several heads occupy one diagram position. Scroll over it or use the arrows to select a head. The `0/3` indicator identifies the visible head.

  <img src="/assets/images/llm/attention-deck.png" alt="Attention heat map with the stacked cards for multiple heads and controls showing head zero of three" style="width:330px;"/>

- **Attention heat map**: Cell *i*, *j* shows how much token *i* attends to token *j*. Future cells are zero because the causal mask prevents tokens from attending to the future. In LFM2, selecting an attention head also selects its matching key/value cache group.
- **<img src="/assets/images/llm/glyphs/stat-layers.svg" alt="Layer stack indicator" style="width:24px; vertical-align:middle;"/> Layer selector (depth strip)**: The narrow stack at the left of an LFM2 diagram contains a miniature residual checkpoint for every model layer, with its logit-lens readout. Click or scroll a row to choose the layer whose attention or convolution anatomy appears at full size. The unused attention or convolution limb can remain faintly visible for orientation or be hidden from the context menu.
- **Logit lens**: The token circles beside residual checkpoints show what each intermediate residual state would predict. They let you watch a prediction develop through the model.
- **Next-token probabilities**: The final logits and softmax produce a probability for every vocabulary token. This is a distribution, not a one-hot output; the red circle marks the token selected for the next step. The tiny language model shows all tokens as a scrollable grid.

  <img src="/assets/images/llm/next-token-probabilities-grid.png" alt="Full next-token probability grid with many vocabulary candidates and one red selected token" style="width:800px;"/>

  LFM2 uses the same card in ranked-candidates mode, showing the highest-probability tokens rather than its entire large vocabulary. It also includes the sampled token if it falls outside that ranked list.

  <img src="/assets/images/llm/next-token-probabilities-top.png" alt="Ranked next-token probability card with its top candidates and red selected token" style="width:280px;"/>

- **Step walks and gradients**: In the tiny language model, right-click the header to train or step a forward pass or training step one operation at a time. The active operation glows, future tiles dim, and a training walk can show gradients flowing backward. In LFM2, running the workspace processes the Context Window and generates text one token at a time.
