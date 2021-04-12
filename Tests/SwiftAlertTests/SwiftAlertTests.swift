import XCTest
@testable import SwiftAlert

final class SwiftAlertTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftAlert().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
