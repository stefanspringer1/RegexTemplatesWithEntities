import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import RegexTemplatesWithEntitiesMacros
import RegexTemplatesWithEntities

final class RegexTemplatesWithEntitiesTests: XCTestCase {

    func testTemplateResolving() throws {
        XCTAssertEqual(
            ReplaceWithTemplateWithEntities.resolvedForm(forTemplate: "#1: $1 #1 (again): $1 #2: $2"),
            #"#1: \(match.output.1) #1 (again): \(match.output.1) #2: \(match.output.2)"#
            )
    }
    
    func testRegexTemplatesWithEntitiesWithTwoGroups() throws {
        XCTAssertEqual(
            #replaceWithTemplateWithEntities(in: "123 hello!", replace: /([a-z]+)/, withTemplate: "$1 $1"),
            "123 hello hello!"
        )
    }
    
    func testRegexTemplatesWithEntitiesWithTwoGroupsAndEntity() throws {
        XCTAssertEqual(
            #replaceWithTemplateWithEntities(in: "123 hello!", replace: /([a-z]+)/, withTemplate: "$1&amp;$1"),
            "123 hello&hello!"
        )
    }
    
    func testRegexTemplatesWithEntitiesWithThreeGroups() throws {
        XCTAssertEqual(
            #replaceWithTemplateWithEntities(in: "123 hello!", replace: /([a-z])([a-z]+)/, withTemplate: "$1$2$2"),
            "123 helloello!"
        )
    }
    
    func testRegexTemplatesWithEntitiesCodepoints() throws {
        XCTAssertEqual(
            #replaceWithTemplateWithEntities(in: "a\u{0307}", replace: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}"),
            "à"
        )
    }
     
}
