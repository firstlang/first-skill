---
name: responsibility-authority
description: Review Typical anchors and declarations for misplaced responsibility, competing authority, duplicated knowledge, cohesion, and scattered responsibilities.
---

# Responsibility and authority

Read declarative responsibility and invariant anchors, the imperative behavior that exercises them, and relevant declarations and relationships. Use `../../tour.typical` for unfamiliar forms. Expand to related owners when claims overlap; do not load unrelated implementation.

An existing anchor already has an enclosing declaration. Ask whether that declaration is the right owner, not whether the anchor has an owner at all.

Check these indicators:

- Misplaced responsibility: behavior belongs beside different data, policy, or authority. Explain why the current placement causes a concrete problem.
- Competing authority: multiple declarations independently control the same state, decision, or lifecycle without an explicit coordination rule.
- Duplicated knowledge: the same business rule is independently defined in places that can drift. Repeated validation at distinct trust boundaries is not automatically duplicated authority.
- Low cohesion: one declaration combines responsibilities that change for unrelated reasons.
- Scattered responsibility: one coherent responsibility is fragmented so an ordinary change requires coordinated edits across declarations.

Inspect actual claims, not names or class size. Declarative anchors are useful agent-reviewed constraints, not inferior substitutes that must all become executable checks. When implementation is supplied, check that it respects these claims; without implementation, report only sketch-level evidence.

These are design indicators, not automatic convictions. For each concern, cite overlapping or misplaced claims, explain the consequence, and state the ownership question to resolve. Distinguish deliberate duplication and coordination from accidental competing authority. Do not impose one-component-per-responsibility as a universal rule.

## Review protocol

Follow [the shared review protocol](../../references/review-protocol.md) for context limits, findings, and handoff.
