---
title: Logistic Generator
layout: default
grand_parent: Networks
parent: Activity Generators
has_children: false
nav_order: 20
---

# Logistic Generator

A simple quadratic map that produces chaotic behavior. It based on the well-known [logistic](https://en.wikipedia.org/wiki/Logistic_map) map:

`x~n+1~=rx~n~(1−x~n~)`

The logistic map takes a number in the interval [0,1] back to itself. Here the quadratic map has been rescaled so that it takes a number in the interval from the **lower bound** to the **upper bound** back into itself. The growth rate determines the exact form of the quadratic function.

Note that the output of the function is **clipped** so as to stay within the upper and lower bounds.

Not to be confused with the **logistic sigmoid** neuron activation function.

## Growth Rate

`r` in the equation above. A number that determines the exact form of the quadratic function. It must be between 0 and 4. To produce chaotic behavior it should be between 3.56 and 4. Due to the presence of periodic windows not all growth rates in this interval produce chaos. By default the growth rate is 3.9, which does produce chaotic behavior.