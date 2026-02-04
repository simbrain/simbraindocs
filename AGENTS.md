# Simbrain Documentation - Guide for AI Assistants

This guide helps AI coding assistants work on Simbrain's user-facing documentation. The documentation is built with Jekyll using the Just the Docs theme and must stay synchronized with the Simbrain source code.

## Project Overview

User-facing documentation for Simbrain neural network simulator. Built with Jekyll + Just the Docs theme, deployed to https://www.simbrain.net/. Source code at https://github.com/simbrain/simbrain.

## Core Principle: Stay in Sync with Code

Documentation gets out of sync when code changes (terminology, features, parameters, UI). To stay current, reference the source code on GitHub when documenting features. Don't assume, discover what exists NOW.

## Finding Corresponding Code

When documenting a feature, find its implementation:

**GitHub URLs:**
- Main source: `https://github.com/simbrain/simbrain/tree/main/src/main/kotlin/org/simbrain/`
- Network features: `.../network/updaterules/`, `.../network/neurongroups/`, etc.
- Simulations: `.../custom_sims/RegisteredSimulations.kt`

**Key code patterns:**
- `@UserParameter` or `GuiEditable` - User-editable properties (document these)
- `enum class` - Dropdown options (document all values)
- `RULE_LIST` - Features available in UI (only document if in this list)
- `conditionallyEnabledBy` - Conditionally visible parameters

## Style Guide

**Front Matter:**
```yaml
---
title: Feature Name
layout: default
parent: Parent Page Name
published: true  # Set to false if not available in UI
---
```

**Formatting:**
- Minimize bolding: only for parameter names in lists, menu items, and list labels
- Don't bold first-use technical terms, algorithm steps, or descriptive prose
- Use backticks for menu paths: `` `Simulations > Competitive` ``
- Link cross-references: `[tolerance](#tolerance)` not `**Tolerance**`
- Use Title Case for enum values as shown in UI
- Omit label prefixes like "Properties:", "Note:", "Example simulation:"
- Link to parent pages with `.` not `index.html`
- Avoid em dashes (—) between phrases. Use commas, periods, or restructure
- Avoid headings beyond h3
- Keep lists minimal and focused

**What to document:**
- All `@UserParameter` and `GuiEditable` properties
- All enum options
- When parameters are conditionally visible
- What the feature does (not implementation details)

**What NOT to document:**
- Default values or ranges (they change)
- Features not in RULE_LIST or registry
- Implementation details

## Workflow

1. Read existing documentation to understand what needs updating
2. Check GitHub source code for the feature (use URLs above)
3. Extract user-facing info (parameters, enums, availability)
4. Update documentation to match code exactly
5. Verify using checklist below

## Verification Checklist

- [ ] All `@UserParameter` and `GuiEditable` parameters documented
- [ ] Conditionally visible parameters noted
- [ ] All enum options listed
- [ ] Terminology matches code
- [ ] Feature is in UI registry (or `published: false`)
- [ ] Links use `.` for parent pages
- [ ] Parameter names match code labels exactly
- [ ] Bolding is minimal (only parameter names, menu items, list labels)
- [ ] No label prefixes like "Properties:" or "Note:"
- [ ] Cross-references use links, not bold text

## Common Pitfalls

- Don't memorize component lists, check GitHub for current state
- Don't document features not in RULE_LIST or registry
- Don't document default values or ranges
- Match parameter terminology exactly to code
- Check that simulations exist in RegisteredSimulations.kt
- Don't over-bold text (first-use terms, algorithm steps, descriptive prose)
- Don't use em dashes between phrases
- Don't create manual "Available X Types" sections (Jekyll generates TOC)

## Documentation Template

```markdown
### Feature Name
Brief description

- **Property**: Description
- **Another Property**: Description

Additional information flows naturally without label prefixes.
```

Information should flow naturally. State things directly rather than prefixing with "Properties:", "Usage notes:", "Example simulation:", "Note:", "Tip:", or "Warning:".

## Resources

- [Simbrain Repository](https://github.com/simbrain/simbrain)
- [Just the Docs Theme](https://just-the-docs.github.io/just-the-docs/)
- Local dev server: `./dev-server.sh` (from src/)
