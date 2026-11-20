# Printing a Sketch

Printing is producing target-language implementation code from a First or Typical sketch. The sketch is the load-bearing structure of the system and the authoritative contract for the printed code. It is not a suggestion or a loose description to reinterpret during implementation.

Printing implements the declared structure and fills in behavior under its anchors. A print must agree with both the sketch's declarations and its semantic requirements. Code that compiles but disagrees with the sketch is an incorrect print.

## Preserve the contract

Preserve all specified aspects of the sketch:

- Responsibility boundaries and the placement of behavior within them.
- Functions, constructors, parameters, parameter order, types, defaults, optionality, and results.
- Data shapes, selection cases and their payloads, stored state, visibility, and ownership.
- Synchronous and asynchronous behavior, lifecycle, initialization, and shutdown requirements.
- Error behavior, validation, invariants, side effects, and the execution order specified by imperative anchors.
- Dependencies, external interfaces, persistence requirements, and target configuration.

For example, a function with three parameters in the sketch must not acquire a fourth parameter in the printed code. Removing a parameter, changing its meaning, changing the return shape, or moving state into a different owner is equally a contract change. This rule applies beyond signatures: preserving the names while changing the behavior is also divergence.

## Target-language representation

Use target-language constructs that preserve the sketch's meaning. A selection may become a Rust enum, a space may become a module, and a byte collection may use the target's appropriate byte representation. Such mappings are representations of the same contract, not permission to redesign it.

Preserve declaration names where the target permits them. Apply required escaping or ordinary target naming conventions consistently, keeping the correspondence clear. Preserve parameter order and meaning even where the target does not support the same calling syntax. Default arguments, ownership, and asynchronous results must retain their semantics rather than being silently dropped.

Implementation details left open by the sketch may be chosen during printing. Local variables, private algorithmic helpers, and dependency plumbing are acceptable when they remain subordinate to the declared responsibility and do not change the modeled API, state, ownership, lifecycle, or observable behavior. They must not hide a second architecture absent from the sketch.

## When the sketch needs to change

If implementation requires a different contract, the sketch needs correction before the printed code does. Do not silently compensate in the target language.

Identify the mismatch, explain why the current sketch cannot express the required implementation, and update the sketch first within the user's authorized scope. Then bring the printed code into agreement. If the decision requires missing information, ask for that information rather than inventing a structural answer in the print.

An unsupported backend or a missing deterministic verifier does not make the contract optional. Distinguish a tooling limitation from a defect in the sketch; do not weaken the design merely to bypass a tool limitation.

## Printing workflow

1. Read the relevant sketch, its anchors, declared target, referenced contracts, and applicable project instructions.
2. Identify how its declarations map to the target language and resolve material contradictions before implementation.
3. Generate the implementation while preserving the contract. Replace imperative implementation placeholders with behavior that executes at the specified position; apply declarative anchors as constraints on their enclosing declarations.
4. Compare the print against the sketch declaration by declaration and responsibility by responsibility. Check signatures, types, data, state ownership, lifecycle, errors, and behavior in both directions so that nothing specified is missing and nothing contradictory has been introduced.
5. Compile and run appropriate behavioral checks where tooling is available. Report what passed and any remaining limitations accurately.

There is not yet a deterministic verifier proving that a print agrees with its sketch. The printing agent must perform that comparison explicitly. Compiler success and passing tests provide evidence about the implementation, but neither replaces checking agreement with the sketch.

A print is complete only when it implements the specified behavior and agrees with the sketch. Empty function bodies, declaration-only output, or prose repeated in comments are not a completed implementation. If work is partial or unverified, say so directly.
