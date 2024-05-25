---
title: Evolution
layout: default
has_children: false
nav_order: 110
---

# Evolving Neural Networks

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
