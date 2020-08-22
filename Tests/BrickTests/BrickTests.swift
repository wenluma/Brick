import XCTest
@testable import Brick

final class BrickTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Brick().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
