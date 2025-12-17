---
title: Simulations and Scripting
layout: default
has_children: false
nav_order: 200
---

# Simulations and Scripting

<details closed markdown="block">
  <summary>
    Table of contents
  </summary>
  {: .text-delta }
1. TOC
{:toc}
</details>

Custom simulations in Simbrain allow you to create sophisticated setups with custom behaviors, update patterns, visualizations, and interactions. You can implement:

- Custom update logic (e.g., specific ordering of component updates)
- Custom learning rules and behaviors not built into Simbrain
- Programmatic creation and layout of neural networks
- Custom logging and analysis
- Interactive demonstrations and experiments

The best way to understand what's possible is to explore existing simulations using the `simulations` menu. Run several to see different capabilities, then examine their source code and modify simple parameters to understand how they work.

## Basic Setup

1. Set up your development environment following the [Simbrain source setup guide](https://github.com/simbrain/simbrain/wiki/Running-From-Source)
2. We reccomend IntelliJ IDEA as your IDE
3. Explore existing simulations in `src/main/kotlin/org/simbrain/custom_sims/simulations`

Simulations are written in Kotlin (Java is still supported but being phased out).

## The Basic Workflow

The typical workflow involves two main steps: 1. Register your simulation. Add a menu item in the simulations directory (see [Register Your Simulation](#register-your-simulation))
2. Create your simulation file: Write the actual simulation code (see [Create Your Simulation File](#create-your-simulation-file))

Both steps are straightforward when following existing examples in the codebase. The registration step involves adding a few lines to `RegisteredSimulations.kt`, while the simulation file can be created by copying and adapting an existing simulation that's similar to what you want to build.

## AI-Assisted Development

Modern AI coding assistants like Cursor, GitHub Copilot, or Claude can significantly accelerate simulation development. With access to the Simbrain codebase and existing simulations, you can simply describe what you want to create in natural language and have the AI generate much of the boilerplate code.

For example, you might prompt: "Create a simulation with a feedforward network that learns XOR, display it with a time series plot showing error over time, and add a control panel to adjust learning rate."

The AI can reference existing patterns from similar simulations and generate appropriate Kotlin code using Simbrain's API.

If there is interest, contact the authors and we will add some prompting and setup suggestions here in these docs.

## Create Your Simulation File

Create a new `.kt` file in `src/main/kotlin/org/simbrain/custom_sims/simulations` (or an appropriate subdirectory). Use an existing simulation as a template. For example, `neuroscience/SpikingNeuronSim.kt` is a simple example.

Kotlin simulations use the `newSim` function with a `SimulationScope` lambda:

```kotlin
val myCustomSimulation = newSim {
    
    workspace.clearWorkspace()
    
    // Add components
    val networkComponent = addNetworkComponent("Network")
    val network = networkComponent.network
    
    // Build your network
    // ... create neurons, connections, etc.
    
    // Add plots, worlds, or other components
    val timeSeries = addTimeSeriesComponent("Activity", "Series 1")
    
    // Position components in the GUI
    withGui {
        place(networkComponent, 0, 0, 400, 400)
        place(timeSeries, 410, 0, 400, 400)
    }
    
    // Create couplings
    with(couplingManager) {
        // ... couple components
    }
    
    // Optional: Add documentation sidebar
    addSidebarInfo(
        """
        # My Simulation
        
        Description of what this simulation does...
        """
    )
}
```

## Register Your Simulation

Open `RegisteredSimulations.kt` (use `Shift-Shift` in IntelliJ to find it quickly) and add your simulation to the menu structure:

```kotlin
val simulations = dir("Simulations", alphabetical = true) {
    
    dir("My Category") {
        item("My Simulation Name") { myCustomSimulation }
    }
    
    // ... other categories
}
```

Use `dir` to create menu folders and `item` to add individual simulations. The label you provide appears in the menu and can also be used to run the simulation from the command line.

## Adding Documentation

You have two main options for adding documentation to your simulation.

Most simulations use `addSidebarInfo` to display documentation in a collapsible sidebar:

```kotlin
addSidebarInfo(
    """
    # My Simulation Title
    
    Brief description of what this simulation demonstrates.
    
    ## What to Do
    
    1. Click Run to start
    2. Try adjusting...
    3. Observe...
    
    ## Details
    
    More in-depth explanation...
    """
)
```

The sidebar can be shown or hidden by default using the `initiallyOpened` parameter, and you can also control its width. See `SpikingNeuronSim.kt` for a complete example.

Alternatively, to place documentation in its own window, use `addDocViewer`:

```kotlin
val doc = addDocViewer("Documentation Title", """
    # My Simulation
    
    Detailed explanation with multiple sections...
""")
```

Both options support full markdown formatting including headers, lists, links, code blocks, and LaTeX math.

## Best Practices

Start by exploring similar existing simulations. Copy and modify an existing simulation rather than starting from scratch. 

When creating many neurons, use `addNeurons(collection)` instead of calling `addNeuron()` in a loop. See `spikingNetworkSimulation.kt` for efficient network construction patterns.

When adding multiple network models asynchronously, call `.awaitAll()` or `.joinAll()` to ensure GUI setup completes before proceeding. Some operations depend on GUI bounds being properly initialized.

Use `withGui { place(...) }` to position components. Arrange components manually in the GUI first, then capture their positions for your code. Hover over component borders to see coordinates in the status bar.


## Custom Update Actions

You can create custom update logic that runs during each simulation step.

Workspace-level updates are useful for custom logging, analysis, or cross-component updates:

```kotlin
workspace.addUpdateAction("My Custom Action") {
    // Runs each iteration
}
```

For network-specific custom behavior, add actions directly to the network's update manager:

```kotlin
network.updateManager.addAction(updateAction("Custom Network Update") {
    // Custom network update logic
    // Access network models directly
})
```

You can also control the priority (order) of network actions:

```kotlin
network.updateManager.addAction(0, updateAction("High Priority Update") {
    // Runs before buffered update
})
```

Custom updates are particularly useful when standard buffered updates cause timing issues, you need components to update in a specific order, or you're implementing custom learning rules or behaviors. The NLP and behaviorism simulations demonstrate these patterns.


## Running Simulations Headless

Simulations can be run headless (without the GUI) from the command line using Gradle. This is useful for running long computation-intensive simulations on remote servers. The entry point is the `runSim` Gradle task in `simbrain/build.gradle.kts`.

From the `simbrain` directory, run:

```bash
gradle runSim -PsimName="Simulation Name"
```

The simulation name must match a name registered in `RegisteredSimulations.kt`. For simulations that accept parameters, use the `optionString` parameter. For example:

```bash
gradle runSim -PsimName="Evolve Grazing Cows" -PoptionString="2:20:1000:100:0.5:true"
```

In the code, see `CowGrazing.kt` for details on the parameter format and implementation pattern. When run headless, the simulation saves the result to a timestamped `.zip` file that can be loaded in the GUI.


## Neurons as Custom Displays

One powerful pattern in Simbrain is using neurons not as traditional neural units, but as visual displays for quantities computed with custom equations or code. This approach is useful when you want to:

- Visualize dynamical systems or mathematical models
- Display intermediate computations in a cognitive model
- Show model states that don't correspond to traditional neural activations

The neurons serve as visual indicators that can be monitored in time series plots, coupled to other components, or used in projections, while the actual computation happens in your custom code. This gives you the flexibility of arbitrary computation with the visualization and connectivity benefits of Simbrain's neural network framework.

Some examples:

- `Simulations > Dynamical Systems > Lorenz attractor`: Uses three neurons to display x, y, and z variables from the Lorenz equations, with custom update code computing the differential equations
- `Simulations > Psychology > Temporal attention network`: Uses neurons to display attention values and decision evidence computed from normalization equations
- `Simulations > Psychology > Mouse and eye tracking`: Displays lexical, visual, and motor activations computed from custom integration and normalization code

## Working with Odor Worlds

When creating simulations with Odor Worlds, the `place` command positions and sizes the window, not the underlying world. The world size is determined by the tilemap and can extend beyond the visible window.

To set world size, either match it to the window with `world.tileMap.fitWorldToFrameSize()` or set it explicitly with `world.tileMap.updateMapSize(20, 18)` for width and height in tiles. To view the entire world, use `world.fitFrameToWorld()`.

The zoom scaling factor works like document zoom: 0.5 (50%) is zoomed out, 2.0 (200%) is zoomed in. See `pursuer.kt` for a complete example.

## Saving and Reopening Simulations

Simulations can be saved to `.zip` workspace files and reopened later. However, not all simulation elements can be serialized automatically (particularly custom update actions and control panels). The `newSim` id parameter and `registerReopenFunction` solve this problem.

When you save a workspace, networks, neurons, synapses, worlds, entities, plots, and couplings are serialized. However, custom update actions, control panels, and event handlers are not serialized. Without special handling, reopening a saved simulation would lose these dynamic elements. The solution is to use the `id` parameter and register a reopen function:

```kotlin
val mySimulation = newSim("my_unique_simulation_id") {
    
    // Create persistent components
    workspace.clearWorkspace()
    val networkComponent = addNetworkComponent("Network")
    val network = networkComponent.network
    
    // ... build network, add neurons, etc.
    
    // Call setup function to add dynamic elements
    setupDynamicElements(workspace)
    
}.registerReopenFunction { workspace -> 
    // When reopening, re-add the dynamic elements
    setupDynamicElements(workspace) 
}

suspend fun SimulationScope.setupDynamicElements(workspace: Workspace) {
    // Retrieve already-deserialized components by label or id
    val network = workspace.componentList
        .filterIsInstance<NetworkComponent>()
        .first()
        .network
    
    val myNeuron = network.getModelByLabel<Neuron>("My Neuron")
    
    // Add custom update actions
    network.updateManager.addAction(updateAction("My Update") {
        // Custom logic
    })
    
    // Add control panels
    withGui {
        createControlPanel("Controls", 0, 0) {
            addButton("Do Something") {
                // Button logic
            }
        }
    }
}
```

On first run, the simulation creates all components, sets `workspace.simulationId = "my_unique_simulation_id"`, and calls your setup function to add dynamic elements. On save, the `simulationId` is saved with the workspace along with all serializable components. On reopen, the workspace deserializes all saved components, finds the simulation by matching the saved `simulationId` with registered simulations, and calls your `registerReopenFunction` to re-add dynamic elements.

The key pattern is to keep all persistent component creation in the main simulation block, extract dynamic element setup into a separate function, call that function both in the main block and in the reopen function, and use `getModelByLabel` or `getModelById` to retrieve deserialized components.

See `RecurrentProjection.kt` for control panel recreation, `ClassicalConditioning.kt` for custom update action restoration, and `SimpleOperant.kt` for another behavioral simulation with custom updates.

Use descriptive, unique simulation IDs to avoid conflicts. Set meaningful labels on network models you'll need to retrieve later. Always test saving and reopening to ensure your dynamic elements are restored correctly.

## Java Simulations (Legacy)

While being phased out, Java simulations are still supported. See `TestSim.java` for the current template. Java simulations require more boilerplate and have less tooling support than Kotlin simulations.
