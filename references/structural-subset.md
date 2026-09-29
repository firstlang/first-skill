# Structural Subset

Read this when declaring or revising First structure.

## Spaces And Classes

- `Name (` starts a declaration body.
- A declaration without `constructor` and without an inheritance clause is a space.
- A declaration with `constructor` or `is Parent` is a class.
- Spaces are responsibility boundaries, not files or ordinary namespaces.
- Spaces cannot be constructed or used as types.
- Classes introduce nominal types and are constructed by calling the class name.
- First has no `new` keyword.
- Repeated declarations with the same logical parent, name, and kind merge structurally.
- One space and one class with the same name may coexist under the same parent.
- Put a class's same-name static-side space after the instance-side class.

```first
User (
	constructor(name is field of string)
)

User (
	find(identifier is string) is User
)
```

## Anchors

- An anchor starts with `-` and is semantic content within the enclosing declaration.
- Use `//` only as short headings that group anchors.
- Put semantic content in anchors, not in comments.
- An imperative anchor starts with a command verb and belongs only inside an executable body.
- A declarative anchor states a fact, invariant, interpretation, or generation constraint.
- A pending-question anchor marks a material choice that cannot be inferred safely.
- Place behavior and invariants inside the member they govern.

## Functions

- Function names are lowercase.
- Parameters use `name is Type`.
- A bare parameter means `unknown`, not type inference.
- Return types follow the parameter list: `name() is Type`.
- Bodies use parentheses, not braces.
- A function can omit its body when declaring shape only.
- Async functions use `is async ResultType`; First does not spell async results as `Promise`.
- Generic functions use leading parameters such as `identity(T is type, value is T) is T`; do not use `identity<T>`.

```first
formatName(name is string) is string (
	return name
)

loadLabel() is async string
```

## Startup

- `startup (` declares automatic startup.
- Startup has no name, parameters, return type, or call syntax.
- Place startup beside its owning space.
- Program-owned startup functions run in program order.
- Only spaces may contain startup functions.

## Constructors And Fields

- A parameterless empty constructor may be written as `constructor`.
- A constructor with parameters or behavior uses `constructor(...) (...)`.
- A class may have at most one constructor.
- Constructors have no visibility modifiers.
- A constructor body may be omitted when declaring shape only.
- A constructor parameter can declare and assign a same-named field with `name is field of Type`.
- Stored fields declare instance state: `name is Type`.
- Field initializers should be literals or a single named value.
- Every stored field must be definitely assigned by construction.

```first
Document (
	status is DocumentStatus

	constructor(
		identifier is field of string
		accountName is field of string) (
		this.status = DocumentStatus.open()
	)
)
```

## Inheritance

- Inheritance uses `is`.
- Inheritance makes the declaration a class even without an explicit constructor.
- A class may inherit from multiple classes: `Child is Left, Right (`.
- Parent order matters.
- A non-constructible space cannot be used as an inheritance parent.
- First has no abstract classes, abstract constructors, or abstract members.

## Selection Types

Use selections for closed structural choices.

`one of` models one named identity, literal value, or value belonging to a listed type.

```first
WebViewPresentation is one of (
	hidden
	visible
)
```

`many of` models zero or more named flags. Include `none` when the empty state needs a name.

```first
WebViewCapability is many of (
	none
	load
	evaluateJavaScript
)
```

`one case of` models exactly one named case with optional payload.

```first
DocumentStatus is one case of (
	open()
	accountMismatch(expected is string, authenticated is string)
	closed()
)
```

Selection composition uses `or` in the header. Do not use body spreads.

```first
ExtendedStatus is BaseStatus or one case of (
	retryScheduled()
)
```

Selection bodies do not support fields, properties, ordinary constructors, nested spaces, or ghosts. In this subset, avoid author-defined functions inside selections.

## Do Not Guess These Forms

- Do not use braces for declaration or function bodies.
- Do not use `namespace`, `module`, `enum`, `struct`, `interface`, `impl`, `static`, or `new`.
- Do not use `T?` for optional parameters; use `= ?`.
- Do not use `String`, `Boolean`, `Number`, or `Promise`.
- Do not invent `readonly`, `public`, `protected`, `private constructor`, or TypeScript-style accessors in this subset.
- Do not introduce imports or package syntax in this subset.
