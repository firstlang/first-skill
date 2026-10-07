---
name: first-code
description: Write or revise First source, reverse-engineer existing systems into First, scaffold First-backed projects, and keep implementation work aligned with src-first.
metadata:
  short-description: Write First structural code
---

# First Code

Use this skill when the user asks for First source, First declarations, First structural design, First-backed project scaffolding, edits to `.first` files, or implementation work in a project that has `src-first/`.

Before writing First code, run [`scripts/update-docs.sh`](scripts/update-docs.sh) when network access is available, then read [`Tour.first`](Tour.first). Treat the tour as the authoritative working subset for now. The tour is intentionally more important than general programming-language instincts: do not import TypeScript, Rust, JavaScript, or Swift syntax unless the tour, a referenced First note, or the official First documentation establishes it.

## Current Scope

The working subset emphasizes structure and intent, with dependencies and output targets included:

- spaces and classes
- anchors
- functions and startup functions
- constructors and field parameters
- stored fields
- static-side same-name spaces
- `one of`, `many of`, and `one case of`
- ownership markers in stored field types
- primitive type names
- imports, including quoted package names with required aliases
- `declare target` and backend configuration

For extension classes, primitive classes, properties, ghosts, or computation/control flow beyond the tour, consult the relevant official documentation before using them. The tour is a starting reference, not a reason to omit supported language features needed by the task.

## First-Backed Projects

In a project with `src-first/`, treat First as the structural source of truth.

Before changing implementation artifacts, inspect the relevant First source when the request affects structure, behavior, data shape, lifecycle, public API, ownership, or invariants.

If the request changes that structure or intent, update First before changing implementation artifacts. If the request is purely local implementation work, proceed without a First edit.

## Scaffold Interaction

When scaffolding a First project, infer as much as possible from the user’s request. Ask only for missing choices that materially affect the folder structure.

Required decisions:
- project name

Always create exactly one `src-first/`. This is where the First lives.

Create additional implementation targets as `src-<target>/` folders only when the user specifies them.
Represent requested outputs in First with `declare target`; folders alone do not select targets. Use explicit `path` configuration when the project requires a particular destination. Backend names are open lowercase identifiers; for agent generation, generate the requested language rather than treating absence of a prebuilt backend as a modeling blocker.

## Dependencies And Generation Readiness

Include the dependencies, deployment responsibilities, and external behavior needed for the requested implementation. Imports are allowed. Use canonical identifiers where possible; use `import "@supabase/supabase-js" as Supabase` for package names containing characters such as `@` or `/`. Quoted imports require an alias.

When asked for implementation-ready First, check that its structure and anchors specify material behavior, dependencies, output targets, persistence operations, and credential ownership without leaving product decisions to guesswork. This is a planning check, not a demand for every implementation detail or a new language feature. Report concrete unresolved decisions; do not invent hypothetical language holes. A design review may support this check when requested.

## Reverse-Engineering Existing Systems

Read the relevant implementation, schemas, migrations, grants, API contracts, and deployment configuration before modeling an existing system. Record actual responsibilities, data shapes, dependencies, persistence behavior, and credential boundaries in First. Preserve exact external names when existing tables, buckets, packages, or APIs depend on them; use declarations for exact strings and semantic islands for anchor references.

Distinguish observed behavior from intended changes. Record deliberate divergences in a separate corrections document with source evidence, so generating the intended system does not erase knowledge of what is currently deployed. Do not invent interface/implementation pairs or prescribe a `Persistable` base class as a language requirement. Keep operations requiring server credentials in the unit that owns those credentials. Represent real privilege distinctions in typed APIs when useful, while preserving the system's actual authorization checks.

Create an `AGENTS.md` that tells future agents to use this skill and to treat `src-first/` as the source of truth before implementation changes.

## References

Read only what the task needs:

- [`references/structural-rules.md`](references/structural-rules.md): exact declaration forms, anchors, and common hallucination traps.
- [`references/primitives.md`](references/primitives.md): primitive scalars, numeric families, fixed-decimal ranges, primitive groups, and ownership spelling.
- [`references/source-style.md`](references/source-style.md): formatting and authoring rules for readable First files.

If the needed rule is not covered here, consult the official First documentation from the project website or documentation repository. If the docs are unavailable or still ambiguous, ask the user or project maintainer instead of guessing.

Updated official docs are cached in [`downloaded-docs/`](downloaded-docs/) when the update script has run. Read only the downloaded docs relevant to the construct you need.

## Working Rules

- Prefer anchors for intent and constraints when implementation syntax is not yet in scope.
- Keep each anchor to one concise statement, inside the declaration it governs.
- Use declaration names in braces inside anchors when referring to code, such as `{DocumentStatus}`.
- Do not invent concise aliases, punctuation, modifiers, or generic syntax.
- Keep answers concise unless the user asks for the deeper rationale.
- If you are unsure about syntax, use the cached official docs or download the documentation index at https://firstlang.dev/docs/index.txt.
- If the updater fails because network access is unavailable, continue from the local bundled docs and mention that the downloaded docs may be stale.
