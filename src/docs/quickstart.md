---
title: Quick Start and Shortcuts
layout: default
has_children: false
nav_order: 7
---

# Quick Start and Shortcuts

## Some quick things you can do to see things happen...

Run simulations from the `simulations` menu.

Open different workspaces using `File > Open Workspace` (open the .zip files) and press play  in the in the workspace toolbar to see what happens.

See youtube videos online.

## Important things to be able to do

* To get rid of everything in the workspace, use `File > Clear Workspace`.

* To Add networks to the workspace. Click the network button  in the main toolbar a few times. You should see a few networks show up. You can move them around however you like and resize them. 

<!-- TODO -->
* Iterate. Iterate the network once. This can be done by clicking the  button in the desktop toolbar, or pressing the space-bar in the network (these are slightly different operations, but we can ignore the distinction for now). Observe activation pass from the source to the target neuron. Iterate again and the activation clears out.

## Basic things to do in a network

* Add neurons to a network. Click in one of the networks you created (most of the next steps assume you have created a network and it is in focus).  Now create some neurons, by presing the button or using the "p" key. Do this a few times to create a line of neurons. (For all network key commands, the network window must be selected for the command to work)

* Select neurons and other models. Use the mouse to draw a lasso around the neurons so that they are selected. You can also press the "n" button to select all neurons. Green halos will show up around these neurons signifying that you have selected them.

* Randomize models. With neurons selected, press the randomize button  or pressing "r". Do this a few times to get a sense of what happens when neurons are randomized.

* Copy and paste. Select some neurons, copy them using Edit > Copy (or command-c), click where you want to put a copy of those neurons, and then paste them there using Edit > Paste (or command-v). Press paste repeatedly to see multiple copies of these neurons appear.

* Delete. Select all your neurons using "n", and press the delete button  or the "backspace" or "delete" key.

* Add activation or strength. Select the source neuron you just created. Press the "up" arrow button, and observe the value of the neuron change upwards.

* Clamp things.

* Select and randomize a weight. Select the weight you created by clicking on it (the weight or synapse is the red disk connecting one node to another; see the picture here) . If that is tricky, lasso over the connection line. You can also press "w", which selects all weights. A green halo will show up around the weight. 

* Ranomize weights. As with neurons, randomize by pressing the randomize button  or pressing "r". Do this a few times to get a sense of what happens when synapses are randomized. If they are positive their color is red; if negative blue. The size of the weight is proportional the strength of the synapse.

<!-- Redo with network models  -->
* Having randomized this weight, again add activation to the source neuron and iterate the network, to see that the activation propagates differently.

* Add other objects. A layered network or "feedforward" network is one in which the nodes are organized in to a sequence layers, where each node in one layer connects to all the nodes in the next layer.  Activation flows from an input layer to an output layer.  There are no loops so these networks tend to "dissipate" activation.)

## Connect one neuron to another using the 1-2 trick.

1. Create two neurons. You will make a connection from a "source" to a "target" neuron.
2. Designate one neuron as a "source neuron",  by selecting Edit > Connect > Set source neuron(s) or pressing the "1" key, which is a keyboard shortcut for selecting source neurons. Observe the red halo that appears around the neuron.
3. Select the target neuron just by lassong it using your mouse.
4. Connect the source to the target neuron using Edit > Connect > All to all or by pressing the "2" key.   If a dialog appears just click "OK".  This dialog will not appear if you click "2".
    After a while you can get quick at selecting, and using this sequence:
    select source neurons > "1" > select target neurons > "2"
5. If you like, clear the "source neuron" halo by going to Edit  > Clear source neuron(s) or by clicking outside any neurons or weights and pressing "1".


<!-- 
Let's make a new network. Delete everything you've done up until now (press "a" to select all and delete to delete).
1. Make a row of neurons by pressing "P" a few times.

2. Copy and paste those neurons and move them right above the first neurons.

3. Repeat. You should now have three rows or "layers" of neurons.

4. Select the bottom row and make them source neurons using Edit  > Set source neuron(s) or by pressing the "1" key.

5. Select the middle row and connect using Edit > Connect  > All to all or by pressing the "2" key.

6. Now immediately make the middle row the new source neurons by pressing "1" while they are still selected

7. Select the final row and press "2" to connect.

8. Activate the bottom row by selecting those neurons and pressing the "R" button to randomize them.

9.Iterate the network a few times pressing the space-bar, to see activation propoagate through the network

## Make a recurrent network 

(A recurrent network is a network which contains "loops" or "cycles", in the sense that one can begin at some nodes, follow connections, and end up back at the same node.   Because activation can repeatly flow through the loops in recurrent networks, they can display interesting dynamics.)

