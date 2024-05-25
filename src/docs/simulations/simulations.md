---
title: Simulations
layout: default
has_children: false
nav_order: 80
---

# Simulations 

Custom simulations must be coded directly in the source, but extensive tooling and support is available. This allows for custom updates, plots, logging, and pretty much anything,

## Setting up a Simulation (Kotlin)

* Find the File “RegisteredSimulations.kt”. 
    * Suggest using Shift-Shift, then click on project tab and use the compass tool to see where you are.

* Add an item using other examples as a template

* Copy an existing Kotlin sim from src.kotlin.org.simbrain.custom_sims.simulations

* Refer to that in RegisteredSimulations.kt

* There is a java process but it is separate and not yet documented (**todo**)

### Fine-Tuning A Simulation

* Find the name of the simulation using shift-shift or ctrl-shift-F (find all) and look for the sim name.

* To adjust boundaries, get things where you like them in GUI and open terminal and use “componentBounds();” (use “tips();” for a list of useful commands)

### Custom updating

* Sometimes best to remove all default updates and do it all manuall for best control.  See SRN recurrent

### Couplings

* For cases where you want immediate results and not the “buffered” results just make an update action as in the NLP examples (We have priority update but it is not convenient)

## Setting up a java Simulation 

We are phasing this out, but it still works fine and can be used if you prefer java. There is not quite as much tooling support, however.

* Find the File “TestSim.java”. 
    * Suggest using Shift-Shift, then click on project tab and use the compass tool to see where you are.
    * Copy-paste TestSim
    * Move it to an appropriate place, possibly making a new folder in custom_sims

* Make “getSubMenuName”  return the submenu you want your sim under

* Make “getName” return the name of the simulation

* Register the simulation at RegisteredSimulation.java by following the template.

* All the main action happens in the “run” function.  
    * Look at different simulation in the simulations hierarchy for a sense of how these work
    * For converting bsh you can initially just copy everything between curly braces to the run function

* Workspace and desktop are available via the sim object.

## Evolutionary Simulations

* Can start with evolveMouse.kt
