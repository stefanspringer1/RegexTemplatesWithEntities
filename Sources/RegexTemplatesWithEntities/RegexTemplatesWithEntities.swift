import Foundation

/// This package makes it possible to efficiently replace a regular expression with a template containing `$1`, `S2`, etc.
///
/// Other than the `RegexTemplates`, character entities in the template of the (XML notation) form `&MY_CHARACTER_ENTITY;`, will be replaced by the accordign text. (The ampersand can be escaped using a backslash, this escapement will be removed by ths macro.) You will get a compiler error if you have chosen a non-existing entity name.`
///
/// Example:
///
/// ```swift
/// print(#replaceWithTemplateWithEntities(in: "123 hello!", replace: /([a-z]+)/, withTemplate: "$1&amp;$1"))
/// // prints "123 hello&hello!"
/// ```
///
/// Example with matching semantics `.unicodeScalar`:
///
/// ```swift
/// print(#replaceWithTemplateWithEntities(in: "a\u{0307}", replace: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}"))
/// // prints "à"
/// ```
@freestanding(expression)
public macro replaceWithTemplateWithEntities(in subject: String, replace regex: any RegexComponent, withTemplate template: String) -> String = #externalMacro(module: "RegexTemplatesWithEntitiesMacros", type: "ReplaceWithTemplateWithEntities")
