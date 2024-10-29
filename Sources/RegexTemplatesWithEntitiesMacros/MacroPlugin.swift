import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct MacroPlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        ReplacingWithTemplateWithEntities.self,
        ReplaceWithTemplateWithEntities.self,
    ]
}
