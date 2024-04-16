---
title: Odor World
parent: Worlds
layout: default
has_children: false
nav_order: 55
---

# Odor World

## Background Info

* This file contains preliminary information to be used in writing the odor world 4 documentation. As of 2/1/24 much of it is out-dated* 

* Also see  [developer docs]https://docs.google.com/document/d/1BvJrQsAi30Sz7B6AEvDY9V-EM_rxMKXccV8KCn6kWvI/edit?tab=t.0#heading=h.mpyrjdqrtnb1, discussion of tiled and odor world

* See youtube video on Odorworld / Simbrain

* Explain how to set dispersion on object sensors.  It’s kind of hidden.  The dispersion tab of the entities is also confusing.

* Smell is only vector now.  Scalar function is taken on by object sensor.  The case of scalar smells was really used to capture object detection, which we now handle with a new function: object detectors

## Test

* Make a workspace file (or files) that uses every odor world sensor and effector

## Effector/Sensor General Information

In Simbrain, factors that cause an effect on agents are called Effectors which can be coupled to output neurons in neural networks. When a neuron is activated, its corresponding effector is also activated, causing the agent to perform an action (moving forwards/backwards, turning left/right, and making an utterance).

Factors that allow agents to sense their environment are called Sensors which can be coupled to input neurons in neural networks for visualization. When a sensor gets activated, its corresponding neuron is also activated.

Sensors (with the exception of smell sensors) do not come built-in to agents by default, but can be added by opening the Add Sensor window and defining the sensor type. To add an object sensor to an entity, first set Enable Sensors to ‘Yes’. 

## Common Parameters:
* Label
    An optional string descriptor associated with an effector. The default label summarizes function.

* Sensor Angle
    Determines the angle from the agen’s center of perspective at which the sensor will be placed. An angle of 0 places a sensor directly in front of the agent, a positive angle places a sensor to the left of the agent, and a negative angle places a sensor to the right of the agent.

* Sensor Length
    Determines the distance from the agent’s center to which the sensor will be added. A sensor length of 0 places a sensor at the very center of the agent, which makes the sensor angle irrelevant.

## Speech Effector
Agents in Simbrain can emit speech via speech effectors.
Speech effectors are invisible and are characterized by the following parameters:
* Label [link]

* Utterance
    The string or phrase associated with a speech effector which, when in close proximity, activates a hearing sensor associated with the same string or phrase.

* Characters per Row
    The maximum number of characters that can be displayed in one row of the hearing bubble. This only affects visual presentation/display and has no effect on activation parameters.

* Threshold
    The activation threshold above which an utterance can be detected by a speech effector’s hearing sensor counterpart.

## Straight Movement
Agents in Simbrain can be prompted to move forward via straight movement effectors. So long as the neuron coupled to a straight movement effector is activated, the Agent will continue to move forward unless another entity stops it from doing so. 
Straight movement effectors are characterized by the following parameters:
* Label[link]

* Base Movement Amount
    Determines the distance in pixels that the agent moves when this effector is activated. A positive value moves the agent straight forward, a negative value moves the agent straight backward.

## Turning Effector
Agents in Simbrain can be prompted to shift it’s direction to the left or right via turning effectors. When the neuron coupled to a turning effector is activated, the agent’s movement will shift according to the turning direction and magnitude specified by the effector.
Turning Effectors are characterized by the following parameters:
* Label[link]

* Turning Direction and Weight
    Determines the direction and magnitude of an agent’s turn. 
    Direction - A positive value makes the agent turn left, a negative value makes the agent turn right. 
    Weight - Any number besides 1 or -1 will scale the turn’s magnitude. This is basically a scalar multiplied by the turning magnitude to determine the change in an agent's movement.

* Turning Amount
    Determines the magnitude of an agent’s turn (in radians) with respect to the turning direction.

