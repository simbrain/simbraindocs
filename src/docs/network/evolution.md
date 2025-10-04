---
title: Evolution
layout: default
has_children: false
nav_order: 210
---

# Evolving Neural Networks

Simbrain provides a comprehensive framework for evolving neural networks using evolutionary algorithms. To experience these in action, try the EvolveXOR simulation (details below). Unlike other Simbrain features, this framework isn't directly operable via the GUI for building evolutionary simulations with a point-and-click interface. Instead, it comprises a library of functions for creating custom simulations, producing standard interfaces, and resulting in networks, odor worlds, and other familiar Simbrain components. Sample simulations can be accessed from the simulation directory.

Upon opening most evolutionary simulations, an interface appears to customize the evolutionary process, initiated by the "evolve" button. Pressing this button starts an evolutionary algorithm, using interface settings to guide the simulation's creation of a population that evolves across generations. Each generation iterates the population to stabilize simulations, calculate fitness scores, and store results, which are displayed as percentiles of the population. After each generation, a percentage of the population is eliminated, and new simulations with mutated traits of survivors replace them. This process continues until the maximum number of generations is reached or the target fitness/error is achieved. The final generation's best simulation is considered the winner, with its fitness/error score being the simulation's final output.

## Basic Concepts

This is a sample evolution interface from the EvolveXOR simulation.

<img src="/assets/images/basicEvolutionControls.png" alt="Basic evolution interface" style="width:300px;"/>

- **Population Size**: The maximum number of simulations per generation. When some of the simulations are eliminated and replaced, the total amount of simulation per simulation cannot be larger than the set population size.
- **Elimination Ratio**: The ratio of eliminated simulations from the population size and the ratio that is replaced by new, mutated simulations of surviving simulations.
- **Iterations Per Run**: Each generation, the simulation is iterated by the total amount of iterations specified in iterations per run. This is to stabilize the network before calculating a fitness score of the generation.
- **Max Generations**: The maximum number of generations that the evolutionary simulation can reach before terminating and returning the best performing network.
- **Target Error**: The target error that we want the evolutionary simulation to be at or below.
- **Evaluation percentile**: When the evolutionary simulation decides to terminate, the evolutionary simulation will consider the current error of the specified evaluation percentile of the current population before terminating. Note: Numbers closer to 0th percentile means better performance whereas numbers closer to 100th percentile means worse performance.
- **Seed**: A random seed that is utilized for replicability.


Here is how it works:

1. Set up parameters in the interface.
2. Press the evolve button.
    - Simulation starts, setting generation = 1.
        - If `generations >= max generations`, stop; otherwise:
        - Create simulations as specified in the population size (networks, networks with worlds, etc.).
        - Compute a fitness or error score for each simulation.
        - If the evaluation percentile simulation is below max error or above min fitness, stop; otherwise, continue. For example, with an evaluation percentile of 0.5 and a population size of 100, compare the fifth-best network's fitness/error to the target.
        - Eliminate the elimination percentile of the population and mutate the remaining ones until reaching the new population size.
        - Increment the generation number.

Example:

1. Population of 100 with an elimination ratio of 0.10.
2. Compute fitness/error scores for each simulation.
3. After the first generation, eliminate 10 simulations.
4. From the remaining 90, sample and mutate 10 to repopulate.
5. Repeat steps until the best simulation meets the target fitness/error or the maximum number of generations is reached.
6. 
When the simulation terminates, the best simulation (lowest error or highest fitness) is identified and displayed in the GUI, except in headless mode, where it is saved as a zip file.


## How genes work

Under the hood, an evolutionary simulation involves genes (often organized into chromosomes, which are simply sets of genes with similar properties). Here are some of the main genes used:

- **Node genes**: associated with a single neuron and can encode arbitrarily many features of it, like its bias, update rule, etc.
- **Synapse genes**: associated with a single synapse, similar to node genes. Has a reference to source and target node genes. 
- **Node rule genes**: used to encode for a [neuron update rule](neurons). Usually associated with a node gene.
- **Synapse genes**: used to encode a [local learning rule](synapses).
- **Connection genes**: associated with a [connection strategy](connections) which is applied to a set of nodes when the gene is expressed.
- **Layout genes**: associated with a [layout object](layouts) which is applied to a set of nodes when the gene is expressed.

