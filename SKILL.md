---
name: typical-code
description: Write or revise Typical source, reverse-engineer existing systems into Typical, scaffold Typical-backed projects, and keep implementation work aligned with src-typical.
metadata:
  short-description: Write Typical structural code
---

# Typical Code

Use this skill when the user asks for Typical source, Typical declarations, Typical structural design, Typical-backed project scaffolding, edits to `.typical` files, or implementation work in a project that has `src-typical/`.

Before writing Typical code, run [`scripts/update-docs.sh`](scripts/update-docs.sh) when network access is available, then read [`Tour.typical`](Tour.typical). Treat the tour as the authoritative working subset for now. The tour is intentionally more important than general programming-language instincts: do not import TypeScript, Rust, JavaScript, or Swift syntax unless the tour, a referenced Typical note, or the official Typical documentation establishes it.

## Programmatic Typical Generation

When generating Typical source programmatically, always use [Typical CodeDOM](https://github.com/typical-sh/code-dom). Clone that repository into the project's permitted workspace before using it. CodeDOM is a separate repository and is not bundled with this skill. Read the cloned repository's `README.md` and `SKILL.md` for API usage and generation instructions.

Build CodeDOM nodes, call its emitter, and write the returned source unchanged. A TypeScript generator may read inputs and call CodeDOM. Never assemble Typical syntax directly using Python, shell scripts, TypeScript string templates, concatenation, or another custom source printer. Do not bypass this requirement with whole declarations or files hidden in raw-source nodes, or by patching text after emission.

If CodeDOM lacks a required construct, extend it when within scope or report the missing capability; do not silently fall back to handwritten generation. This requirement concerns generated Typical source, not unrelated output languages or ordinary manual edits to Typical files.

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

For extensions, custom primitives, properties, ghosts, or computation/control flow beyond the tour, consult the relevant official documentation before using them. The tour is a starting reference, not a reason to omit supported language features needed by the task.

## Typical-Backed Projects

In a project with `src-typical/`, treat Typical as the structural source of truth.

Before changing implementation artifacts, inspect the relevant Typical source when the request affects structure, behavior, data shape, lifecycle, public API, ownership, or invariants.

If the request changes that structure or intent, update Typical before changing implementation artifacts. If the request is purely local implementation work, proceed without a Typical edit.

## Printing Sketches

When asked to print a sketch or implement its target-language output, read [PRINTING.md](PRINTING.md). The sketch is the authoritative contract: preserve its signatures, data, state, ownership, lifecycle, responsibilities, and anchored behavior. Correct required contract changes in the sketch before changing the printed code.

## Printing Sketches

When asked to print a sketch or implement its target-language output, read [PRINTING.md](PRINTING.md). The sketch is the authoritative contract: preserve its signatures, data, state, ownership, lifecycle, responsibilities, and anchored behavior. Correct required contract changes in the sketch before changing the printed code.

## Scaffold Interaction

When scaffolding a Typical project, infer as much as possible from the user’s request. Ask only for missing choices that materially affect the folder structure.

Required decisions:
- project name

Always create exactly one `src-typical/`. This is where the Typical lives.

Create additional implementation targets as `src-<target>/` folders only when the user specifies them.
Represent requested outputs in Typical with `declare target`; folders alone do not select targets. Use explicit `path` configuration when the project requires a particular destination. Backend names are open lowercase identifiers; for agent generation, generate the requested language rather than treating absence of a prebuilt backend as a modeling blocker.

## Dependencies And Generation Readiness

Include the dependencies, deployment responsibilities, and external behavior needed for the requested implementation. Imports are allowed. Use canonical identifiers where possible; use `import "@supabase/supabase-js" as Supabase` for package names containing characters such as `@` or `/`. Quoted imports require an alias.

When asked for implementation-ready Typical, check that its structure and anchors specify material behavior, dependencies, output targets, persistence operations, and credential ownership without leaving product decisions to guesswork. This is a planning check, not a demand for every implementation detail or a new language feature. Report concrete unresolved decisions; do not invent hypothetical language holes. A design review may support this check when requested.

## Reverse-Engineering Existing Systems

Read the relevant implementation, schemas, migrations, grants, API contracts, and deployment configuration before modeling an existing system. Record actual responsibilities, data shapes, dependencies, persistence behavior, and credential boundaries in Typical. Preserve exact external names when existing tables, buckets, packages, or APIs depend on them; use declarations for exact strings and semantic islands for anchor references.

Distinguish observed behavior from intended changes. Record deliberate divergences in a separate corrections document with source evidence, so generating the intended system does not erase knowledge of what is currently deployed. Do not invent interface/implementation pairs or prescribe a `Persistable` base class as a language requirement. Keep operations requiring server credentials in the unit that owns those credentials. Represent real privilege distinctions in typed APIs when useful, while preserving the system's actual authorization checks.

Create an `AGENTS.md` that tells future agents to use this skill and to treat `src-typical/` as the source of truth before implementation changes.

## Required review checks

After drafting or revising Typical source, discover every `SKILL.md` recursively in `checks/` and run all of them before presenting the source as reviewed. Do not rely on a fixed list: newly added checks apply automatically.

Launch a separate reviewer agent for each check, with its own context window. Give it the check skill, the relevant Typical source set (including related declarations), the user's requirements, and the local language references the check requests. Do not inherit the author's full conversation or supply the author's conclusions. Each reviewer reads only the references needed for its check, reports findings, and makes no edits. Run independent reviewers in parallel within the runtime's concurrency limit; queue the rest.

The coordinator verifies findings against the source and requirements, corrects confirmed issues, and reruns affected checks in separate reviewer agents. Report unresolved findings and checks that could not complete. If delegation is unavailable, say so; sequential self-review is a fallback, not completion of the independent-agent review requirement. An empty checks folder is not a successful review.

The checks are individual nested skills, discovered explicitly through this entry point. Run anchor classification first, then route imperative anchors to behavior review and declarative claims to responsibility review. Structural review can run alongside classification. Boundary review includes both anchor kinds. Give each reviewer its focused context package as described in [the review protocol](references/review-protocol.md); do not send every reviewer the whole repository.

## Structure and anchor roles

Typical is a structural contract, not prose decorated with code-shaped headings. Declare types, inputs, outputs, fields, and relationships using supported structure. Use anchors for remaining behavior, responsibilities, and constraints; do not repeat structural guarantees. Imperative anchors describe work that can expand into executable code at their position using available scope. Declarative anchors state responsibilities or constraints requiring agent judgment. Every accepted anchor must classify as exactly one kind; unresolved questions remain decisions to resolve. The sketch may be revised when implementation reveals a missing contract.

## References

Read only what the task needs:

- [`references/structural-rules.md`](references/structural-rules.md): exact declaration forms, anchors, and common hallucination traps.
- [`references/primitives.md`](references/primitives.md): primitive scalars, numeric families, fixed-decimal ranges, primitive groups, and ownership spelling.
- [`references/source-style.md`](references/source-style.md): formatting and authoring rules for readable Typical files.

If the needed rule is not covered here, consult the official Typical documentation from the project website or documentation repository. If the docs are unavailable or still ambiguous, ask the user or project maintainer instead of guessing.

Updated official docs are cached in [`downloaded-docs/`](downloaded-docs/) when the update script has run. Read only the downloaded docs relevant to the construct you need.

## Working Rules

- Specify function and callable return types with `returns Type`, including `returns async Type` and `returns yield Type`. Keep `is` for parameter and field types, inheritance, and other declarations; do not use it for return types.
- Specify function and callable return types with `returns Type`, including `returns async Type` and `returns yield Type`. Keep `is` for parameter and field types, inheritance, and other declarations; do not use it for return types.
- Prefer anchors for intent and constraints when implementation syntax is not yet in scope.
- Keep each anchor to one concise statement, inside the declaration it governs.
- Use declaration names in braces inside anchors when referring to code, such as `{DocumentStatus}`.
- Do not invent concise aliases, punctuation, modifiers, or generic syntax.
- Keep answers concise unless the user asks for the deeper rationale.
- If you are unsure about syntax, use the cached official docs or download the documentation index at https://typical.sh/docs/index.txt.
- If the updater fails because network access is unavailable, continue from the local bundled docs and mention that the downloaded docs may be stale.
