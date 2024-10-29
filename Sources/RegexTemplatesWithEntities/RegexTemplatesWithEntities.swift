import Foundation

/// This macro makes it possible to efficiently replace a regular expression with a template containing `$1`, `S2`, etc.
///
/// Other than with the `RegexTemplates` package, character entities in the template of the (XML notation) form `&MY_CHARACTER_ENTITY;`, will be replaced by the accordign text. (The ampersand can be escaped using a backslash, this escapement will be removed by ths macro.) You will get a compiler error if you have chosen a non-existing entity name.`
///
/// Example:
///
/// ```swift
/// print(#replacingWithTemplateWithEntities(in: "123 hello!", replacing: /([a-z]+)/, withTemplate: "$1&amp;$1"))
/// // prints "123 hello&hello!"
/// ```
///
/// Example with matching semantics `.unicodeScalar`:
///
/// ```swift
/// print(#replacingWithTemplateWithEntities(in: "a\u{0307}", replacing: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}"))
/// // prints "à"
/// ```
@freestanding(expression)
public macro replacingWithTemplateWithEntities(in subject: String, replacing regex: any RegexComponent, withTemplate template: String) -> String = #externalMacro(module: "RegexTemplatesWithEntitiesMacros", type: "ReplacingWithTemplateWithEntities")

/// This macro makes it possible to efficiently replace a regular expression with a template containing `$1`, `S2`, etc.
///
/// Other than with the `RegexTemplates` package, character entities in the template of the (XML notation) form `&MY_CHARACTER_ENTITY;`, will be replaced by the accordign text. (The ampersand can be escaped using a backslash, this escapement will be removed by ths macro.) You will get a compiler error if you have chosen a non-existing entity name.`
///
/// Example:
///
/// ```swift
/// var text = "123 hello!"
/// #replaceWithTemplateWithEntities(in: "123 hello!", replace: /([a-z]+)/, withTemplate: "$1&amp;$1"))
/// print(text)
/// // prints "123 hello&hello!"
/// ```
///
/// Example with matching semantics `.unicodeScalar`:
///
/// ```swift
/// var text = "a\u{0307}"
/// #replaceWithTemplateWithEntities(in: text, replace: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}"))
/// print(text)
/// // prints "à"
/// ```
@freestanding(expression)
public macro replaceWithTemplateWithEntities(in subject: String, replace regex: any RegexComponent, withTemplate template: String) = #externalMacro(module: "RegexTemplatesWithEntitiesMacros", type: "ReplaceWithTemplateWithEntities")
