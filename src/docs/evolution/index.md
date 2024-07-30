---
title: Evolution
layout: default
has_children: false
nav_order: 210
---

# Evolving Neural Networks

## Overview

Simbrain provides a comprehensive framework for evolving neural networks using evolutionary algorithms. To experience these in action, try the EvolveXOR simulation (details below). Unlike other Simbrain features, this framework isn't directly operable via the GUI for building evolutionary simulations with a point-and-click interface. Instead, it comprises a library of functions for creating custom simulations, producing standard interfaces, and resulting in networks, odor worlds, and other familiar Simbrain components. Sample simulations can be accessed from the simulation directory.

Upon opening most evolutionary simulations, an interface appears to customize the evolutionary process, initiated by the "evolve" button. Pressing this button starts an evolutionary algorithm, using interface settings to guide the simulation's creation of a population that evolves across generations. Each generation iterates the population to stabilize simulations, calculate fitness scores, and store results, which are displayed as percentiles of the population. After each generation, a percentage of the population is eliminated, and new simulations with mutated traits of survivors replace them. This process continues until the maximum number of generations is reached or the target fitness/error is achieved. The final generation's best simulation is considered the winner, with its fitness/error score being the simulation's final output.

## Basic Concepts

### Overview of Evolutionary Algorithm

1. Set up parameters in the interface.
2. Press the evolve button.
3. Simulation starts, setting generation = 1.
4. If generations >= max generations, stop; otherwise:
    - Create simulations as specified in the population size (networks, networks with worlds, etc.).
    - Compute a fitness or error score for each simulation.
    - If the evaluation percentile simulation is below max error or above min fitness, stop; otherwise, continue. For example, with an evaluation percentile of 0.5 and a population size of 100, compare the fifth-best network's fitness/error to the target.
    - Eliminate the elimination percentile of the population and mutate the remaining ones until reaching the new population size.
    - Increment the generation number.

When the simulation terminates, the best simulation (lowest error or highest fitness) is identified and displayed in the GUI, except in headless mode, where it is saved as a zip file.

### Example

1. Population of 100 with an elimination ratio of 0.10.
2. Compute fitness/error scores for each simulation.
3. After the first generation, eliminate 10 simulations.
4. From the remaining 90, sample and mutate 10 to repopulate.
5. Repeat steps until the best simulation meets the target fitness/error or the maximum number of generations is reached.

### Good Elimination Ratio

A 0.50 elimination ratio is often recommended (Metaheuristics book, pp. 35-36).

## Evolution Interfaces

This is a sample evolution interface from the EvolveXOR simulation. Below is the image and its respective explanation for each of the items within the interface.

<img src="/assets/images/evoControlPanel1.png" alt="Basic evolution interface" style="width:300px;"/>


### EvolveXOR Interface

- **Population Size:** Maximum number of simulations per generation.
- **Elimination Ratio:** Ratio of eliminated and replaced simulations.
- **Iterations Per Run:** Number of iterations per generation for stabilization.
- **Max Generations:** Maximum generations before termination.
- **Target Error:** Desired error threshold.
- **Evaluation Percentile:** Percentile of the population used for evaluating termination criteria.
- **Seed:** Random seed for replicability.

### EvolveNetwork Interface

In addition to the items in the EvolveXOR interface:

- **Target Number of Nodes:** Desired number of nodes.
- **Target Number of Weights:** Desired number of weights.
- **Target Total Activation:** Total activation sum.
- **Target Average Activation:** Average activation.
- **Target Average Connection Length:** Average length of connections.
- **Target Node Area:** Desired area of node dispersion.

The simulation evolves until the target qualities are met or the maximum generations are reached. If the criteria are target fitness instead of error, the goal is for the simulation to meet or exceed this fitness level.

## Headless Mode

This mode runs simulations without the GUI, useful for batch processing on supercomputers. Example invocation:


## Another interface / Network evolution / Example

This is another sample evolution interface but, from the EvolveNetwork simulation. In contrast to the EvolveXOR simulation, this simulation has additional items that are added to control the target results that we want the EvolveNetwork to produce. Below are the sample interface and the explanations of the additional items, excluding already explained items in the EvolveXOR sample interface above.

<img src="/assets/images/evoControlPanel2.png" alt="More advancd evolution interface" style="width:300px;"/>


Note: If there are multiple target qualities/fitnesses active, the evolutionary simulation will continue to evolve until it has all of the target qualities or until it has reached the maximum number of generations. 

- **Target Number of Nodes:** If this item is activated, one of the qualities of the simulation is to have the target number of nodes.
- **Target Number of Weights:** If this item is activated, one of the qualities of the simulation is to have the target number of weights.
- **Target Total Activation:** If this item is activated, one of the qualities of the simulation is to have the target total activation, which is the sum of all activations in one simulation.
- **Target Average Activation:** If this item is activated, one of the qualities of the simulation is to have the target average activation, which is the average of all activations in one simulation.
- **Target Average Connection Length:** If this item is activated, one of the qualities of the simulation is to have the target average connection length, which is the average of all connection lengths (the lines that connect neurons) in the simulation.
- **Target Node Area:** If this item is activated, one of the qualities of the simulation is to have the target node area, which is the target area of dispersion of nodes in the simulation.

