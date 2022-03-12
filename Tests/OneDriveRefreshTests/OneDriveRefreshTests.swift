import XCTest
@testable import OneDriveRefresh

final class OneDriveRefreshTests: XCTestCase {
    func testExample() async throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let token = """
0.AVQAWtN4QKqS5EG0hm4BFqh9etXrhXVd9CZMjzDC4U61i41UAH8.AgABAAAAAAD--DLA3VO7QrddgJg7WevrAgDs_wQA9P8ppuga3jClLeJA9oI96c5lTfJFnoK1eZRvChTZR8GPGAXA-ALF6Kn6-GEO5rSJDijCzNWm_hzdYu7yK8EZwVnKRiJ7CPk5m1uP4qs8FjGNxSZl105zDzfxEj3ZpQyHy4vzw-G30vBjGwa3mHV4w7sJxJS2Jn_xuzQKsr0TOsM9SA7NkOY4uIGVpSCHcGmwiQFzEBROT3gOABF31CoUvaKC0wmz274IdCE4sGiDjU6dmfdwjOiKy_F2qqbA-q7H_TSpNtYzxQAckfxCltkqIo9Uayy7KosYEmpRLSuq9FY5VDInW52XvDtRX1KN98RNAPDCLv4wVcwdPUuAY0_MlSJklExLfQXk6xXx80hmz6rJogKs7ZAhZl4Q011iTLkDRXKLjXQxEwgxFsEnQfP0fVRLmRVozLB8f4YsN3I22PVtvXE6SIdHP79XGivZ1UOw1VzqD-jClA-G0dgKsannSeXb08HIiyEb6g3IJtVpZhSg9-je_R3YU41PB3ivh5MJRHi_5sCj3vKPJrT3oXJhpjiFvgBXzDLCAPkBIweXBiSD0znNK4JvLYlm54zvshjTNKjmzyu4USbVh8M_e3BJDg_fUphFGg7NOxoA2HgCEsXapVUzpsyCyXAuGQsPIrZUu4xiW3SMNbpsfUxHXUWhOuB6zwl2EDLE3uSk7Solm5dgLtQ9z7H2x71y_55MNdHEBwK6KLV1-_4SXUOmxvfw1F-f2JDCOmkvXBEHbrv3xKDm7_d4gvsK0QlYpIFLOxA-oZWAtl6BIT1nHZvkR4r-K9r6NJX9LQj12i6OeyVv9hHwn1vJixvYaFN17Py1LTZfTBYTUAs_2GcVT138fgfC85YIr8NVSXF2q_OK9UFcGbLmFYxSEqPgCIaCR-XtRr362feICXA6o9bEl2yKAwAL1Q2qi0wrHSVLQWl9dlB3x1LYV3XwBmx6LMMHVL4EPy4A3usQKA
"""
        
        print(try await OneDriveRefresh(token, clientId: "7585ebd5-f45d-4c26-8f30-c2e14eb58b8d").refresh())
    }
}