Mutations often work by iterating through these genes and setting their properties.

# Examples

To flesh out these ideas here are examples, all accessible from the [simulations](../simulations) menu.

## Example: XOR


The EvolveXOR simulation is a simulation of the evolution of a network evolving to solve the XOR problem. The default fitness of this simulation is judged based on the difference between the current XOR dataset and the target XOR dataset. As context, the XOR problem states that a two-layer network with linear units cannot solve a function that is not linearly separable; however, a three-layer network with non-linear units can. The simulation starts with the three-layer network of the XOR and a preset amount of connections (1 per layer). The simulation will evolve the network towards the actual solution of the XOR problem till the target error or lower (i.e. better), or until the maximum generation is reached. This evolution process has the following characteristics: changing node biases and weight strengths; in addition to adding hidden nodes and connections. 

<!-- A 0.50 elimination ratio is often recommended (Metaheuristics book, pp. 35-36). -->

## Example: Network Evolution

The EvolveNetwork simulation is a simulation of the evolution of a network. The default fitness of this simulation is based on the difference between the current nodes and weights to the target number of nodes and weights. The simulation will continue to add nodes and weights (including synaptic connections) while changing the physical layout of the nodes until the network has reached the target error or lower, or it has reached the maximum number of generations. The target error in this case is the total sum of error of the target number of nodes and the target number of weights. However, if there are more items selected as qualities/fitness, the target error will be based on the difference of all actual qualities present in the simulation and all active target qualities (this includes the target number of nodes and weights if they are active).

This simulation has additional items that are added to control the target results that we want the EvolveNetwork to produce. Below are the sample interface and the explanations of the additional items, excluding already explained items in the EvolveXOR sample interface above.

<img src="/assets/images/evolveNetworkControls.png" alt="Network evolution interface" style="width:300px;"/>

In addition to the items in the EvolveXOR interface:

- **Target Number of Nodes:** Desired number of nodes.
- **Target Number of Weights:** Desired number of weights.
- **Target Total Activation:** Total sum of node activations.
- **Target Average Activation:** Average node activations.
- **Target Average Connection Length:** Average length of connections (the lines that connect neurons) in pixels.
- **Target Node Area:** How much space the nodes take up, in pixels squared.

The simulation evolves until the target qualities are met or the maximum generations are reached. If the criteria are target fitness instead of error, the goal is for the simulation to meet or exceed this fitness level.

Note: If there are multiple target qualities/fitnesses active, the evolutionary simulation will continue to evolve until it has all of the target qualities or until it has reached the maximum number of generations. 

In the example shown, the target number of nodes and the target number of weights are active. The simulation will evolve until its relative error in the actual number of nodes and weights compared to the target number of nodes and weights is approximately at or below the target error. For example, in the sample interface above, the simulation will attempt to evolve itself until it has the qualities of 20 nodes with 40 weights or until it has reached the maximum number of generations. More nuances will be explained in the Sample Simulations section.

**Note:** Although the sample evolution interfaces above show only target error, target fitness is also a possibility. If the criterion is target fitness instead, we would want the simulation to perform at or above the target fitness.

# Example: Resource Pursuer

This simulations adds an environment. It is a simulation of the evolution of a network that is coupled to an agent in an odor world that contains food resources. Fitness is based on how many calories the agent has minus how hungry it is. Energy consumption in the form of movement and neuron activation is penalized, so that an ideal simulation will involve efficient movement towards food when hungry.

<img src="/assets/images/evolveResourcePursuer.png" alt="Evolve resource pursuer"/>

A member of a population is an agent in an environment. These come pre-equipped with input and output nodes and some connections. Mutations at each generation can do the following, depending on what is enabled in the dialog. Each of these mutations will only happen with some probability.

- For each node, mutate its bias
- For each weight, mutate its strength
- For each weight, add a learning rule or change the learning rule
- Add a new connection either between input and hidden or hidden and output layers
- Add a new hidden unit
- Change the layout of the hidden layer
- Change the connection strategy used to connect the nodes in the hiddden layer
- For each hidden unit, change its update rule