To explain how the different qualities actually partake in the evolution process, using the EvolveNetwork interface sample, we can see that only the target number of nodes and the target number of weights are active. The simulation will evolve until its relative error in the actual number of nodes and weights compared to the target number of nodes and weights is approximately at or below the target error. For example, in the sample interface above, the simulation will attempt to evolve itself until it has the qualities of 20 nodes with 40 weights or until it has reached the maximum number of generations. More nuances will be explained in the Sample Simulations section.

**Note:** Although the sample evolution interfaces above show only target error, target fitness is also a possibility. If the criterion is target fitness instead, we would want the simulation to perform at or above the target fitness.



## Links

* Useful code: Genetics.kt -> Evaluator

* Notes on our efforts to encode [Clune](https://docs.google.com/document/d/18iNio7TQGCNS9Xd1oopU8Ae4zlyoQj_mCcaXU1UakPE/edit) and [linear notes on this](https://linear.app/simbrain/issue/SIM-35/implement-clune-paper)

* Notes with [Luis](https://docs.google.com/document/d/18iNio7TQGCNS9Xd1oopU8Ae4zlyoQj_mCcaXU1UakPE/edit)

* There is a v1 of these docs that may have some useful info

## General

* When you press the evolve button, the evolutionary algorithm is invoked. Then there is a series of generations, that runs until max generations or until we see fitness

## To make and wire up a simulation

* To get started find a similar simulation and copy-paste-rename it. 
    * EvolveXor is probably the simplest and easiest to start with
    * EvolveResourcePuruser and CowSim also good

* Go to RegisteredSimulations.kt

* The code around dir(“Evolution”) should be fairly easy to modify 

## Structure of a Simulation

In general see

* A sample sim, e.g. EvolveXOR.kt
* Genetics.kt

Within a regular simbrain simulation (Simulation.newSim), you will create a few elements. 

You basically create two objects: a genotype object and a simulation object. 

* The genotype specifies the chromosomes and genes and how they mutate (and boilerplates for things like copying).  It also has a function for expressing a phenotype.  Builtin gene types are provided.  These functions are not overrides, but are conventionally named and called by overridden functions in evoSim (below).

* The second object is an evoSim object which is where the genotypes are expressed, the fitness function is defined (“eval”), and it is also here that the actual sim is run, via a call to an evaluator function.

* A genotype (extend Genotype)

* You create a genotype class that contains within it a phenotype and a function to express the genotype into a phenotype. The genotype consists of chromosomes, which in turn consists of different kinds of gene.

* Note that most of this class is built by convention. You create objects and functions that you will use later in other parts of the sim

* Create a set of chromosomes 
    * These can have initial genes, but even if empty, they should be initialized to provide type information

* Create a phenotype object that stores what the genes produce
    * Consult examples to see what it should look like

* Define an expressWith() function that converts the chromosomes to actual network models in a provided network

* Define a copy function.  Boilerplate; look at examples.

* Define a mutate function. 
    * This is where important custom code goes to decide how genotypes are mutated between generations. 
    * Note that simulations typically handle mutations, though if standard mutations exist they can be put into util functions (not done yet)

* An evolutionary simulation (extend EvoSim)

* What are evolved are not individual agents, but “evoSims”, which can themselves be groups of agents in an environment, or just individual agents.

* Set up
    * One sim should have the environment and agent(s). Make networks, odor world, couplings etc.
    * As part of this there should be a completable future with a set of the phenotypes associated with the genotype
    * Add update actions as needed
    * Some of this tricky because coroutine scopes are used so follow the template of existing sims

* Override build. This is called each generation to build one evosim

* Override mutate.  This will call your genotype’s mutate function

* Override visualize and copy.  More or less just copy paste these. The interesting “visualization” code you will write is associated with the evaluator

* A call to the evaluator function (evaluator)
    * Returns the “winning” simulations from the last  generation
    * The main work is specifying values for the evaluator
    * You can set up a  progress bar here.
    * You can call visualize on one or more of the evosims from the last generation (which should be roughly the best ones)  to determine how you want them laid out in the workspace (ie specify layout that does not matter during the headless run but that is nice to have when viewing the final product)

## Implementation Notes

Phenotypes have to be packaged in a deferred. So then all later references can call await and only do stuff after that.

* When expressing networks, the nodes must be expressed first.  Connections must wait on this. See ConnectionGene2.

* So whatever calls express must also wait. 

* Express a suspend function.

* Whatever calls it must be wrapped in a completable deferred
    * Completetable deferred a boundary between synchronous and async code

* _phenotype is backing, a CompleteableDeferred  We can call complete() on it.
* Phenotype is the publicly accessible Deferred. We call await() on it

Running for one generation can create edge cases we have not taken care of. Try 2
