---
name: behavior-contracts
description: Review imperative Typical anchors against resolved scope, declared effects and results, and interacting behavioral contracts.
---

# Behavior and contract consistency

Read imperative anchors, their signatures, relevant types, related declarative constraints, and lifecycle and target contracts. Use `../../tour.typical` and `../../references/structural-rules.md` only for constructs involved.

Request semantically resolved scope when available: parameters, local bindings, instance and inherited fields, accessible operations, imports and dependencies, and their types and origins. Anchors can use surrounding data without restating it. Parameterless methods are not inherently deficient. Do not infer that a name is absent merely because it is not a parameter.

Check:

- Can the specified work use data and operations available at this position?
- Do declared results or effects accommodate the behavior, including specified failures?
- Do preconditions, outcomes, ordering, lifecycle transitions, targets, or anchors make incompatible promises for the same case?
- Does an imperative instruction conflict with a declarative responsibility or invariant?

Trace evidence across relevant files and scopes. Show the specific scenario and both promises for a contradiction. Distinguish a deliberate exception from an incompatible rule; do not silently choose precedence.

Without analyzer output, inspect declarations where feasible and mark uncertain resolution as needing semantic analysis. Do not claim compiler-backed scope knowledge from prose inspection. Missing information is a limitation, not proof of invalid code.

Report missing inputs or effects as contracts to revisit with the coordinator. Implementation may legitimately reveal a need to revise the sketch. Do not require algorithms or all helper operations to appear in the architectural layer. Route prose replacing declarations to structural review rather than duplicating it as another independent defect.

## Review protocol

Follow [the shared review protocol](../../references/review-protocol.md) for context limits, findings, and handoff.
