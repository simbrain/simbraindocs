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


## Creating a Custom Simulation

### Prerequisites

1. Set up your development environment following the [Simbrain source setup guide](https://github.com/simbrain/simbrain/wiki/Running-From-Source)
2. Use IntelliJ IDEA as your IDE
3. Explore existing simulations in `src/main/kotlin/org/simbrain/custom_sims/simulations`

Simulations are written in Kotlin using a functional approach (though Java is still supported but being phased out).

### Create Your Simulation File

Create a new `.kt` file in `src/main/kotlin/org/simbrain/custom_sims/simulations` (or an appropriate subdirectory). Use an existing simulation as a template. For example, `neuroscience/SpikingNeuronSim.kt` is a simple example.

### Basic Template Structure

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

### Register Your Simulation

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

### Adding Documentation to a simulation

You have two main options for adding documentation to your simulation:

#### Sidebar Documentation (Recommended)

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

#### Standalone Document Viewer

To place documentation in its own window, use `addDocViewer`:

```kotlin
val doc = addDocViewer("Documentation Title", """
    # My Simulation
    
    Detailed explanation with multiple sections...
""")
```

Both options support full markdown formatting including headers, lists, links, code blocks, and LaTeX math.

### Custom Update Actions

You can create custom update logic that runs during each simulation step:

#### Workspace-Level Updates

```kotlin
workspace.addUpdateAction("My Custom Action") {
    // Runs each iteration
    // Useful for custom logging, analysis, or cross-component updates
}
```

#### Network-Level Updates

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

Custom updates are particularly useful when:
- Standard buffered updates cause timing issues
- You need components to update in a specific order
- Implementing custom learning rules or behaviors
- The NLP and behaviorism simulations demonstrate these patterns

### Working with Odor Worlds

When creating simulations with Odor Worlds, understand these key concepts:

**Window vs World Size**: The `place` command positions and sizes the window, not the underlying world. The world size is determined by the tilemap and can extend beyond the visible window.

**Setting World Size**:
```kotlin
// Option 1: Match world size to window
world.tileMap.fitWorldToFrameSize()

// Option 2: Set size explicitly (width, height in tiles)
world.tileMap.updateMapSize(20, 18)
```

**Viewing**:
```kotlin
// Zoom to show entire world
world.fitFrameToWorld()
```

The zoom scaling factor works like document zoom: 0.5 (50%) is zoomed out, 2.0 (200%) is zoomed in. See `pursuer.kt` for a complete example.

### Best Practices

Follow these guidelines when creating simulations:

**Development Workflow**:
- Start by exploring similar existing simulations
- Copy and modify an existing simulation rather than starting from scratch
- Make incremental changes and test frequently
- Use descriptive variable names and add comments for clarity

**Performance**:
- When creating many neurons, use `addNeurons(collection)` instead of calling `addNeuron()` in a loop
- See `spikingNetworkSimulation.kt` for efficient network construction patterns

**GUI Synchronization**:
- When adding multiple network models asynchronously, call `.awaitAll()` or `.joinAll()` to ensure GUI setup completes before proceeding
- Some operations depend on GUI bounds being properly initialized

**Component Positioning**:
- Use `withGui { place(...) }` to position components
- Arrange components manually in the GUI first, then capture their positions for your code
- Hover over component borders to see coordinates in the status bar

**Using AI Assistance**:
Creating simulations with AI assistance (like ChatGPT) can accelerate development. Provide the AI with example simulations (e.g., `SpikingNeuronSim.kt`, `RegisteredSimulations.kt`) and describe what you want to build. The AI can generate starter code that you then refine.

## Advanced Topics

### Saving and Reopening Simulations

Simulations can be saved to `.zip` workspace files and reopened later. However, not all simulation elements can be serialized automatically (particularly custom update actions and control panels). The `newSim` id parameter and `registerReopenFunction` solve this problem.

The problem is this. When you save a workspace:
- **Serialized**: Networks, neurons, synapses, worlds, entities, plots, couplings
- **Not serialized**: Custom update actions, control panels, event handlers

Without special handling, reopening a saved simulation would lose these dynamic elements. The solution is to use the `id` parameter and register a reopen function:

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

On First Run: 
- The simulation creates all components
- Sets `workspace.simulationId = "my_unique_simulation_id"`
- Calls your setup function to add dynamic elements

On Save:
- The `simulationId` is saved with the workspace
- All serializable components are saved

On Reopen:
- Workspace deserializes all saved components
- Finds the simulation by matching the saved `simulationId` with registered simulations
- Calls your `registerReopenFunction` to re-add dynamic elements


The key pattern is to:
1. Keep all persistent component creation in the main simulation block
2. Extract dynamic element setup into a separate function
3. Call that function both in the main block and in the reopen function
4. Use `getModelByLabel` or `getModelById` to retrieve deserialized components

See these simulations for complete working examples:
- `RecurrentProjection.kt` - Shows control panel recreation
- `ClassicalConditioning.kt` - Shows custom update action restoration
- `SimpleOperant.kt` - Another behavioral simulation with custom updates

Tips:
- Unique IDs: Use descriptive, unique simulation IDs to avoid conflicts
- Labels Matter: Set meaningful labels on network models you'll need to retrieve later
- Test Reopen: Always test saving and reopening to ensure your dynamic elements are restored correctly

### Java Simulations (Legacy)

While being phased out, Java simulations are still supported. See `TestSim.java` for the current template. Java simulations require more boilerplate and have less tooling support than Kotlin simulations.

### Evolutionary Simulations

For evolutionary/genetic algorithm simulations, see `evolveMouse.kt` and the simulations in the `evolution/` directory. These implement fitness evaluation, mutation, crossover, and population management.


