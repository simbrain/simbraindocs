---
title: Language Models
layout: default
parent: Networks
has_children: false
nav_order: 200
---

# Language Models

Language models, which encompass [large language models (LLMs)](https://en.wikipedia.org/wiki/Large_language_model) like ChatGPT, use the modern [transformer architecture](https://en.wikipedia.org/wiki/Transformer_(deep_learning_architecture)) to generate natural language. Simbrain includes two LLM [simulations](../simulations) that make a model's running computation visible on the network canvas.

`Simulations > Language > Tiny Language Model` is a small GPT-style transformer for learning. It begins untrained, so you can choose your own text, train it, and run it to generate text and observe how it works.

`Simulations > Language > (Beta) Pretrained Language Model (LFM2.5)` runs the pretrained [LFM2.5-230M](https://huggingface.co/LiquidAI/LFM2.5-230M) model locally with a [Text World](../worlds/textworld) context window. While the tiny language model is more or less a toy model that reproduces the text it is trained on, with limited generalization, LFM is a full working model, akin in performance to early versions of [GPT](https://en.wikipedia.org/wiki/Generative_pre-trained_transformer).

**Note:** This documentation page is still being developed. If you have corrections or comments, please contact us.

## Using the Models

Each simulation has a sidebar with fuller instructions.

For the tiny language model, train it from the control panel's `Train...` button, then run the workspace to generate text. To watch the computation in detail, right-click the model and choose `Step forward pass one op` or `Step training one op`. The active operation glows, tiles not yet computed are dimmed, and a training step continues backward through the gradients.

For LFM2, type a prompt in the coupled Text World and run the workspace. The model processes the prompt and then generates text one token at a time. The weights are downloaded the first time the simulation runs.

In either diagram, hover over a tile or glyph to see values, shapes, and operation descriptions. Click to select, drag a tile to rearrange the diagram, and double-click a tile to trace its input and output paths.

## The LLM Engine

Under the hood, these LLM simulations use a tensor-based engine that complements Simbrain's usual neuron, array, and trainer libraries. It represents transformer computations as an ordered sequence of tensor operations. For the tiny language model, it also records those operations during training so gradients can be computed by running them in reverse ([reverse-mode automatic differentiation](https://en.wikipedia.org/wiki/Automatic_differentiation#Reverse_accumulation)). Its tensors use [off-heap storage](https://docs.oracle.com/en/java/javase/22/core/heap-and-heap-memory.html), outside Java's normal garbage-collected heap, and [BLAS](https://en.wikipedia.org/wiki/Basic_Linear_Algebra_Subprograms) operations. This makes it practical to run the same style of matrix calculations used by contemporary language models while preserving intermediate values for training and inspection.

The pretrained simulation loads the model's original [safetensors](https://huggingface.co/docs/safetensors/index) weights and [tokenizer](https://huggingface.co/docs/tokenizers/index). The model's own tokenizer replaces Text World's [tokenizers](../worlds/textworld#tokenizers), and the coupled Text World adopts it so token boundaries match what the model sees. The engine executes those weights locally and retains the activations and caches needed for generation. Simbrain's interface then opens up this normally hidden computation, making weights, tensor values, operations, attention heads, and next-token predictions visible and inspectable.

## Main Components

The figures below show the main parts of each model, which are described in the [legend](#diagram-legend). Data flows from bottom to top.

The tiny language model:

<img src="/assets/images/llm/tiny-language-model-full-vocabulary.png" alt="Tiny language model diagram with a full 90-token next-token probability card, residual stream, attention heads, MLP branch, and learned parameters" style="width:800px;"/>

LFM2 has two main displays, depending on whether an attention or convolutional layer is selected. This is the attention-layer view.

<img src="/assets/images/llm/lfm2-attention-view.png" alt="Pretrained LFM2 attention-layer view showing the depth strip, residual stream, query, key, value, caches, attention heads, and MLP" style="width:800px;"/>

This is the convolutional-layer view. Its [convolution](convolutionalNeuralNetworks) (here one-dimensional, over the token sequence) moves a short, shared kernel across nearby tokens. Like image convolutions, it preserves local structure through weight sharing, but avoids the full pairwise attention calculation and its intermediate activations.

<img src="/assets/images/llm/lfm2-convolution-view.png" alt="Pretrained LFM2 convolution-layer view showing the depth strip, residual stream, convolution projection, kernel, cache window, and MLP" style="width:800px;"/>


## Diagram Legend

This section defines the main interface elements.

- **Tensor tile**: A grid of colored cells showing a matrix of values. Hover over a cell to see its value. In activation tiles, each row is one token position. A dashed border marks a magnified view. In LFM2, the model holds only the current token's row; earlier rows are a display record, which the [Token history](#pretrained-lfm2-language-model) menu can fade or turn off.
- **Parameter tile and bias strip**: A tile with a heavier orange border holds learned weights. A narrow orange-bordered strip is a bias vector. The tiny language model updates these during training. LFM2's weights are fixed.
- **Connector ribbon**: A gray ribbon carries a tensor from one tile or operation to the next. A group of faint ribbons beside it represents parallel head-wise streams. Tick marks and colored segments show how a tensor is partitioned into heads or fused projection chunks.
- **Residual stream**: The central column of tiles. Each attention or MLP branch leaves the column, computes a correction, and adds it back at an addition junction. The straight ribbons that bypass the branches are skip connections.

  <img src="/assets/images/llm/residual-stream.png" alt="Two residual-stream tiles joined by a skip connection and an addition junction where a branch returns its correction" style="width:140px;"/>

- **<img src="/assets/images/llm/glyphs/op-add.svg" alt="Addition glyph" style="width:24px; vertical-align:middle;"/> Addition**: Adds inputs, including the corrections that update the residual stream.
- **<img src="/assets/images/llm/glyphs/op-multiply.svg" alt="Multiplication glyph" style="width:24px; vertical-align:middle;"/> Multiply**: Matrix multiplication for a projection, or element-wise multiplication where a branch combines values.
- **<img src="/assets/images/llm/glyphs/op-layer-norm.svg" alt="Layer normalization glyph" style="width:24px; vertical-align:middle;"/> [Layer normalization](https://arxiv.org/abs/1607.06450)**: Normalizes a token representation before a transformer operation.
- **<img src="/assets/images/llm/glyphs/op-layer-norm.svg" alt="Normalization glyph" style="width:24px; vertical-align:middle;"/> <img src="/assets/images/llm/glyphs/op-rotate.svg" alt="Rotation glyph" style="width:24px; vertical-align:middle;"/> Normalize and position attention heads**: This two-part glyph in LFM2 first RMS-normalizes each query or key head, then applies rotary position encoding (RoPE), so attention can use both content and token position.
- **<img src="/assets/images/llm/glyphs/op-softmax.svg" alt="Softmax glyph" style="width:24px; vertical-align:middle;"/> [Softmax](arraysMatrices/softmax)**: Converts scores into a normalized distribution, including the attention distribution.
- **<img src="/assets/images/llm/glyphs/op-cross-entropy.svg" alt="Cross-entropy loss glyph" style="width:24px; vertical-align:middle;"/> [Cross-entropy](learning/trainingParameters)**: Compares a tiny language model prediction with its target during training.
- **<img src="/assets/images/llm/glyphs/op-embed.svg" alt="Embedding lookup glyph" style="width:24px; vertical-align:middle;"/> [Embedding lookup](../worlds/textworld#token-embeddings)**: Converts a token into its vector representation.
- **<img src="/assets/images/llm/glyphs/op-relu.svg" alt="ReLU glyph" style="width:24px; vertical-align:middle;"/> [ReLU](https://en.wikipedia.org/wiki/Rectifier_(neural_networks))**: Applies a rectified linear activation, keeping positive values and replacing negative values with zero.

  <img src="/assets/images/llm/relu-badge.png" alt="Hidden activation tile with a ReLU badge directly above it" style="width:150px;"/>

- **<img src="/assets/images/llm/glyphs/op-split.svg" alt="Split heads glyph" style="width:24px; vertical-align:middle;"/> Split heads**: Divides a representation into independent attention heads.
- **<img src="/assets/images/llm/glyphs/op-merge.svg" alt="Merge heads glyph" style="width:24px; vertical-align:middle;"/> Merge heads**: Recombines attention heads for the output projection.
- **<img src="/assets/images/llm/glyphs/op-cache-write.svg" alt="Cache-write glyph" style="width:24px; vertical-align:middle;"/> Update attention memory**: In LFM2, this arrow-into-a-tray glyph splits the current key or value vector into head segments and appends them as a new row in the key/value cache. Later tokens attend to those cached rows.
- **Q, K, and V routes**: Wq, Wk, and Wv are learned projections. Their output tiles are query, key, and value. Query and key form attention scores; softmax normalizes them; those weights mix the values.

  <img src="/assets/images/llm/qkv-connectors.png" alt="Close view of query, key, and value projection connectors, their weights, operation glyphs, tensor tiles, and the attention deck" style="width:500px;"/>

- **<img src="/assets/images/llm/glyphs/stat-heads.svg" alt="Head deck indicator" style="width:24px; vertical-align:middle;"/> Explorable head deck**: A stack of cards means that several heads occupy one diagram position. Scroll over it or use the arrows to select a head. The `0/3` indicator identifies the visible head.

  <img src="/assets/images/llm/attention-deck.png" alt="Attention heat map with the stacked cards for multiple heads and controls showing head zero of three" style="width:220px;"/>

- **Attention heat map**: Cell *i*, *j* shows how much token *i* attends to token *j*. Future cells are zero because the causal mask prevents tokens from attending to the future. In LFM2, selecting an attention head also selects its matching key/value cache group.
- **<img src="/assets/images/llm/glyphs/stat-layers.svg" alt="Layer stack indicator" style="width:24px; vertical-align:middle;"/> Layer selector (depth strip)**: The narrow stack at the left of an LFM2 diagram contains a miniature residual checkpoint for every model layer, with its logit-lens readout. Click or scroll a row to choose the layer whose attention or convolution anatomy appears at full size. The unused attention or convolution limb can remain faintly visible for orientation or be hidden from the context menu.
- **Logit lens**: The token circles beside residual checkpoints show what each intermediate residual state would predict. They let you watch a prediction develop through the model.

  <img src="/assets/images/llm/logit-lens.png" alt="Logit-lens readout circle showing the token sat with probability .8 beside a residual-stream tile" style="width:220px;"/>

- **Next-token probabilities**: The final logits and softmax produce a probability for every vocabulary token. This is a distribution, not a one-hot output; the red circle marks the token selected for the next step. The tiny language model shows all tokens as a scrollable grid.

  <img src="/assets/images/llm/next-token-probabilities-grid.png" alt="Full next-token probability grid with many vocabulary candidates and one red selected token" style="width:500px;"/>

  LFM2 uses the same card in ranked-candidates mode, showing the highest-probability tokens rather than its entire large vocabulary. It also includes the sampled token if it falls outside that ranked list.

  <img src="/assets/images/llm/next-token-probabilities-top.png" alt="Ranked next-token probability card with its top candidates and red selected token" style="width:180px;"/>

## Menus and Dialogs

Right-click a language model's header to open its context menu. Both models provide the standard `Cut`, `Copy`, `Paste`, `Duplicate`, and `Delete` commands, plus `Rename...` to change the header label and a `Couplings` submenu for connecting the model to other workspace components.

### Tiny Language Model

- **Edit Tiny Language Model...**: Opens the model settings dialog.
  - **Learning rate**: Sets the Adam optimizer's step size during training.
  - **Sampling temperature**: Makes next-token probabilities sharper below 1 or more evenly spread above 1 before sampling.
  - **Diagram scale**: Changes the size and spacing of tensor tiles without changing the size of labels and operation glyphs.
  - **Sampling strategy**: Chooses how the next token is selected. Greedy always selects the most likely token, Top K samples from the *k* most likely tokens, and Top P samples from the smallest group of tokens whose combined probability reaches *p*.
- **Train...**: Opens the training dialog. `Train` runs repeated training iterations, `Stop` ends a running training session, and `Step` runs one iteration. The dialog also shows the iteration count, loss, accuracy when available, the number of training windows, and a loss plot.
- **Step forward pass one op**: Runs one operation in the current forward pass. The active glyph glows and tiles not yet computed are dimmed. Shortcut: `F`.
- **Step training one op**: Walks one complete training step one operation at a time, first forward and then backward through the gradients. Shortcut: `B`.
- **Finish current step walk**: Completes the remainder of an operation-by-operation forward or training walk. Shortcut: `Shift-B`.
- **Clear context window**: Clears the model's current token context. Also clear the coupled Text Inputs document for a full reset, because its text is supplied again on the next workspace step.
- **Show last training gradients**: Replaces tiles with the gradients written during the most recent training step where available. It becomes available after a training step has calculated gradients.

### Pretrained LFM2 Language Model

- **Edit LFM2.5-230M...**: Opens the generation settings dialog.
  - **Prompt mode**: Completion continues the Context Window verbatim. Chat interprets it as a conversation and generates the model's reply.
  - **Tokens to generate**: Limits generated tokens beyond the supplied context. A value of 0 permits generation until the context window is full.
  - **Temperature**: Controls the softmax temperature before sampling. Lower values favor more likely tokens, while higher values increase variation.
  - **Probability card candidates**: Sets how many of the highest-probability next tokens appear in the canvas probability card.
  - **Sampling strategy**: Chooses Greedy, Top K, or Top P sampling. Greedy selects the most likely token, Top K samples among the *k* most likely tokens, and Top P samples from the smallest group whose combined probability reaches *p*.
  - **Stop at end of text**: Ends generation when the model produces its end-of-text token. Chat mode always stops at this token.
  - **Pause workspace when the run ends**: Pauses the workspace when generation stops because of an end-of-text token, a full context window, or the token limit, so the Context Window can be edited.
- **Clear context window**: Clears the model's token context. Also clear the coupled Context Window document for a full reset, because its text is supplied again on the next workspace step.
- **Logit lens**: Shows or hides the predicted-token readout at each residual-stream depth. Turning it off avoids an extra vocabulary-sized projection for each readout and can speed the display.
- **Token history**: Controls the display record of earlier token activations.
  - **Show**: Records and displays every token's activations.
  - **Ghost**: Fades past-token rows, leaving the current token's activations and the model's caches prominent.
  - **Off**: Displays only the current token and retains no history. Changing layers is faster; switching back to Show or Ghost reconstructs the history.
- **Inactive limb**: Controls the branch that the selected hybrid-model layer does not use.
  - **Ghost**: Leaves the unused attention or convolution branch faintly visible for orientation.
  - **Hide**: Removes the unused branch so only the selected layer's anatomy is shown.
- **Layer depth**: Controls depth cards behind stacked tensor tiles.
  - **Show cards**: Shows the layered-card cue behind each tensor stack.
  - **Current layer only**: Hides the cards and shows only the selected layer.
