//
//  HW11Tests.swift
//  HW11Tests
//
//  Created by Fox on 01.10.2022.
//

import XCTest
@testable import HW11

final class HW11Tests: XCTestCase {

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
