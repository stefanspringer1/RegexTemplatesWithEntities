import SwiftSyntaxMacros
import SwiftSyntaxMacrosTestSupport
import XCTest
import RegexTemplatesWithEntitiesMacros
import RegexTemplatesWithEntities

final class RegexTemplatesWithEntitiesTests: XCTestCase {

    func testTemplateResolving() throws {
        XCTAssertEqual(
            ReplaceWithTemplateWithEntitiesTools.resolvedForm(forTemplate: "#1: $1 #1 (again): $1 #2: $2"),
            #"#1: \(match.output.1) #1 (again): \(match.output.1) #2: \(match.output.2)"#
            )
    }
    
    func testRegexTemplatesWithEntitiesWithTwoGroups() throws {
        
        // converting to a new text:
        XCTAssertEqual(
            #replacingWithTemplateWithEntities(in: "123 hello!", replacing: /([a-z]+)/, withTemplate: "$1 $1"),
            "123 hello hello!"
        )
        
        // changing a given text:
        var changingText = "123 hello!"
        #replaceWithTemplateWithEntities(in: changingText, replace: /([a-z]+)/, withTemplate: "$1 $1")
        XCTAssertEqual(changingText, "123 hello hello!")
        
    }
    
    func testRegexTemplatesWithEntitiesWithTwoGroupsAndEntity() throws {
        
        // converting to a new text:
        XCTAssertEqual(
            #replacingWithTemplateWithEntities(in: "123 hello!", replacing: /([a-z]+)/, withTemplate: "$1&amp;$1"),
            "123 hello&hello!"
        )
        
        // changing a given text:
        var changingText = "123 hello!"
        #replaceWithTemplateWithEntities(in: changingText, replace: /([a-z]+)/, withTemplate: "$1&amp;$1")
        XCTAssertEqual(changingText, "123 hello&hello!")
        
    }
    
    func testRegexTemplatesWithEntitiesWithThreeGroups() throws {
        
        // converting to a new text:
        XCTAssertEqual(
            #replacingWithTemplateWithEntities(in: "123 hello!", replacing: /([a-z])([a-z]+)/, withTemplate: "$1$2$2"),
            "123 helloello!"
        )
        
        // changing a given text:
        var changingText = "123 hello!"
        #replaceWithTemplateWithEntities(in: changingText, replace: /([a-z])([a-z]+)/, withTemplate: "$1$2$2")
        XCTAssertEqual(changingText, "123 helloello!")
        
    }
    
    func testRegexTemplatesWithEntitiesCodepoints() throws {
        
        // converting to a new text:
        XCTAssertEqual(
            #replacingWithTemplateWithEntities(in: "a\u{0307}", replacing: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}"),
            "à"
        )
        
        // changing a given text:
        var changingText = "a\u{0307}"
        #replaceWithTemplateWithEntities(in: changingText, replace: /([a-z])\x{0307}/.matchingSemantics(.unicodeScalar), withTemplate: "$1\u{0300}")
        XCTAssertEqual(changingText, "à")
    }
     
}
