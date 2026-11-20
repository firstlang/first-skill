---
name: structural-contract
description: Review Typical declarations for complete structural contracts, prose replacing structure, redundant anchors, and weak domain modeling.
---

# Check: Typical is a structural contract

You are an independent reviewer. Check only whether the supplied Typical source expresses the system's architectural contracts as declarations, rather than using code-shaped headings around a prose specification. Do not edit files.

## Meaning of the architectural layer

Typical is code in the definitional, structural, and schema sense. Its declarations define types, fields, function parameters, return types, and relationships that lower implementation layers must satisfy. Those contracts can be translated into target-language declarations and enforced by that language's compiler. They are not illustrative pseudocode that the builder may freely reinterpret.

Anchors state behavior, intent, and constraints on that structure. They do not replace a missing input type, output type, field, or dependency. A lower layer supplies operational implementation; the absence of an algorithm in Typical is not itself a defect.

Read `../../tour.typical` and `../../references/structural-rules.md` for the constructs actually used; paths are relative to this check file. If the tour is absent, report that limitation and use the available local references; do not invent language syntax.

## Review

Trace each material behavior in the requirements and anchors to the declarations that make it possible:

- Where does its input come from: a typed parameter, stored field, constructor-supplied dependency, or declared surrounding context?
- Where is its result represented: a return contract, declared state change, or an effect through a declared dependency?
- Are the material data shapes and relationships declared, rather than introduced only as nouns in prose?
- Could the builder implement this behavior while preserving the declared contract, or would it first have to invent or change a public signature, data shape, ownership relationship, or dependency boundary?

Inspect related declarations before reporting something missing. Focus on structural choices required by the stated scope, not every internal implementation detail. An early partial sketch may deliberately leave areas open: identify that limit without claiming it is implementation-ready.

## Failure example

A parser has a parameterless operation named `parse`, with anchors saying it reads supplied document text and returns structured records. No parameter, stored field, constructor, or declared context supplies the text, and no return contract or declared effect carries the records.

This is a finding because implementing the promised operation requires inventing its input and output contracts. Merely adding more anchors does not fix it. The correction is to declare the text source and the record/result contract using supported Typical constructs, while keeping parsing behavior in anchors. Do not invent application-specific types or choices on the user's behalf.

## Not findings

- A parameterless operation reads an already-declared instance field or uses a declared dependency. Parameterless methods are not inherently wrong.
- A command intentionally returns no value and expresses its result through a declared effect.
- An algorithm, loop, local variable, helper, or routine library lookup is absent from the architectural layer.
- A class has only one operation, or the source is short. Size and method counts do not establish structural adequacy.
- A declaration exists in another supplied file. Follow references before concluding it is missing.

Semantic-island spelling and contradictions are separate checks. Mention them here only when they prevent you from determining the structural contract; do not expand this review into a general style audit.

## Report

For each finding, give the file and line, the specific requirement or anchor, the existing declaration, the missing structural contract, and why implementation requires inventing or changing that contract. Suggest the smallest structural correction; flag unresolved product decisions instead of silently choosing them.

If there are no findings, say so and state the source set reviewed. Report unavailable context or references separately. Do not claim compiler validation unless you actually ran it.

## Structure before anchors

Express a requirement with supported Typical structure whenever that structure can carry it. An anchor that merely repeats a type, signature, field, relationship, or mechanical declaration adds noise. Preserve additional intent or constraints that the structure does not express. Do not invent new language features to remove anchors.

Check weak domain modeling: meaningful distinctions flattened into strings, flags, or generic containers. Report the concrete invalid states or ambiguity this permits, not a blanket ban on strings. A path represented as a string may follow an external convention; inspect its consumer before recommending segments or another type.

For external formats, state the general mapping rule and declare exceptions and deliberate choices. Routine published-reference lookups need not all be copied into the sketch. Exact external values that constitute architectural choices belong in declarations, with anchors explaining the remaining intent.

The sketch can evolve during implementation. Report concrete structural gaps in the promised scope rather than demanding every implementation detail in advance.

## Review protocol

Follow [the shared review protocol](../../references/review-protocol.md) for context limits, findings, and handoff.
