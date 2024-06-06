---
title: Spiking Neurons
layout: default
parent: Networks
has_children: false
nav_order: 90
---

Also see

- Scholarpedia pages
- Javadoc files
- The Simbrain Book

Historically, there is a progression from 1d to 2d models

* Hodhkin Huxley. The OG.  4 or 5d

* Integrate and Fire is 1d. Some versions are 2d

* Fitzhugh Nagumo. Fit things well. Meant as simplification of HH. Showed you could capture a bunch of variance and behavior of the HH model in this simple 2d dynamical system.
    * Then other attempts to model not just voltage traces but also spikes and spike times, using these 2d simplifications.
    * Can get bursting behavior
    * Second variable is almost always some kind of adaptation.


Two Kinds of Spiking Model

## Spike Timing Emphasis

* Try to get good spike times

* Realistic voltage traces

* Diverge to infinity, by design

* Izhikevich, IntFire, Adex

* Adex is kind of gold standard  (Zoe is convinced)

* Good for getting time to happen when expected

* Can be good for voltage traces

* But they unstable dynamical systems

* These have the reset hacks to deal with divergence

* Adex is best in terms of realistically gettting us when spikes happen after an input- Izhik and quadratic intfire tend to not diverge to infinity quickly enough (spikes take too long to happen). IntFire spikes happen too soon.

* Morris lecar

* This is more back in the FN vein, and specifically trying to model calcium dynamics. Gives us a voltage trace dependent on calcium. 

* Get a good trace without modeling sodium directly

##  Membrane Trace emphasis

* FituzHugh, HH, MorrisLecar

* Good at voltage potential, accurate voltage trace

* Don't diverge to infinity

* Just treat spike as a certain value

* No resets

* Recovery variables
    * We run out of some chemical replenish

    * W. Should go down at a spike and go up

    * After the threshold, sodium rushes into the cell.  Gradient diffusion is always exponential. Derivative related to relative to concentration.

    * Because it saturates, it starts out exponential then saturates. Eventually reaches equilibrium.

    * Limited is not running out, but only intaking so much.

    * Response to that is to open calcium which rushes out 

    * All the metabolism is on not firing the gun but cocking it. Energy in the form of active pumps.

    * Fitzhugh emulates saturation of ions

    * Closest to sodium

    * Roughly speaking, as it goes up, influx 

    * Then it gets pumped out

## Background Currents

* If you don't have some background current, it takes a LOT of input to make a spike happen. unrealistic. You end up creating so much gain that you put the neuron in an unstable state where there is seizure activity. 

* The natural state of neurons is a bit of averaged activity from other places. Not sitting at their normal potential. Always receiving some inputs from somewhere. All of the neurons are in a sub-threshold excited state to start with. And aids in synaptic transmission.
    * If 0 input, must be blasted with a lot of current to get it above its threshold

    * If you blast it with that much, easy to overboard.  Seizure

    * The region where you get brain like activity is small

    * Background current is roughly like setting it up so that it's much closer initially to the boundary between quiescence and interesting. Otherwise far away from where interesting stuff is happening

## Avoiding blow up

* Time step should be low, but .1 usually ok

* Careful with time constants.

* Time constant must be positive and non-zero

* Should always be sig greater than the time step. Lower time-constants push it towards instability. Less than 1 makes more unstable.  Should not generally set it below 1.   Ideally at least 10. 

* 3 is ok for spike responders. Gets cleared from synaptic cleft very quickly. Otherwise no transmission. Rise and decay requires a bit more care. 

