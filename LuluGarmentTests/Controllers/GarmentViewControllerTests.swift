//
//  GarmentViewControllerTests.swift
//  LuluGarmentTests
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import XCTest
@testable import LuluGarment

class GarmentViewControllerTests: XCTestCase {
    
    var sut: GarmentViewController!

    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(withIdentifier: "GarmentViewController") as? GarmentViewController
        sut.loadViewIfNeeded()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    // MARK: - Initialization
    
    func testInit_WhenInitialized_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    func testInit_WhenInitialized_GarmentShouldBeNil() {
        XCTAssertNil(sut.garment)
    }
    
    func testInit_WhenInitialized_AppDelegateShouldNotBeNil() {
        XCTAssertNotNil(sut.appDelegate)
    }
    
    func testInit_WhenInitialized_NavigationBarShouldNotBeNil() {
        XCTAssertNotNil(sut.navigationBar)
    }
    
    func testInit_WhenInitialized_NewGarmentNameShouldNotBeNil() {
        XCTAssertNotNil(sut.newGarmentName)
    }

}
