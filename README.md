# RegexTemplatesWithEntities

This package makes it possible to efficiently replace a regular expression with a template containing `$1`, `S2`, etc.

Other than with the `RegexTemplates` package, character entities in the template of the (XML notation) form `&MY_CHARACTER_ENTITY;`, will be replaced by the according text. (The ampersand can be escaped using a backslash, this escapement will be removed by the macro.) You will get a compiler error if you have chosen a non-existing entity name.`

Example:

```swift
// converting to a new text:
print(#replacingWithTemplateWithEntities(in: "123 hello!", replace: /([a-z]+)/, withTemplate: "$1&amp;$1"))
// prints "123 hello&hello!"

// changing a given text:
var changingText = "123 hello!"
#replaceWithTemplateWithEntities(in: changingText, replace: /([a-z]+)/, withTemplate: "$1&amp;$1")
print(changingText)
// prints "123 hello&hello!"
```

Example with matching semantics `.unicodeScalar`:

```swift
// converting to a new text:
print(#replacingWithTemplateWithEntities(in: "a\u{0307}", replace: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}"))
// prints "à"

// changing a given text:
var changingText = "a\u{0307}"
#replaceWithTemplateWithEntities(in: changingText, replace: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}")
print(changingText)
// prints "à"
```