1. Make a grid of neurons using Insert > Add Neurons... A dialog will show up asking you how many neurons you want to create. Say 9 and press OK.

2. Select all the neurons with "N"

3. Connect them all to themselves by pressing "1" then "2".   (This works because in step 2 they were designated as target neurons, and by pressing "1" they were designated as source neurons, and  pressing "2" connected all source to all target neurons).

4. Randomize the weights by first pressing "w" to select all weights, and then pressing "r" to randomize them.

5. Randomize the neurons by first pressing "n" to select all neurons, and then pressing "r" to randomize them.

6. Iterate the network using the spacebar. Observe the changing behavior. Periodically re-randomize the neurons using "N" followed by "R".

## Edit a few neurons

1. Select all the weights in your network by pressing "w" or using Select > Edit Selected Neurons

2. Double click one of the neurons, or use Edit > Edit Selected Neurons. A neuron dialog will show up allowing you to edit these neurons. Click on the More drop-down, and change the Clamped property to Yes.

3. Randomize the network and iterate it, and observe that the neurons whose update rule is clamped do not change.

## Edit weights

1. Select all the weights in your network by pressing "w" or using Select > Select All Weights.

2. Edit the weights using Edit > Edit Selected Synapse(s). A synapse dialog will show up allowing you to edit these weights. Change the learning rule to Hebbian.

3. Randomize everything by using Select > Select All or pressing "a" and then pressing "r" (this randomizes weights and neurons).

4. Press the play button . Periodically press "a" then "r" to re-randomize the network. Notice that the weights slowly change their size, becuse they are learning using the Hebb rule.

## Create a bar chart

Don't delete the network you just created. We will now graph its activity using a bar chart.

1. Add a bar chart to the workspace using Desktop Menu: Insert > New Plot > Bar Chart or by clicking on the plot menu button bar chart icon in the desktop toolbar and selecting "Bar Chart"

2. Connect the network to the bar-chart using the coupling manager.   Open the coupling manager using Couplings > Open Coupling Manager...  On the left side of the dialog under Producers select the network you created.  On the right side under Consumers select the bar chart you created.  Select all the neurons on the left and all the bars on the right, and click Add Couplings.

3. Iterate the workspace a few times the step button  , or run the workspace using the play button . While it's running periodically reset the network using select all and randomize ("A" then "R" while the network component is in focus), and observe the changing pattern in the bar chart.

# Examples

Here are some quick tutorials on how to do specific things in Simbrain.    The basics of building a network and other simple examples are covered in the quick-start.

## Plot the activation of a node over time with a time-series plot.

1) Create a neural network and a time series plot. 

2) Create  a coupling from a node in the neural network to a time series in the plot.   The easiest way to do this is as follows.  Right click on the node whose activation you want to plot, and in the context menu go to Send coupling to > TimeSeriesPlot1 > Series0.   (TimeSeriesPlot1 is the name of the time series plot. If you have multiple plots open it might be a different name.  Series0 is a particular time series in the plot.)   By repeating this for different nodes you can plot the activation of multiple neurons at once.  If you want to add more time series beyond the default 5, click "add" in the time series component. 

3) Now run your simulation and you should see a plot of the changing activation of the neuron.  For some purposes it helps to turn "auto range" off in the time series preferences, and manually set  upper and lower bounds.


## Plot the activation of a set of nodes using a projection plot and the coupling manager

(There are other ways to do this, some of them simpler in some cases, but this technique also shows you how to use the coupling manager).  This assumes a network component is open in the desktop.

1) Open a projection plot.  To do this either press on the plot button in the desktop toolbar, which opens up a drop down menu with different plot components, or use the menu Insert > New Plot >...  Then select projection plot.  The will add a projection plot to your desktop with a default name like "Projection 1".

2) Open the coupling manager using the Couplings > Open Coupling Manager button.

3) On the left panel of the coupling manager, use the top drop down box (which allows you to select components) to select the network whose activity you want to plot.

4) On right panel of the coupling manager, select the plot component you added to the desktop in step 1, e.g. "Projection 1".

5) In the left panel, highlight rows corresponding the neurons whose activity you are interested in plotting (do this by clicking on rows while holding the shift key down).   Neurons are labelled by ids.  To find the neurons' ids in the network window you can hover over them and look at the tooltip.

6) In the right panel of the coupling manager,  highlight all the "dimension" attributes either using the mouse or by pressing command-a while that panel is in focus.

7) Click "add couplings" at the bottom of the coupling manager window.
Now when you run the workspace each new network state should produce a point in the projection plot.

