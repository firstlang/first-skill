---
name: anchor-classification
description: Classify Typical anchors as imperative or declarative and identify mixed, ambiguous, or unresolved wording.
---

# Anchor classification

Check only anchor role and placement, not architectural quality. Read the enclosing declaration and the anchor rules in `../../tour.typical` and `../../references/structural-rules.md`.

Every accepted anchor must have exactly one role:

- Imperative: directs work to perform. Conceptually executable code can expand beneath it at its exact position. It belongs in an executable body and uses command wording.
- Declarative: states a responsibility, invariant, interpretation, or constraint on the enclosing declaration rather than an instruction to execute at that position. Its meaning needs agent judgment where structure cannot adequately express it.

Precision is welcome in both categories. Leaving an implementation open does not require ambiguous requirements. Classify by semantic role, not the first verb alone. A declarative anchor may constrain behavior; an imperative anchor may enforce an invariant.

For each anchor, record its location and classification. Reject mixed or unclassifiable anchors for splitting or rewording. Preserve intended meaning; do not invent a resolution. The local language references permit pending-question syntax: report such a question as unresolved, not as a third accepted category or as unsupported syntax. Once answered it must become appropriate structural declarations or a classifiable anchor.

Clearly classified does not mean correct. Route missing scope or incompatible promises to behavior review, and wrong ownership to responsibility review.

## Review protocol

Follow [the shared review protocol](../../references/review-protocol.md) for context limits, findings, and handoff.
