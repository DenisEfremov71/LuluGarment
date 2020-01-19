//
//  GarmentTests.swift
//  LuluGarmentTests
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import XCTest
@testable import LuluGarment

class GarmentTests: XCTestCase {
    
    var sut: Garment!
    var creationTime: Date!

    override func setUp() {
        super.setUp()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        creationTime = formatter.date(from: "2019/12/31 22:31")
        sut = Garment(name: "Shirt")
        sut.creationTime = creationTime!
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    // MARK: - Initialization

    func testInit_WhenInitialized_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    func testInit_WhenInitialized_NameShouldBeSet() {
        XCTAssertEqual(sut.name, "Shirt")
    }
    
    func testInit_WhenInitialized_CreationTimeShouldBeSet() {
        XCTAssertEqual(sut.creationTime, creationTime)
    }
    
    // MARK: - Equatable
    
    func testEquatable_WhenComparingTwoSameGarments_TheyShouldBeEqual() {
        let secondGarment = Garment(name: "Shirt")
        secondGarment.creationTime = creationTime
        //XCTAssertEqual(sut, secondGarment)    // Equatable protocol doesn't work on Realm objects
        XCTAssertEqual(sut.name, secondGarment.name)
        XCTAssertEqual(sut.creationTime, secondGarment.creationTime)
        
    }

}
