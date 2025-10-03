---
title: Document Viewer
layout: default
parent: Utilities
has_children: false
---

# Document Viewer

A simple component for including documentation, descriptions, and instructions to be saved as part of a simulation, usually as part of a workspace file. Most of the default workspaces in the workspace folder have document viewers.

To add a Document Viewer to a workspace, use `Insert > New Doc Viewer`.

## Tabs

The Document Viewer contains two tabs:

- **View**: Displays the rendered HTML from your markdown
- **Edit**: Provides a code editor for writing and editing markdown with syntax highlighting

All changes in the edit tab take effect as soon as you switch to the view tab.

## Markdown Support

Editing is straightforward using standard [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet). The viewer uses GitHub Flavored Markdown (GFM). Simple HTML is also supported within markdown.

The default document viewer includes sample markdown demonstrating lists, formatting, and image embedding.

### Embedding Images

- **Remote images**: Use standard markdown syntax with URLs (e.g., `![Alt text](https://example.com/image.png)`)
- **Local images**: Reference local files using the `//localfiles/` prefix, which resolves to Simbrain's working directory (e.g., `![Figure](//localfiles/simulations/images/visualWorld/spiveyActivationDynamics.png)`)

## File Menu

- **Import**: Load a saved document viewer file
- **Export**: Save the document viewer content
- **Rename**: Rename the document viewer window
- **Close**: Close the document viewer window