Note that if you plot more than 25 neurons you will have to add more dimensions to the projection plot using the add dimension button in the projection plot, or the menu Edit > Set dimensions...   If you use less than 25 neurons you don't have to reset the projection plot but you can if you'd like.

## Train a backprop network on a pattern association task

1) Create a backprop network, using the menu Insert > Insert Network > Backprop

2) Enter a topology (a layout for the network) in the dialog that appears.   For example, enter "4,5,4" for a backprop network with 4 input nodes, 5 hidden layer nodes, and 4 output nodes.

3) Now you have to create some a training set: set of input vectors and a set of target vectors which you want the network to associate.    To do either double click on the backprop tab or  right-click on it and select "Edit / Train Backprop...". 

4) In the input data and target data tabs, edit the cells of the tables to create a pattern assocation task.  Row 1 of input will be associated with row 1 of target, row 2 with row 2, etc.

5) Now all that's left to do is to actually train the network.  To do this,  go to the train tab and press the run button.   This runs the algorithm, which adjusts the weights to try to achieve the desired input output mapping.   As the trainer runs, the error should go down.  Once the error gets to an acceptable level (often something below .1), press the stop button.  If you have trouble getting a low value you can press the randomize button and try again. Note: Depending on the associate task you set up in step 4 you may not be able to achieve a sufficiently low error value.

7) Now you can test your network to see how well it did.  To do this go to the test data tab, and click the test row button.  This will send each row of data to the network.   The target data you trained it on should appear with each click of the test row button. -->

# Keyboard Shortcuts

## Desktop

- **Command-o:** Open a workspace file
- **Command-s:** Save the current file
- **Command-n:** Create a new network
- **Command-k:** Clear workspace (close all components)
- **Command-q:** Quit

## All Components

- **Command-o:** Open a file of the given workspace type
- **Command-s:** Save the current file
- **Command-w:** Close the component

## Network Component (Network must be in focus)

- **1:** Set selected nodes to source nodes
- **2:** Connect source to target nodes using current connection (by default all to all)
- **5:** Turn display of weights on and off. Performance goes way up when weights are - off so this is a good one to know!
- **c:** "Clear" all. Set selected nodes and weights to zero. WARNING! Setting weights to zero is not always a desired outcome! Use with caution. A safer alternative is - 'k' which only clears node activations.
- **Command-c:** Copy selected items (does not apply to all groups and subnetwork types)
- **Command-d:** Duplicate selected items
- **Alt-d:** print debug info to the console (only visible if Simbrain is run from a - terminal command).
- **Command-e:** Edit selected neurons or weights
- **f:** Fit camera to screen
- **F:** Freeze / clamp selected nodes and weights. Repeat to toggle freezing / clamping.
- **g:** Create a new neuron group
- **Command-G:** Add selected free neurons to a neuron group
- **i:** Wand mode
- **k:** Clear all node activations. Leaves nodes selected so that, for example, this - can be followed by a randomization (r).
- **n:** Select all neurons
- **p:** Add or "put" a new node. Nodes will be added next to selected nodes or where - you last clicked in the network panel
- **r:** Randomize selected objects.
- **s:** Selection mode (the default mode)
- **t:** Text mode
- **w:** Select all weights
- **Command-v:** Paste selected items
- **Command-x:** Cut selected items
- **Delete:** Delete selected items
- **Escape:** Unselect all objects and remove source handles
- **Arrows:** Increment or decrement selected items (neurons or synapses).
- **Option-Arrows:** Contextually increment or decrement selected neurons.
- **Shift-Arrow:** Nudge objects (move them a few pixels)
- **Space-bar:** Update network

## Some Useful Key Sequences

- **n > c:**   to clear all neurons (set them to 0)
- **n > r:**    to randomize all neurons
- **w > r:**   to randomize all weights
- **a > r:**   to randomize all weights and neurons
- **n > 1 > 2  > r:** (to create a recurrent network where each node connects to all others)

## Key Sequences for connecting neurons

`Select source neuron(s)  > press 1 >  select target neuron(s) > press 2`  
(Repeat as needed; when done, click in an empty part of the network window to-deselect all neurons, and press 1)

## Dataworld Component

**Command-r:** randomize all cells within given bounds.
**Command-n:** normalize all values relative to columns.
**Command-z:** zero out all cells

## Notes on shortcuts

* "Command" is a different key on different systems:
    * PC: Control or "CTRL" key
    * Mac: The "command" or "Apple" key.
    * Linux: The "CTRL" key.
* The component-specific commands only work if that component is in focus (click on the component to place it in focus)
* The network key commands are especially useful for rapidly building networks!