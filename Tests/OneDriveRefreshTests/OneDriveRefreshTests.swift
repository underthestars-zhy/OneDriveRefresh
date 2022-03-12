import XCTest
@testable import OneDriveRefresh

final class OneDriveRefreshTests: XCTestCase {
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let token = ""
        
        print(try await OneDriveRefresh(token, clientId: "").refresh() ?? "Wrong")
    }
}