## Bump Sensor
Agents in Simbrain can sense the presence of objects in OdorWorld such as trees, tents. etc. An agent can detect when it ‘bumps’ or touches one of these map objects via bump sensors. Each bump Sensor is graphically represented by a white dot and are characterized by the following parameters:
* Label[link]

* Sensor Angle[link]

* Sensor Length[link]

* Base Value
    Determines the output value when a sensor is ‘bumped’ by an object. 

## Grid Sensor
Agents in Simbrain are able to detect their spatial location in the OdorWorld map via grid sensors. Grid sensors can be coupled to neural networks to visualize location through neural activation. Each grid sensor is graphically represented by a black cross.

Note that it is up to the user to make a neuron group with a shape that matches the grid sensor to get expected results

### Parameters:
* Label[link]

* Sensor Angle[link]

* Sensor Length[link]

* Activation Amount
    Determines the amount of activation for a neuron coupled to a tile sensor when the tile sensor is activated.

* Start X
	Defines the x-coordinates for the location of the top-left corner of the tile sensor.

* Start Y
	Defines the y-coordinates for the location of the top-left corner of the tile sensor.

* Num Columns
	Determines the number of columns in the sensor grid.

* Num Rows
	Determines the number of rows in the sensor grid.

* Cell Width
	Determines the width (horizontal length) of each tile in the sensor grid.

* Cell Height
    Determines the height (vertical length) of each tile in the sensor grid.

## Hearing Sensor
Agents in Simbrain can detect speech emitted by speech effectors via hearing sensors. Each hearing sensor is associated with a specific utterance (string or phrase) and is activated by speech effectors of the same utterance. Hearing sensors are therefore dependent on its speech effector counterpart for activation.

### Parameters:
* Label[link]

* Sensor Angle[link]

* Sensor Length[link]

* Utterance
    The string or phrase associated with a hearing sensor which activates only in the presence of a speech effector of the same string or phrase.

* Characters per Row
    The maximum number of characters that can be displayed in one row of the hearing bubble. This only affects visual presentation/display and has no effect on activation parameters.

* Output Amount
    The amount of activation sent to the neuron coupled to a sensor, this is usually set to 1 (0 for inactivation).

## Object Sensor
Agents in Simbrain are able to detect the presence of objects via object sensors. This is a simple alternative to using smell sensors [link].   An object sensor reacts to a specific object type (which is set in the object type field of the entity dialog [link]).   Object sensors are graphically represented by a white dot.

### Parameters:
* Label[link]

* Sensor Angle[link]

* Sensor Length[link]

* Object Type
	Determines the type of object a sensor responds to (ex. Swiss, Candle, Fish).

* Show Label
    Determines whether or not to make the label visible on top of the sensor node. ‘Yes’ to show label, ‘No’ to hide label.

* Base Value
	Specifies the base value of the output before the decay function applies.

* Decay Function
    Specifies the type of decay function applied to the sensor (Gaussian, Linear, Quadratic, Step).

## Smell Sensor
Agents in Simbrain can detect smells that are emitted by other agents or entities. Each agent in an Odor World by default has three smell sensors: a left whisker, a central sensor, and a right whisker. The left and right whiskers shoot off symmetrically from the agent’s center of perspective. Each smell sensor is graphically represented by a white dot .

### Parameters:
* Label[link]

* Sensor Angle[link]

* Sensor Length[link]

## Tile Sensor
Agents are able to sense their location in the OdorWorld map via tile sensors. An input neuron coupled with a tile sensor mimics the behavior of a place cell, which is a cell that fires when an agent senses that it is inside a location associated with that particular cell. Therefore, a tile sensor gets activated when an agent is situated inside its corresponding tile.

### Parameters:
* Label[link]

* Sensor Angle[link]

* Sensor Length[link]

* Output Amount 
    Specifies the amount of activation sent to the neuron coupled to a sensor. This is usually set to 1 (0 for inactivation).
    
* Tile ID
    The ID number of the tile a sensor is programmed to sense.
