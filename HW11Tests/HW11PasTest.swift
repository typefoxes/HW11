

import XCTest

final class HW11PasTest: XCTestCase {

    var sut: PasswordValidator!

    override func setUp() {
        super.setUp()
        
        sut = PasswordValidator()
    }
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testValidator() {
        
        XCTAssertFalse(sut.check(inputIsValid: "1234567") == .valid)
        XCTAssertFalse(sut.check(inputIsValid: "simplepassword") == .valid)
        XCTAssertFalse(sut.check(inputIsValid: "123") == .valid)
        XCTAssertTrue(sut.check(inputIsValid: "StrongPassword2020") == .valid)
        
    }

}
