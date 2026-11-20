---
name: boundaries-references
description: Review Typical semantic-island references, layers and imports, coupling, dependency cycles, and unnecessary abstractions.
---

# Boundaries, dependencies, and explicit references

Read anchors, referenced declarations, layer and import relationships, and relevant dependency contracts. Use `../../tour.typical` and `../../references/structural-rules.md` for reference and import forms. Prefer resolved semantic references and dependency information from the analyzer when available.

Typical boundaries arise from layers and imports. Do not invent public or private modifiers. Details hidden in a deeper layer do not become available merely because an anchor mentions them.

Check:

- Explicit reference integrity: an anchor referring to a particular declaration must point to it with a semantic island, such as `{CustomerDatabase}`, rather than mentioning its identifier casually in prose.
- Disguised references: wording such as “the customer database” may mean an actual declaration. Determine whether it does; ordinary domain language is not automatically a declaration reference. If multiple referents are plausible, ask which one is intended rather than choosing.
- Resolution and accessibility: an island must resolve to the intended declaration through the appropriate layer and imports. An explicit reference does not itself grant access. The compiler/analyzer checks actual resolution; the agent detects intended references omitted from islands.
- Coupling and encapsulation: fulfilling an anchor must not bypass the owning component's conceptual boundary or reach into lower-layer details unavailable through the declared relationship. Describe the actual boundary, not imaginary visibility modifiers.
- Cyclic dependency: show the dependency edges and explain why the cycle impedes independent understanding, change, or implementation. A cycle alone is an indicator, not an automatic defect.
- Unnecessary abstraction: identify layers that only forward work without a useful boundary, policy, adaptation, or responsibility. Do not condemn a small wrapper solely for being small.

Example: “Save the customer through the customer database” needs `{CustomerDatabase}` if that is the particular declared component intended. The island exposes the exact dependency for semantic analysis. Whether that component should own the work is responsibility review's question.

Report missing imports or inaccessible references only with evidence. Where semantic information is unavailable, identify what needs resolution instead of claiming a compiler result. Architectural smells require a concrete consequence and a question; a demonstrated invalid reference or forbidden dependency can be reported directly.

## Review protocol

Follow [the shared review protocol](../../references/review-protocol.md) for context limits, findings, and handoff.
