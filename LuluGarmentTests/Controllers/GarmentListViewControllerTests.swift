//
//  GarmentListViewControllerTests.swift
//  LuluGarmentTests
//
//  Created by Denis Efremov on 2020-01-17.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import XCTest
@testable import LuluGarment

class GarmentListViewControllerTests: XCTestCase {
    
    var sut: GarmentListViewController!

    override func setUp() {
        super.setUp()
        let sb = UIStoryboard(name: "Main", bundle: nil)
        sut = sb.instantiateViewController(withIdentifier: "GarmentListViewController") as? GarmentListViewController
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
    
    func testInit_WhenInitialized_TableViewShouldNotBeNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testInit_WhenInitialized_SegmentedControlShouldNotBeNil() {
        XCTAssertNotNil(sut.segmentedControl)
    }
    
    func testInit_WhenInitialized_AppDelegateShouldNotBeNil() {
        XCTAssertNotNil(sut.appDelegate)
    }
    
    func testInit_WhenInitialized_GarmentArrayShouldNotBeNil() {
        XCTAssertNotNil(sut.garmentArray)
    }
    
    func testInit_WhenInitialized_GarmentArrayShouldBeEmpty() {
        XCTAssertEqual(sut.garmentArray.count, 0)
    }
    
    // MARK: - Table view data source and delegate
    
    func testDataSource_ViewDidLoad_SetsTableViewDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
        XCTAssertTrue(sut.tableView.dataSource is GarmentListViewController)
    }
    
    func testDelegate_ViewDidLoad_SetsTableViewDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
        XCTAssertTrue(sut.tableView.delegate is GarmentListViewController)
    }
    
    func testTableView_ViewDidLoad_SameObjectForDataSourceAndDelegate() {
        XCTAssertEqual(sut.tableView.dataSource as! GarmentListViewController, sut.tableView.delegate as! GarmentListViewController)
    }
    
    // MARK: - Table view sections
    
    func testTableViewSections_Count_ReturnsOne() {
        XCTAssertEqual(sut.tableView.numberOfSections, 1)
    }

}
