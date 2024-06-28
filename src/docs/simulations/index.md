---
title: Simulations
layout: default
has_children: false
nav_order: 200
---

# Simulations

Custom simulations allow for custom updates, plots, logging, and pretty much anything. Extensive tooling and support is available, especially in Kotlin. 

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

* Can start with `evolveMouse.kt`

## Resources

Resources should be placed in src.main.resources.custom_sims and accessed with `getResource`


