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

## Creating a Custom Simulation

Creating custom simulations allows you to build sophisticated neural network models with custom behaviors, update patterns, and visualizations. This guide will walk you through the complete process.

### Getting Started

You have two primary language options for creating custom simulations:

- **Kotlin** (recommended): Better tooling and more extensive support
- **Java**: Still supported but being phased out

#### Prerequisites

1. Set up your development environment as described in the [Simbrain source setup guide](https://github.com/simbrain/simbrain/wiki/Getting-From-Source)
2. Use IntelliJ IDEA as your recommended IDE
3. Explore existing simulations in `src/main/kotlin/org/simbrain/custom_sims/simulations`

### Setting up a Kotlin Simulation

Here's the step-by-step process to create a new Kotlin simulation:

#### 1. Register Your Simulation

- Open `RegisteredSimulations.kt` (use `Shift-Shift` to find it quickly)
- Click on the project tab and use the compass tool to see your location
- Add a new simulation entry using existing examples as templates

#### 2. Create Your Simulation File

- Copy an existing simulation file as a template (e.g., `projectionSim.kt`)
- Place it in `src/main/kotlin/org/simbrain/custom_sims/simulations`
- Follow the established template structure

#### 3. Basic Template Structure

```kotlin
class MyCustomSimulation(desktop: SimbrainDesktop) : Simulation(desktop) {

    override fun getName(): String = "My Custom Simulation"

    override fun run() {
        // Your main simulation logic here
    }

    override fun instantiate(): Simulation {
        return MyCustomSimulation(desktop)
    }
}
```

### Key Customization Techniques

#### Adding Documentation

You can add interactive documentation to your simulation:

```kotlin
val doc = addDocViewer("My Simulation", """
# My Simulation
This is a custom simulation that demonstrates...

## Features
- Custom neural networks
- Real-time visualization
- Interactive controls
""")
```

#### Custom Update Actions

Create custom update patterns for precise control over simulation execution:

```kotlin
workspace.addUpdateAction("My Custom Update") {
    // Your custom update logic here
    // This runs each simulation step
}
```

This is particularly useful when:
- Buffered updates cause problems
- You need couplings to update in a specific order
- You want immediate updates each iteration for coherent results

#### Fine-Tuning Your Simulation

1. **Component Positioning**: Arrange components in the GUI as desired
2. **Get Coordinates**: Use the Simbrain console command `componentBounds()` to capture positions
3. **Additional Commands**: Use `tips()` in the console for more helpful commands
4. **Network Layout**: Hover over interaction boxes to see coordinates for precise placement

### Working with Odor Worlds

When creating simulations with Odor Worlds, keep these specifics in mind:

- **Window vs World Size**: The `place` command sets window size, not world size
- **Setting World Size**:
  - Use `fitWorldToFrameSize()` to match world size to window
  - Or use `updateMapSize()` directly: `world.tileMap.updateMapSize(20, 18)`
- **Viewing**: Use `fitFrameToWorld()` to zoom view to show the entire world

### Setting up a Java Simulation

While Kotlin is recommended, Java simulations are still supported:

1. Copy `TestSim.java` as your template
2. Register it in `RegisteredSimulations.kt` (Java simulations have `()` in their registration)
3. Implement your main logic in the `run` function

Note: Java simulations have less tooling support compared to Kotlin.

### Best Practices

When creating custom simulations, follow these guidelines for optimal results:

1. **Explore Existing Code**: Study existing simulations to understand patterns and conventions
2. **Use Provided Templates**: Start with templates rather than building from scratch
3. **Experiment Iteratively**: Make small changes and test frequently
4. **Leverage Console Commands**: Use console commands for fine-tuning component placement and behavior
5. **Performance Considerations**: When creating many neurons, use `addNeurons` instead of `addNeuron` in a loop for better performance
6. **GUI Synchronization**: When calling `addNetworkModels`, add `.awaitAll()` afterward to ensure proper GUI setup before proceeding

## Simulation Class Structure

All custom simulations extend the `Simulation` base class and implement:

- **Constructor**: Takes a `SimbrainDesktop` parameter for GUI integration
- **getName()**: Returns the simulation name for menu display
- **run()**: Contains the main simulation logic
- **instantiate()**: Creates a new instance for execution

## Migration Guidelines

To migrate from BSH scripts to Kotlin simulations:

1. **Identify Core Logic**: Extract the main simulation logic from BSH scripts
2. **Create Simulation Class**: Extend the `Simulation` base class
3. **Use SimulationUtils**: Replace direct API calls with the `sim` utility object
4. **Register Simulation**: Add the new simulation to the registered simulations list
5. **Test Integration**: Ensure the simulation works within the Simbrain desktop environment

## Fine-Tuning A Simulation

* Find the name of the simulation using shift-shift or ctrl-shift-F (find all) and look for the sim name.

* To adjust boundaries, get things where you like them in GUI and open terminal and use `componentBounds();` (use `tips();` for a list of useful commands)

To lay things out in network hover over interaction boxes for coordinates

`SimbrainUtils.java` and `SimulationScope` in `Simulation.kt` do similar things.  For now they cannot be accessed and so contain redundant functions. We may create objects to go back and forth between the (e.g. `val su = SimbrainUtil(workspace, desktop) )`, but we have not done so yet.

Sometimes after `addModels` in kotlin `.?join()` is useful to wait to make sure things are done before moving on.

# Tips

- When creating many neurons, try to use `addNeurons` rather than `addNeuron` in a loop, for a performance gain. See spikingNetworkSimulation.kt for an example

- When calling `addNetworkModels` it is generally a good idea to add `.awaitAll()` after to ensure the gui is set up properly (some commands rely on the gui bounds being properly set, and if they are called out of order unexpected results can occur)

# Using AI to make a Simulation

Note that it's not so hard to make a simulation using AI.For example using a ChatGPT project, and adding the following source files to it

- `RegisteredSimulations.kt`
- `integrateAndFireSimulation.kt`
- `SpikingNeuronSim.kt`
- `Braitenberg.kt`

And using this prompt

> Please make a simulation file with two input neurons both clamped, labeled "Excitatory input" and "Inhibitory Input" and a third Integrate and Fire neuron labeled "Spiking neuron" coupled to a time series plot showing activation over time.  

A viable simulation file was create which was then edited. A further prompt

> please provide code for an infodoc

Produced a first draft of docs for the sim


# Other Topics

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


