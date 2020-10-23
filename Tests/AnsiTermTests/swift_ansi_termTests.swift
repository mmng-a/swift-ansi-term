import XCTest
@testable import swift_ansi_term

final class swift_ansi_termTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(swift_ansi_term().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
