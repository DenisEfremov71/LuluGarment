//
//  LuluGarmentPerformanceTests.swift
//  LuluGarmentPerformanceTests
//
//  Created by Denis Efremov on 2020-01-18.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import XCTest
@testable import LuluGarment

class LuluGarmentPerformanceTests: XCTestCase {
    
    var sut: GarmentPresenter!
    let garmentOne = Garment(name: "Shorts")
    let garmentTwo = Garment(name: "T-Shirt")
    let garmentThree = Garment(name: "Pants")

    override func setUp() {
        super.setUp()
        sut = GarmentPresenter()
        do {
            try sut.deleteAllGarments()
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testRealm_ReadAllGarments() {
        do {
            try sut.addGarment(garmentOne)
            try sut.addGarment(garmentTwo)
            try sut.addGarment(garmentThree)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        self.measure {
            do {
                _ = try sut.getAllGarments()
            } catch {
                XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
            }
        }
    }
    
    func testRealm_ReadSingleGarment() {
        do {
            try sut.addGarment(garmentOne)
            try sut.addGarment(garmentTwo)
            try sut.addGarment(garmentThree)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        self.measure {
            do {
                _ = try sut.getGarment(by: "Shorts")
            } catch {
                XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
            }
        }
    }
    
    func testRealm_CreateGarments() {
        self.measure {
            let name = UUID.init().uuidString
            do {
                try sut.addGarment(Garment(name: name))
            } catch {
                XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
            }
        }
    }
    
    func testRealm_UpdateGarment() {
        do {
            try sut.addGarment(garmentOne)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        self.measure {
            do {
                try sut.updateGarment(garmentOne, newName: UUID.init().uuidString)
            } catch {
                XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
            }
        }
    }

}
