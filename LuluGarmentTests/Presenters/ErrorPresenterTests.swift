//
//  ErrorPresenterTests.swift
//  LuluGarmentTests
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import XCTest
@testable import LuluGarment

class ErrorPresenterTests: XCTestCase {
    
    var sut: ErrorPresenter!

    override func setUp() {
        super.setUp()
        sut = ErrorPresenter(message: "Test")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Initialization

    func testInit_WhenInitialized_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    func testInit_WhenInitialized_MessageShouldBeSet() {
        XCTAssertEqual(sut.message, "Test")
    }

}
