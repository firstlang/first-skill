---
name: first-code
description: Write or revise First source in the current structural subset, using the local tour and references to avoid invented syntax.
metadata:
  short-description: Write First structural code
---

# First Code

Use this skill when the user asks for First source, First declarations, First structural design, or edits to `.first` files.

Before writing First code, read [`tour.first`](tour.first). Treat it as the authoritative working subset for now. The tour is intentionally more important than general programming-language instincts: do not import TypeScript, Rust, JavaScript, or Swift syntax unless the tour, a referenced First note, or the official First documentation establishes it.

## Current Scope

The active subset is structural pre-programming:

- spaces and classes
- anchors
- functions and startup functions
- constructors and field parameters
- stored fields
- static-side same-name spaces
- `one of`, `many of`, and `one case of`
- ownership markers in stored field types
- primitive type names

Do not introduce imports, extension classes, primitive classes, properties, ghosts, loops, pattern matching, conditionals, operators-heavy implementation logic, or other computation/control-flow syntax unless the user explicitly expands the subset.

## References

Read only what the task needs:

- [`references/structural-subset.md`](references/structural-subset.md): exact declaration forms, anchors, and common hallucination traps.
- [`references/primitives.md`](references/primitives.md): primitive scalars, numeric families, fixed-decimal ranges, primitive groups, and ownership spelling.
- [`references/source-style.md`](references/source-style.md): formatting and authoring rules for readable First files.

If the needed rule is not covered here, consult the official First documentation from the project website or documentation repository. If the docs are unavailable or still ambiguous, ask the user or project maintainer instead of guessing.

## Working Rules

- Prefer anchors for intent and constraints when implementation syntax is not yet in scope.
- Keep each anchor to one concise statement, inside the declaration it governs.
- Use declaration names in braces inside anchors when referring to code, such as `{DocumentStatus}`.
- Do not invent concise aliases, punctuation, modifiers, or generic syntax.
- Keep answers concise unless the user asks for the deeper rationale.
- If you are unsure about syntax, you can visit the First language documentation website and download the documentation table of contents which is at https://www.firstlang.dev/docs-urls.txt which contains the URLs for all documentation pages that can be read individually.
