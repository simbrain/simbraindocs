---
title: Test Inputs
layout: default
parent: UI and Tools
grand_parent: Networks
has_children: false
nav_order: 40
---

# Test Inputs

Test inputs provide a way to systematically send data to neurons or neuron groups for testing and validation purposes. They create an interactive table interface that allows you to step through predefined input patterns and observe network responses.

## Creating Test Input Tables

Test input tables can be created for individual neurons or neuron groups:

- **For Layers**: Use the right-click menu or the Insert menu to create a test input table
- **For Individual Neurons**: The test input panel adapts to work with single neurons
- **For Neuron Groups**: Test inputs work with entire neuron groups and collections

## Test Input Panel Interface

The test input panel provides:

- **Data Table**: Matrix editor showing input patterns as rows
- **Step Controls**: Buttons to step through test inputs sequentially  
- **Apply Actions**: Send current row data to the target neurons
- **Edit Controls**: Add, remove, and modify test input patterns

## Data Management

Test input data is stored as a matrix where:

- **Rows**: Represent individual test patterns
- **Columns**: Correspond to individual neurons in the target group
- **Values**: Activation values to be applied to neurons

## Application Methods

Test inputs can be applied in different ways depending on the target:

### Clamped Neurons
For clamped neurons (groups with `isAllClamped` or individual neurons that are clamped):
- Values are set directly as neuron activations
- Neurons maintain these values until explicitly changed

### Unclamped Neurons  
For unclamped neurons:
- Values are added as inputs using `addInputs()` 
- Neurons process these inputs according to their update rules
- Results depend on the neuron's current state and update rule

## Validation and Input Processing

The test input system includes validation:

- **Size Matching**: Input vectors must match the number of target neurons
- **Data Type Validation**: Values must be valid numeric inputs
- **Layer Compatibility**: Ensures inputs are compatible with target layer types

## Workflow Examples

### Basic Testing Workflow
1. Create or select a neuron group
2. Open the test input panel (Insert > Create Input Table)
3. Define test patterns in the data table
4. Use step controls to apply each test pattern
5. Observe network responses and behavior

### Interactive Testing
- Edit test patterns in real-time during testing
- Step forward and backward through test sequences
- Modify input values and immediately see results
- Use for debugging network behavior with known inputs

## Integration with Training

Test inputs complement training workflows:

- **Validation**: Test trained networks with held-out data
- **Debugging**: Verify network behavior with specific input patterns  
- **Analysis**: Systematically explore network response patterns
- **Development**: Test network components during development

Test inputs provide an essential tool for network validation and systematic testing of neural network behavior.

