---
title: Odor World
parent: Worlds
layout: default
has_children: false
nav_order: 55
---

# Odor World

The Odor World component is used to simulate a creature in a
two-dimensional world. It provides a way to study the embodiment of a
neural network in a physical environment, a kind of platform or test-bed
for modeling embodied agents controlled by neural networks.

The Simbrain odor world consists of a tilemap, and one or more entities.
The entities can be equipped with sensors and effectors and thus coupled
to neural networks and other workspace components. To move an entity
select and use the arrow keys or ASDW on your keyboard to move the
entity around the map.

# Tile Map


A tile map provides a way to structure a 2d video game. See
[[https://en.wikipedia.org/wiki/Tile-based_video_game]{.underline}](https://en.wikipedia.org/wiki/Tile-based_video_game)

The tile maps are a grid of tiles. To see the available tiles you can
double click anywhere in the world, and you will see the tile set
available. The one that is surrounded has black around it. You can
double click to set that tile.

![Tile Set](/assets/images/tileSelector.png)

The tile map is also organized into layers. To edit the layers use the
`Edit > Edit Layers` dialog. This allows you to specify some layers as
blocking, which means agents won't be able to pass through nonempty
tiles in that layer. This is the Yulin's World tile map. If you open
Yulin's work and open this dialog and click on the visible checkboxes
the way it works should be intuitive,

![Tile Layer Editor](/assets/images/tileLayerEditor.png)

Tilemaps are based on [Tiled](https://www.mapeditor.org/) and in maps made in Tiled can be exported.

# Sensors and Effectors

Factors that allow an agent to move or act are called effectors. Neurons
can be coupled to effectors in order to control an agent. When a neuron
coupled to an effector is activated, its corresponding effector is also
activated, causing the agent to perform an action (moving
forwards/backwards, turning left/right, and making an utterance).

Factors that allow agents to sense their environment are called sensors.
Sensors can be coupled to input neurons in neural networks for
visualization. When a sensor gets activated, its corresponding neuron is
also activated.

Sensors do not come built-in to agents by default, but can be added by
opening the Add Sensor window and defining the sensor type. To add an
object sensor to an entity, first set Enable Sensors to 'Yes'.

Parameters:

-   **Label:** An optional string descriptor associated with an
    effector. The default label summarizes function.

-   **Sensor Angle:** Determines the angle from the agent's center of
    perspective at which the sensor will be placed. An angle of 0 places
    a sensor directly in front of the agent, a positive angle places a
    sensor to the left of the agent, and a negative angle places a
    sensor to the right of the agent.

-   **Sensor Length:** Determines the distance from the agent's center
    to which the sensor will be added. A sensor length of 0 places a
    sensor at the very center of the agent, which makes the sensor angle
    irrelevant.

# Sensors

An \[agent\] in Odor World also has sensors that it uses to receive
information from its environment. These sensors can be \[coupled\] with
input neurons in neural networks so that a neuron fires each time a
sensor gets activated.

To view an agent\'s sensors, double click on the agent to display the
\[entity dialog\] and select the sensors tab. The sensor panel lists all
of an agent\'s sensor type and labels. Here is an example of the dialog,
for an agent with three small sensors:


Labels can be renamed by double-clicking on the label column.\
To edit a sensor, right-click on any part of the row and select \"Edit
Sensor\"

To delete a sensor, select all the sensors to be deleted in the list and
click on the \"Delete\" button at the bottom of the panel.

To add a sensor, click on the \"Add\" button at the bottom of the panel.
Then, select the sensor type and input the appropriate parameters.

The different types of sensors in Odor World are described below.

## Smell Sensor

Objects in Odor World can emit smells that smell sensors can detect. See
the \[objects and smell sources\] page for more details on how smell
vectors and sensor vectors work, and how they can be used in couplings.

Each agent in an Odor World by default has three smell sensors: a left
whisker, a central sensor, and a right whisker. The left and right
whiskers shoot off symmetrically from the center perspective of the
agent at an angle determined by the parameter Sensor Angle, denoted by
theta in the image below, which is in degrees.

![](media/image1.gif){width="1.9270833333333333in"
height="1.2708333333333333in"}

Parameters:

-   **\[Label\]:**

-   **\[Sensor Angle\]:** The angle at which the smell sensor will be
    added. A sensor angle of 0 is a smell sensor that is directly in
    front of the agent. A positive sensor angle locates the sensor at a
    position to the left of the agent\'s heading. A negative sensor
    angle locates the sensor at a position to the right of the agent\'s
    heading.

-   **\[Sensor Length\]:** The distance from the center of the entity to
    which the smell sensor is to be added. A sensor length of 0 makes
    sensor angle irrelevant since located at the center of the agent.

## Hearing Sensor

A Hearing sensor listens for a \[speech effector\] which says the same
word that the hearing sensor listens for. When a hearing sensor is
activated by a speech effector, a thought bubble containing the
associated utterance is displayed in Odor World. See the workspace
bischof.zip for an implementation of hearing.

Parameters:

-   **Label:** `link`

-   **Sensor Angle:** `link`

-   **Sensor Length:** `link`

-   **Utterance:** The string or phrase associated with a hearing sensor
    which activates only in the presence of a speech effector of the
    same string or phrase.

-   **Characters per Row:** The maximum number of characters that can be
    displayed in one row of the hearing bubble. This only affects visual
    presentation/display and has no effect on activation parameters.

-   **Output Amount:** Specifies the amount of activation sent to the
    neuron coupled to a sensor. This is usually set to 1 (0 for
    inactivation).

## Grid Sensor

Agents in Simbrain are able to detect their spatial location in the
OdorWorld map via grid sensors. Grid sensors can be coupled to neural
networks to visualize location through neural activation. Each grid
sensor is graphically represented by a black cross.

Note that it is up to the user to make a neuron group with a shape that
matches the grid sensor to get expected results

Parameters:

-   **Label:** `link`

-   **Sensor Angle:** `link`

-   **Sensor Length:** `link`

-   **Activation Amount:** Determines the amount of activation for a
    neuron coupled to a tile sensor when the tile sensor is activated.

-   **Start X:** Defines the x-coordinates for the location of the
    top-left corner of the tile sensor.

-   **Start Y:** Defines the y-coordinates for the location of the
    top-left corner of the tile sensor.

-   **Num Columns:** Determines the number of columns in the sensor
    grid.

-   **Num Rows:** Determines the number of rows in the sensor grid.

-   **Cell Width:** Determines the width (horizontal length) of each
    tile in the sensor grid.

-   **Cell Height:** Determines the height (vertical length) of each
    tile in the sensor grid.

## Object Sensor

Agents in Simbrain are able to detect the presence of objects via object
sensors. This is a simple alternative to using smell sensors `link`.
An object sensor reacts to a specific object type (which is set in the
object type field of the entity dialog `link`). Object sensors are
graphically represented by a white dot.

Parameters:

-   **Label:**`link`

-   **Sensor Angle:** `link`

-   **Sensor Length:** `link`

-   **Object Type:** Determines the type of object a sensor responds to
    (ex. Swiss, Candle, Fish).

-   **Show Label:** Determines whether or not to make the label visible
    on top of the sensor node. 'Yes' to show label, 'No' to hide label.

-   **Base Value:** Specifies the base value of the output before the
    decay function applies.

-   **Decay Function:** Specifies the type of decay function applied to
    the sensor (Gaussian, Linear, Quadratic, Step).

## Bump Sensor

Agents in Simbrain can sense the presence of objects in OdorWorld such
as trees, tents, etc. An agent can detect when it 'bumps' or touches one
of these map objects via bump sensors. Each bump Sensor is graphically
represented by a white dot and are characterized by the following
parameters:

Parameters:

-   **Label:** `link`

-   **Sensor Angle:** `link`

-   **Sensor Length:** `link`

-   **Base Value:** Determines the output value when a sensor is
    'bumped' by an object.

## Tile Sensor

Agents are able to sense their location in the OdorWorld map via tile
sensors. An input neuron coupled with a tile sensor mimics the behavior
of a place cell, which is a cell that fires when an agent senses that it
is inside a location associated with that particular cell. Therefore, a
tile sensor gets activated when an agent is situated inside its
corresponding tile.

Parameters:

-   **Label:** `link`

-   **Sensor Angle:** `link`

-   **Sensor Length:** `link`

-   **Output** **Amount:**

-   **Tile** **ID:**

# Effectors

An agent in Odor World uses effectors to move and speak. Effectors are
couples with output neurons in neural networks. When neurons activate an
agent's effectors, it performs the action associated with the effector,
either moving, turning, or making an utterance.

To display an agent's effectors, double click on the agent in Odor World
and select the effectors tab. The effector panel lists all of an agent's
effectors along with its effector type and label.

Labels can be renamed by double clicking on the label column.

To edit an effector, right click on any part of the row and select "Edit
effector.."

To add an effector, click on the "Add" button at the bottom of the
panel. Then select the effector type and input the appropriate
parameters.

To delete an effector, select the effectors to be deleted in the list
and click on the "Delete" button at the bottom of the panel.

The different types of effectors in Odor World are described below.

## Speech Effector

Agents in Simbrain can emit speech via speech effectors. Speech
effectors are invisible and are characterized by the following
parameters:

Parameters:

-   **Label:** `link`

-   **Utterance:** The string or phrase associated with a speech
    effector which, when in close proximity, activates a hearing sensor
    associated with the same string or phrase.

-   **Characters per Row:** The maximum number of characters that can be
    displayed in one row of the hearing bubble. This only affects visual
    presentation/display and has no effect on activation parameters.

-   **Threshold:** The activation threshold above which an utterance can
    be detected by a speech effector's hearing sensor counterpart.

## Straight Movement

Agents in Simbrain can be prompted to move forward via straight movement
effectors. So long as the neuron coupled to a straight movement effector
is activated, the Agent will continue to move forward unless another
entity stops it from doing so. Straight movement effectors are
characterized by the following parameters:

Parameters:

-   **Label:** `link`

-   **Base Movement Amount:** Determines the distance in pixels that the
    agent moves when this effector is activated. A positive value moves
    the agent straight forward, a negative value moves the agent
    straight backward.

## Turning Effector

Agents in Simbrain can be prompted to shift its direction to the left or
right via turning effectors. When the neuron coupled to a turning
effector is activated, the agent's movement will shift according to the
turning direction and magnitude specified by the effector. Turning
Effectors are characterized by the following parameters:

Parameters:

-   **Label:** `link`

-   **Turning Direction and Weight:** Determines the direction and
    magnitude of an agent's turn. Direction - A positive value makes the
    agent turn left, a negative value makes the agent turn right.
    Weight - Any number besides 1 or -1 will scale the turn's magnitude.
    This is basically a scalar multiplied by the turning magnitude to
    determine the change in an agent's movement.

-   **Turning Amount:** Determines the magnitude of an agent's turn (in
    radians) with respect to the turning direction.

# Menu Commands

## File Menu

- **Import from xml**: Import data from a .csv file (comma separated values).
- **Export from xml**: Export (.csv) : Export data to a .csv file (comma
separated values).
- **Load Tile Map**: Load premade tile maps
- **Preferences**: Set preferences for whether you want map boundaries to
wrap around, objects to block movement, camera centering through 'yes'
or 'no' options.
- **Rename**: rename world
- **Close**: Close the current Odor World

## Edit Menu

- **Add Entity**: Add cheese entity
- **Add Object**: Add mouse agent
- **Delete selected entities Backspace**: deletes whatever entity/object is
currently selected
- **Edit Layers**: allows you to edit tile layers to be visible and
enable/disable blocking for each layer
- **Turn on all trails**:
- **Turn off all trails**
- **Clear all trails**

# Todos

Main Todos

-   Document all menu items

-   Discuss which dialogs need images.

-   Remove redundancies. Find a way to put it in one place.

Jeff todos

-   Agent vs entity

-   Fill in Tile Map

-   Explain how to set dispersion on object sensors. It's kind of
    hidden.

-   The dispersion tab of the entities is also confusing.

-   Smell is only vector now.

-   Scalar function is taken on by object sensor. The case of scalar
    smells was really used to capture object detection, which we now
    handle with a new function: object detectors.
