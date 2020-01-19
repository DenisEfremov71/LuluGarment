//
//  GarmentPresenterTests.swift
//  LuluGarmentTests
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import XCTest
@testable import LuluGarment

class GarmentPresenterTests: XCTestCase {
    
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

    // MARK: - Initialization
    
    func testInit_WhenInitialized_ShouldNotBeNil() {
        XCTAssertNotNil(sut)
    }
    
    // MARK: - CRUD
    
    func testRealm_WhenAddsGarment_ShouldFindGarment() {
        do {
            try sut.addGarment(garmentOne)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        var garmentFound: Garment?
        do {
            garmentFound = try sut.getGarment(by: "Shorts")
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        XCTAssertEqual(garmentFound?.name, "Shorts")
    }
    
    func testRealm_WhenUpdatesGarment_ShouldTakeTheUpdate() {
        do {
            try sut.addGarment(garmentOne)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        var garment: Garment?
        do {
            garment = try sut.getGarment(by: "Shorts")
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        let newName = "Sneakers"
        do {
            try sut.updateGarment(garment!, newName: newName)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        var updatedGarment: Garment?
        do {
            updatedGarment = try sut.getGarment(by: newName)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        XCTAssertEqual(updatedGarment?.name, newName)
    }
    
    func testRealm_WhenDeletesGarment_GarmentShouldNotBeFound() {
        do {
            try sut.addGarment(garmentOne)
            try sut.addGarment(garmentTwo)
            try sut.addGarment(garmentThree)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        do {
            try sut.deleteGarment(garmentTwo)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        var garmentFound: Garment?
        do {
            garmentFound = try sut.getGarment(by: "T-Shirt")
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        XCTAssertNil(garmentFound)
    }
    
    func testRealm_WhenDeletesAllGarments_NoGarmentsShouldBeFound() {
        do {
            try sut.addGarment(garmentOne)
            try sut.addGarment(garmentTwo)
            try sut.addGarment(garmentThree)
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        do {
            try sut.deleteAllGarments()
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        var garmentsFound = [Garment]()
        do {
            garmentsFound = try sut.getAllGarments()
        } catch {
            XCTAssertTrue(error is RealmError, "Unexpected error type: \(type(of: error))")
        }
        XCTAssertEqual(garmentsFound.count, 0)
    }

}
