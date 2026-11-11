---
title: Terminal
layout: default
parent: Utilities
has_children: false
---

# Terminal

The Simbrain terminal is a command line for inspecting, building, and running simulations. It is available in the Terminal tab of the bottom dock, and as a Console component using the console button in the toolbar. Each console window keeps its own location in the workspace.

A Console window is part of the workspace, so it would close when a simulation or workspace file is opened. Opening one from a Console window therefore runs in the Terminal tab instead, which stays open.

Enter `help` for a list of commands and `help <command>` for details. In the usage shown, `<x>` must be given and `[x]` is optional. Enter `examples` for an example of each command, or `examples <command>` for all of a command's examples. Each example is a comment saying what it does, followed by the commands, so examples can be copied and pasted back in to run them. The up and down arrows move through previous commands, Tab completes commands, paths, property names, and values, and pasting several lines runs them in order. A command that takes a while shows its progress above the prompt, and Ctrl+C or Esc cancels it. With nothing running, Ctrl+C clears what has been typed, or copies selected text.

## Language

A line is a command followed by words and `key=value` options. Put anything containing spaces in quotes. A `#` starts a comment.

```
add network net1
add neurons 10 rule=Sigmoidal
set net1/Neuron_1 activation=1
run 10
```

The workspace is navigated like a filesystem. `ls` by itself lists the components in the workspace, `ls net1` lists what is in a component, and `cd net1` makes paths relative to it. Use `..` to go up and `/` for the workspace. Models can be referred to by id or by label, and case and underscores don't matter, so `neuron1` finds `Neuron_1`.

A name by itself is looked for in the current location first and then everywhere, so `clear Neuron_1` works from anywhere. If the name is in more than one place, the terminal lists them and asks for a longer path.

A path can match several things using `*` and `?`, as in `set net1/Neuron_* activation=0`. These match only within the current location, and `**` matches at any depth, as in `ls **/Neuron_*`. A range in braces stands for each of its values, as in `set net1/Neuron_{1..10} activation=1`, and so does a list, as in `get Neuron_{1,5} activation`. The path `@` refers to what is selected in the GUI, as in `show @`.

Ending a line with `where` and a condition makes a command act only on the objects that meet it, as in `ls net1 where activation>0.5` or `set net1/* strength=0 where type=Synapse`. Conditions compare properties with `>`, `<`, `>=`, `<=`, `=`, and `!=`, and combine with `and`, `or`, and `not`. The property `type` is the kind of object, such as `Neuron` or `Synapse`.

A number can be given as an expression, which is worked out separately for each object. For example, `set Neuron_{1..10} activation=rand()*10` gives each neuron its own random value, and `set net1/Neuron_* activation=activation*2` doubles each one. Expressions can use `+ - * / ^`, parentheses, the object's own properties, `i` for its position among the objects being changed (counting from 0), `n` for how many there are, and the functions `rand()`, `rand(a,b)`, `randn(mean,sd)`, `abs`, `sqrt`, `exp`, `log`, `sin`, `cos`, `tanh`, `round`, `floor`, `ceil`, `min`, and `max`. Leave out spaces, or put the expression in quotes.

Output can be filtered by adding `| grep` and some text, as in `show net1/Neuron_1 | grep rule`.

## Commands

- **ls**: List contents, or what matches a pattern.
- **cd**: Change the current location.
- **show**: Show the properties of an object. Any property shown can be used with get and set.
- **get**: Print one property, as in `get net1/Neuron_1 activation`.
- **select**: Select models in the GUI, as in `select net1/Neuron_*`. Use `select none` to clear the selection.
- **set**: Set properties. Update rules and other selectable types are set by name, and their settings use dots, as in `set @ rule=Sigmoidal rule.slope=2`. Numbers can be expressions, as described above.
- **add**: Add a component, as in `add network net1`, or neurons or a neuron collection to a network, as in `add collection 5 label=input layout=line`. Use `in=net1` if there are several networks and the current location is not in one of them.
- **connect**: Connect neurons or neuron collections, optionally with a connection strategy, as in `connect net1/input net1/output sparse`. Two collections are joined by a synapse group.
- **couple**: Create a [coupling](../workspace/couplings.html), as in `couple net1/Neuron_1 "plot1/Series 1"`. To choose particular attributes, add them after a colon, as in `couple net1/Neuron_1:activation net2/Neuron_1:addInputValue`.
- **attrs**: List what an object can produce and consume.
- **couplings**, **uncouple**: List couplings and remove them by number.
- **rm**: Remove models or components. This cannot be undone.
- **randomize**, **clear**: Randomize or clear models or a whole network.
- **run**, **stop**: Run for a number of iterations, or until stopped.
- **sims**, **sim**: List simulations and open one.
- **open**, **save**: Open or save a workspace file.
- **source**: Run the commands in a text file.
- **examples**: Show examples to copy and paste.
- **cls**: Clear the screen.

## File Menu

- **Rename**: Rename the console window
- **Close**: Close the console window
