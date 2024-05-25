---
title: Document Viewer
layout: default
parent: Utilities
has_children: false
nav_order: 155
---

# Document Viewer

A simple component for including documentation, descriptions, and instructions to be saved as part of a simulation, usually as part of a workspace file. Most of the default workspaces in the workspace folder have document viewers

To add a Document Viewer to a workspace use Insert > New Doc Viewer.

The Document Viewer contains two tabs, one for viewing the file, and one for editing it, in HTML. All changes in the edit tab take effect as soon as you click on the display tab. Editing is straightforward; it's basic html. To insert text into the document viewer, simply insert your text into the edit tab of the document viewer, keeping the tags html>, <body>, </html>, and </body> where they are. The text can be stylized, for instance, using the tag <b></b> bolds the text. For more HTML formatting, click here.

The only tricky bit is when you want to add an image or link to something local on the filesystem (e.g. these documents), where the syntax is a bit non-standard. In both cases paths are assumed to begin in the folder Simbrain was launched from. Here are examples of both cases:

Example of a local image:
    <img src = "file:docs/Images/simbrainlogo.gif">

Example of a local link:
    <a href = "file:docs/SimbrainDocs.html">docs</a>