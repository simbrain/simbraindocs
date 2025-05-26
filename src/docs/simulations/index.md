---
title: Simulations and Scripting
layout: default
has_children: false
nav_order: 200
---

# Simulations and Scripting

Custom simulations allow for custom updates, plots, logging, and pretty much anything. Extensive tooling and support is available, especially in Kotlin. 

The best way to get a feel for what is possible is to have a look at a few simulations. First try running some to see what is possible: 

- custom logging
- custom update (e.g. updating components and couplings in a specific order)
- custom rules not built in to Simbrain
- creating sets of neurons and laying them out using a mathematical rule.

To get a feel for how to build edit them try finding them in the code and modifying them in simple ways (e.g. modifying the paramters at the top) and then re-run them. 

## Using AI to make a Simulation

Note that it's not so hard to make a simulation using AI.For example using a ChatGPT project, and adding the following source files to it

- `RegisteredSimulations.kt`
- `integrateAndFireSimulation.kt`
- `SpikingNeuronSim.kt`
- `Braitenberg.kt`

And using this prompt

> Please make a kotlinsimulation file withtwo input neurons both clamped, labeled "Excitatory input" and "Inhibitory Input" and a third Integrate and Fire neuron labeled "Spiking neuron" coupled to a time series plot showing activation over time.  

A viable simulation file was create which was then edited. A further prompt

> please provide code for an infodoc

Produced a first draft of docs for the sim

## Setting up a Simulation (Kotlin)

Here is the basic way to get started. Set up a simulation environment as described [here](https://github.com/simbrain/simbrain/wiki/Getting-From-Source), with IntelliJ reccomended as your IDE

- Find the File “RegisteredSimulations.kt”. 
- Click `Shift-Shift`, then click on project tab and use the compass tool to see where you are.
- Add an item using other examples as a template
- Copy an existing Kotlin sim from `src.kotlin.org.simbrain.custom_sims.simulations`. The projection demo is a good starting point.

Then more or less follow the template, much of it is quite straightforward.

## Fine-Tuning A Simulation

* Find the name of the simulation using shift-shift or ctrl-shift-F (find all) and look for the sim name.

* To adjust boundaries, get things where you like them in GUI and open terminal and use `componentBounds();` (use `tips();` for a list of useful commands)

To lay things out in network hover over interaction boxes for coordinates

`SimbrainUtils.java` and `SimulationScope` in `Simulation.kt` do similar things.  For now they cannot be accessed and so contain redundant functions. We may create objects to go back and forth between the (e.g. `val su = SimbrainUtil(workspace, desktop) )`, but we have not done so yet.

Sometimes after `addModels` in kotlin `.?join()` is useful to wait to make sure things are done before moving on.

## Adding docs

[Document viewers](../utilities/docviewer) can be added using [multiline string literals](https://kotlinlang.org/docs/java-to-kotlin-idioms-strings.html#use-multiline-strings). The document can be fine tuned directly in the doc viewer in the gui, and then the markdown text can be copy-pasted into the simulation using `docViewer = addDocViewer(name, text)`,  An example is in `projectionSim.k`

## Custom update Actions

You can create and add custom update actions to the update list, easiest is
```
     workspace.addUpdateAction("test"){
            println("Update action")
        }
```

Custom update is useful for cases where buffered update is a problem, and you want couplings to update in a specific order immediately each iteration, which can produce much more coherent results. The NLP examples show this.

## Setting up a java Simulation

We are phasing this out, but it still works fine and can be used if you prefer java. There is not quite as much tooling support, however.

- Find and copy the File `TestSim.java` and call the resulting file in `RegisteredSimulations.kt` (the ones that have `()` are java simulations)
- All the main action happens in the `run` function.  
    
## Evolutionary Simulations

Start with checking the code for `evolveMouse.kt` to get a sense forhow these work.

## Odor World

When coding [odor worlds](/docs/worlds/odorworld), note:

- A good example to start with is `pursuer.kt`
- The `place` command determines the window size, not the world size. The world can extend far beyond the window.
- The world size is determined by the underlying tilemap. 
  - Tip: you can set the world size by setting window size with `place` and then calling `fitWorldToFrameSize()` 
  - You can also call `updateMapSize` to set size directly, e.g. `world.tileMap.updateMapSize(20, 18)` 
- Calling `fitFrameToWorld` zooms out so that the whole world (the whole tilemap) is visible.
- The zoom uses a scaling factor which can be thought of on analogy with a text document. .5 or 50% is zoomed out and 2.0 is 200% and zoomed way in. It is the ratio of the world size (the tilemap size) to visible window size.


