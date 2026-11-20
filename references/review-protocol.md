# Review protocol

Each check skill is one independent reviewer responsibility. Reviewers report findings and make no edits. Read the assigned source and only the language references needed; do not inherit the author's conversation or conclusions. Run independent checks within available concurrency, queuing the rest.

## Context packages

- Structural contract: requirements, declarations and associated anchors, and supported structural constructs.
- Anchor classification: anchors and enclosing declarations, with anchor syntax and role rules.
- Behavior contracts: imperative anchors, related declarative constraints, signatures, relevant types and lifecycle rules, and semantically resolved scope.
- Responsibility authority: responsibility and invariant claims, associated behavior, related owners and architecture relationships; relevant implementation only when checking implementation compliance.
- Boundaries references: both anchor kinds, intended referents, public-facing component contracts, layer and import relationships, and resolved dependency information. “Public-facing” describes an architectural boundary, not a Typical access modifier.

Review one coherent architectural slice at a time, expanding only for interacting contracts. A repository-wide cycle or overlapping authority may require a broader relationship map; retrieve the relevant declarations rather than stuffing all source into every context. Record coverage and deferred areas so slicing does not hide cross-component issues.

## Findings

For each finding give:

1. Source file and line, anchor text or declaration, and related evidence locations.
2. The specific conflict, omission, redundancy, or architectural concern.
3. A concrete consequence or scenario, not just a smell label.
4. The smallest correction or question requiring an ownership/product decision.
5. Whether it is demonstrated, a design concern requiring judgment, or unresolved because context or semantic information is missing.

Report no findings explicitly with the reviewed source set. List unavailable references, missing analyzer information, and incomplete coverage separately. Never claim compiler validation without running it. Smells are evidence-backed questions, not automatic convictions; checks are broad coverage, not proof of architectural completeness.

The coordinator verifies evidence, merges duplicate reports of the same underlying issue, preserves distinct consequences, and corrects confirmed issues. Reviewers do not independently rewrite shared files. Ask the user only for decisions that cannot be resolved from requirements or source. Re-run affected checks after changes, including downstream checks when classification or contracts change. Clearly report unresolved findings and incomplete independent reviews.
