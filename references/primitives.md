# Primitives

Read this when choosing primitive types, writing field types, or defining selection payloads.

## Scalar Primitives

- `boolean`
- `string`
- `byte string`
- `char`

First does not have capitalized primitive object types such as `String`, `Boolean`, or `Number`.

## Integers

Signed fixed-width integers:

```text
i8, i16, i32, i64, i128
```

Unsigned fixed-width integers:

```text
u8, u16, u32, u64, u128
```

Fixed-width integer arithmetic wraps on overflow.

## Platform Aliases

- `int`: `i32` on 32-bit targets, `i64` on 64-bit targets.
- `uint`: `u32` on 32-bit targets, `u64` on 64-bit targets.
- `decimal`: `i32.4` on 32-bit targets, `i64.4` on 64-bit targets.
- `udecimal`: `u32.4` on 32-bit targets, `u64.4` on 64-bit targets.
- `number`: always `f64`.

For durable data and foreign boundaries, prefer a concrete width over a platform alias.

## Provisional Numeric Annotation

- `numeric` is a compile-time provisional numeric annotation.
- `numeric` is not the same as `number`.
- Do not use `numeric` as a primitive-class base.

## Floating-Point Types

```text
f16, f32, f64, f128
```

Decimal-point literals are provisional fixed decimals unless suffixed:

- `1.25f` is `f32`.
- `1.25ff` is `f64`.

## Fixed Decimals

Fixed decimals are written as `<backing-integer>.<scale>`.

The ranges below are the exhaustive fixed-decimal primitive catalog. Do not invent scales outside these ranges.

Signed fixed-width fixed decimals:

```text
i8.1, i8.2, i8.3
i16.1, i16.2, i16.3, i16.4, i16.5
i32.1, i32.2, i32.3, i32.4, i32.5, i32.6, i32.7, i32.8, i32.9, i32.10
i64.1, i64.2, i64.3, i64.4, i64.5, i64.6, i64.7, i64.8, i64.9, i64.10, i64.11, i64.12, i64.13, i64.14, i64.15, i64.16, i64.17, i64.18, i64.19
i128.1 through i128.39
```

Unsigned fixed-width fixed decimals:

```text
u8.1, u8.2, u8.3
u16.1, u16.2, u16.3, u16.4, u16.5
u32.1, u32.2, u32.3, u32.4, u32.5, u32.6, u32.7, u32.8, u32.9, u32.10
u64.1, u64.2, u64.3, u64.4, u64.5, u64.6, u64.7, u64.8, u64.9, u64.10, u64.11, u64.12, u64.13, u64.14, u64.15, u64.16, u64.17, u64.18, u64.19
u128.1 through u128.39
```

The shorthand ranges above are exact: every integer scale in the stated range is available.

## Big Numbers

- `big` is an arbitrary-precision signed integer.
- `big.1` through `big.64` are arbitrary-precision fixed decimals; every integer scale in that range is available, and no larger scale is in this catalog.
- There are no unsigned `big` variants.

## Primitive Groups

Primitive groups describe families of built-in primitives. They are mainly used as primitive-class bases or extension targets, but primitive classes/extensions are outside the current subset.

- `AnyNumeric`: every integer, fixed decimal, float, arbitrary-precision number, and `char`.
- `AnyInteger`: every fixed-width integer, `big`, and `char`.
- `AnySignedInteger`: signed fixed-width integers and `big`.
- `AnyUnsignedInteger`: unsigned fixed-width integers.
- `AnyDecimal`: every fixed decimal, float, and `big.N` type.
- `AnyFixedDecimal`: every fixed-width fixed decimal.
- `AnySignedFixedDecimal`: signed fixed-width fixed decimals.
- `AnyUnsignedFixedDecimal`: unsigned fixed-width fixed decimals.
- `AnyFloat`: `f16`, `f32`, `f64`, and `f128`.

`primitive` is the top type of every built-in and user-defined primitive.

## Ownership Markers

Use ownership markers in stored field types when the relationship matters.

- `weak Target`: does not retain its target and can become `null`.
- `Target or null`: an optional ordinary reference that retains its target while present. Optionality alone does not imply weak ownership. Use `weak Target` only when the field should not keep the object alive; weak references are already nullable.
- `strong Target`: explicitly acknowledges a potentially retaining cycle.

```first
WebViewRelation (
	constructor(
		owner is field of weak Document
		peer is field of strong WebViewHandle)
)
```
