---
title: NPC Behaviors
layout: default
parent: Odor World
grand_parent: Worlds
has_children: false
nav_order: 20
---

# NPC Behaviors

NPC behaviors are programmatic movement rules for [Odor World](odorworld) entities. They are configured in an entity's Behavior tab and run once per workspace update. A behavior writes movement commands for the entity, so it can be used to create autonomous agents without building a neural controller for every moving object.

These are examples of classic AI [steering behaviors](https://www.red3d.com/cwr/steer/gdc99/). Pursue and Evade are also related to the broader [pursuit-evasion](https://en.wikipedia.org/wiki/Pursuit%E2%80%93evasion) problem.

Behaviors are useful for background agents, moving targets, threats, comparison policies, and demonstrations where some entities should move reliably while other entities are controlled by neural networks.

## Common Entity Settings

- **Behavior**: Selects the behavior used by the entity. Options include None, Pursue, Evade, and Wander. None is the default.
- **Show Steering Debug**: Draws the candidate headings, obstacle feeler hits, and behavior notes used by the steering behavior. This is useful for understanding why an entity chose a particular direction.

## None

None is the default behavior. It does not change the entity's movement, so use it when an entity should be moved manually, controlled by effectors, or left stationary.

## Pursue

Pursue steers toward the nearest visible entities of a selected target type. It can predict where targets will be in the near future and can avoid walls or non-target entities while chasing.

- **Target Type**: Entity type to chase.
- **Max Speed**: Maximum forward movement speed.
- **Vision Range**: Maximum distance at which targets are detected.
- **Lead Ticks**: Number of ticks ahead to predict the target's position.
- **Max Turn**: Maximum heading change per tick.
- **Obstacle Feeler Length**: Distance ahead to probe for walls and other entities.
- **Obstacle Avoidance Weight**: Strength of obstacle avoidance relative to target attraction.
- **Num Rays**: Number of candidate headings sampled each tick. More rays can find narrower paths but cost more to compute.

## Evade

Evade steers away from visible entities of a selected threat type while avoiding obstacles. It stops when no matching threat is within vision range.

- **Threat Type**: Entity type to flee from.
- **Max Speed**: Maximum forward movement speed.
- **Vision Range**: Maximum distance at which threats are detected.
- **Lead Ticks**: Number of ticks ahead to predict each threat's position.
- **Max Turn**: Maximum heading change per tick.
- **Obstacle Feeler Length**: Distance ahead to probe for walls and other entities.
- **Obstacle Avoidance Weight**: Strength of obstacle avoidance.
- **Threat Weight**: Strength of threat avoidance relative to obstacle avoidance.
- **Num Rays**: Number of candidate headings sampled each tick.

## Wander

Wander produces coherent random motion. The entity maintains a desired heading that drifts over time, steers toward that heading, and avoids obstacles.

- **Max Speed**: Maximum forward movement speed.
- **Max Turn**: Maximum heading change per tick.
- **Obstacle Feeler Length**: Distance ahead to probe for walls and other entities.
- **Obstacle Avoidance Weight**: Strength of obstacle avoidance.
- **Heading Drift**: Maximum random change of the desired heading per tick.
- **Num Rays**: Number of candidate headings sampled each tick.

## Steering Debug

When **Show Steering Debug** is enabled, Odor World draws the behavior's candidate directions and obstacle checks around the entity. This makes it easier to tune parameters such as vision range, feeler length, obstacle avoidance weight, and num rays.

If an entity gets stuck, the steering logic temporarily samples more candidate directions and adds a small angular offset to help it escape.
