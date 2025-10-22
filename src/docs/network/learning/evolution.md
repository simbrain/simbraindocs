---
title: Evolution
layout: default
parent: Learning
grand_parent: Networks
has_children: false
nav_order: 30
---

# Evolving Neural Networks

Simbrain provides a comprehensive framework for evolving neural networks using [evolutionary algorithms](https://en.wikipedia.org/wiki/Evolutionary_algorithm), which is a form of [neuroevolution](https://en.wikipedia.org/wiki/Neuroevolution). To experience these in action, try the EvolveXOR simulation (details below). Unlike other Simbrain features, this framework isn't directly operable via the GUI for building evolutionary simulations with a point-and-click interface. Instead, it comprises a library of functions for creating custom simulations, producing standard interfaces, and resulting in [networks](..), [odor worlds](../../worlds/odorworld), and other familiar Simbrain components. Sample simulations can be accessed from the simulation directory.

Upon opening most evolutionary simulations, an interface appears to customize the evolutionary process, initiated by the "evolve" button. Pressing this button starts an evolutionary algorithm, using interface settings to guide the simulation's creation of a population that evolves across generations. Each generation iterates the population to stabilize simulations, calculate fitness scores, and store results, which are displayed as percentiles of the population. After each generation, a percentage of the population is eliminated, and new simulations with mutated traits of survivors replace them. This process continues until the maximum number of generations is reached or the target fitness/error is achieved. The final generation's best simulation is considered the winner, with its fitness/error score being the simulation's final output.

This is a sample which shows what the evolution interface looks like, from the `EvolveXOR` simulation.

<img src="/assets/images/basicEvolutionControls.png" alt="Basic evolution interface" style="width:300px;"/>

- **Population Size**: The number of simulations spawned per generation. This size stays constant throughout the evolution process.
- **Elimination Ratio**: The percentage of the population eliminated each generation and replaced with mutated offspring of surviving simulations.
- **Iterations Per Run**: Each generation, the simulation is iterated this many times to stabilize the network before calculating a fitness score.
- **Max Generations**: The maximum number of generations the evolutionary simulation can reach before terminating and returning the best performing network.
- **Target Error** (or **Target Fitness**): The target metric that stops the simulation when reached. Depending on the simulation's stopping condition, this is either a target error (stop when below this value) or target fitness (stop when above this value).
- **Evaluation percentile**: When deciding whether to terminate, the evolutionary simulation considers the metric at this percentile of the current population. Numbers closer to 0th percentile represent better performance, while numbers closer to 100th percentile represent worse performance.
- **Seed**: A random seed used for replicability.


Here is how it works:

1. **Initialization**: A population of simulations is created with random initial parameters
2. **Evaluation**: Each simulation runs for a specified number of iterations and receives a [fitness score](https://en.wikipedia.org/wiki/Fitness_function)
3. **Selection**: Simulations with better fitness scores are more likely to survive (see [evolutionary selection](https://en.wikipedia.org/wiki/Selection_(genetic_algorithm)))
4. **Reproduction**: Surviving simulations produce offspring with [mutations](https://en.wikipedia.org/wiki/Mutation_(genetic_algorithm))
5. **Iteration**: Steps 2-4 repeat until a termination condition is met

## Example Simulations

Here are some example evolutionary simulations available in Simbrain:

### EvolveXOR

A classic demonstration of evolving a network to solve the [XOR problem](https://en.wikipedia.org/wiki/Exclusive_or). The fitness function rewards networks that correctly compute XOR for all input combinations.

To run:
- Open the EvolveXOR simulation from the simulations menu
- Adjust parameters as desired
- Click "Evolve" to start the evolutionary process
- Watch as generations improve their ability to solve XOR

### Odor World Evolution

Networks can be evolved to control agents in odor worlds. The fitness function typically rewards:
- Finding food sources
- Avoiding obstacles or threats  
- Efficient movement patterns
- Complex behaviors like exploration

These simulations demonstrate how evolutionary algorithms can discover control strategies without explicit programming.

## Creating Custom Evolutionary Simulations

To create your own evolutionary simulations:

1. Define a fitness function that evaluates simulation performance
2. Specify what parameters or structures should be evolvable
3. Set up mutation operators that create variation
4. Configure the evolutionary parameters (population size, mutation rates, etc.)
5. Run the evolution and analyze results

See the custom simulations documentation for implementation details.

## Advanced Features

### Network Structure Evolution

Beyond evolving connection weights, Simbrain's evolution framework can:
- Add or remove neurons
- Modify connection patterns
- Change neuron types and update rules
- Adjust learning parameters

This enables evolution of both network topology and parameters simultaneously.

### Multi-Objective Evolution

Some simulations support optimizing multiple objectives:
- Speed vs. accuracy trade-offs
- Energy efficiency vs. performance
- Robustness vs. specialization

