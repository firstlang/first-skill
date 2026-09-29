# Source Style

Read this before producing nontrivial `.first` files.

## Formatting

- Use tabs for indentation.
- Blank lines retain the indentation of their surrounding scope.
- Do not trim whitespace-only blank lines.
- Commas and newlines are interchangeable separators.
- Prefer newline separation without commas for multiline parameter, argument, payload, and entry lists.
- Keep each anchor on one line.
- Use comment headings only to break up long anchor runs.

## Naming

- Spaces and classes use uppercase names.
- Functions and fields use lowercase names.
- Selection entries and cases use lowercase names.
- Organize by responsibility, not by source file.
- Nest spaces instead of encoding hierarchy into long names.

## Authoring First In This Subset

- Start with structure and anchors before implementation.
- Put a member's behavior and invariants inside that member.
- Use class same-name spaces for static-side operations.
- Omit bodies when declaring API shape only.
- Add a parenthesized body when a function, constructor, or startup needs anchors or implementation.
- Use exact primitive names from `references/primitives.md`.
- Consult the official First documentation instead of guessing when syntax or semantics are not established by the tour or references. If the docs are unavailable or ambiguous, ask the user or project maintainer.
