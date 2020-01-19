//
//  LuluGarmentUITests.swift
//  LuluGarmentUITests
//
//  Created by Denis Efremov on 2020-01-16.
//  Copyright © 2020 Denis Efremov. All rights reserved.
//

import XCTest

class LuluGarmentUITests: XCTestCase {
    
    private var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        app = nil
    }
    
    // MARK: - Navigation
    
    func test_WhenTouchingPlusButton_ShouldNavigateToGarmentVC() {
        app.navigationBars["List"].buttons["Add"].tap()
        let newGarmentNavBar = app.navigationBars["New Garment"]
        XCTAssertTrue(newGarmentNavBar.exists)
    }
    
    func test_WhenTouchingCancelButton_ShouldReturnToGarmentListVC() {
        let listNavigationBar = app.navigationBars["List"]
        listNavigationBar.buttons["Add"].tap()
        app.navigationBars["New Garment"].buttons["Cancel"].tap()
        XCTAssertTrue(listNavigationBar.exists)
    }

    // MARK: - Error presenter
    
    func test_WhenClickingDeleteAll_ShouldShowDetructiveAlert() {
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            let warningSheet = app.sheets["Warning"]
            let warningText = warningSheet.staticTexts["Presing Delete All will delete all the garments. Is this what you intended to do?"]
            XCTAssertTrue(warningText.exists)
        }
    }
    
    func test_WhenSavingGarmentWithEmptyName_ShouldShowErrorAlert() {
        app.navigationBars["List"].buttons["Add"].tap()
        app.navigationBars["New Garment"].buttons["Save"].tap()
        let garmentNameIsEmptyStaticText = app.alerts["Error"].staticTexts["Garment name is empty"]
        XCTAssertTrue(garmentNameIsEmptyStaticText.exists)
    }
    
    func test_WhenSavingGarmentWithExistingName_ShouldShowErrorAlert() {
        
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
        }
        
        let addButton = app.navigationBars["List"].buttons["Add"]
        addButton.tap()
        
        let newGarmentNameTextField = app.textFields["New Garment Name"]
        newGarmentNameTextField.tap()
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        
        let saveButton = app.navigationBars["New Garment"].buttons["Save"]
        saveButton.tap()
        addButton.tap()
        
        newGarmentNameTextField.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        aKey.tap()
        saveButton.tap()
        
        let errorAlert = app.alerts["Error"]
        let garmentNameAlreadyExistsStaticText = errorAlert.staticTexts["Garment name already exists"]
        XCTAssertTrue(garmentNameAlreadyExistsStaticText.exists)
    }
    
    // MARK: - Operations
    
    func test_WhenPressingDeleteAll_ShouldDeleteAllGarmentsFromTableView() {
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
            XCTAssertTrue(app.tables.staticTexts.count == 0)
        }
    }
    
    func test_WhenAddingGarments_ShouldSeeThemInTableView() {
        
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
        }
        
        let addButton = app.navigationBars["List"].buttons["Add"]
        addButton.tap()
        
        let newGarmentNameTextField = app.textFields["New Garment Name"]
        newGarmentNameTextField.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        
        let saveButton = app.navigationBars["New Garment"].buttons["Save"]
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        bKey.tap()
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let cKey = app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        cKey.tap()
        saveButton.tap()
        
        XCTAssertTrue(app.tables.staticTexts.count == 3)
    }
    
    func test_WhenUpdatingGarment_ShouldSeeTheUpdatedVersionInTableView() {
        
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
        }
        
        app.navigationBars["List"].buttons["Add"].tap()
        
        let newGarmentNameTextField = app.textFields["New Garment Name"]
        newGarmentNameTextField.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        bKey.tap()
        bKey.tap()
        app.navigationBars["New Garment"].buttons["Save"].tap()
        
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["bbb"]/*[[".cells.staticTexts[\"bbb\"]",".staticTexts[\"bbb\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        newGarmentNameTextField.tap()
        
        let cKey = app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        
        let editGarmentNavigationBar = app.navigationBars["Edit Garment"]
        editGarmentNavigationBar.buttons["Save"].tap()
        
        let updatedGarment = tablesQuery.staticTexts["bbbc"]
        XCTAssertTrue(updatedGarment.exists)
    }
    
    func test_WhenSwipingToDelete_CellShouldBeRemovedFromTableView() {
        
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
        }
        
        let addButton = app.navigationBars["List"].buttons["Add"]
        addButton.tap()
        
        let newGarmentNameTextField = app.textFields["New Garment Name"]
        newGarmentNameTextField.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        
        let saveButton = app.navigationBars["New Garment"].buttons["Save"]
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        bKey.tap()
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let cKey = app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        cKey.tap()
        saveButton.tap()
        
        XCTAssertTrue(app.tables.staticTexts.count == 3)
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.staticTexts["bb"].swipeLeft()
        tablesQuery.buttons["Delete"].tap()
        
        XCTAssertTrue(app.tables.staticTexts.count == 2)
    }
    
    func test_WhenOrderingAlphabetically_GarmentsAreOrderedInTableView() {
        
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
        }
        
        let addButton = app.navigationBars["List"].buttons["Add"]
        addButton.tap()
        
        let newGarmentNameTextField = app.textFields["New Garment Name"]
        newGarmentNameTextField.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        
        let saveButton = app.navigationBars["New Garment"].buttons["Save"]
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        bKey.tap()
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let cKey = app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        cKey.tap()
        saveButton.tap()
        
        app.buttons["Creation Time"].tap()
        app.buttons["Alpha"].tap()
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        let aaaText = firstCell.staticTexts["aa"]
        XCTAssertTrue(aaaText.exists)
    }
    
    func test_WhenOrderingByCreatinoTime_GarmentsAreOrderedInTableView() {
        
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
        }
        
        let addButton = app.navigationBars["List"].buttons["Add"]
        addButton.tap()
        
        let newGarmentNameTextField = app.textFields["New Garment Name"]
        newGarmentNameTextField.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        aKey.tap()
        
        let saveButton = app.navigationBars["New Garment"].buttons["Save"]
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let bKey = app/*@START_MENU_TOKEN@*/.keys["b"]/*[[".keyboards.keys[\"b\"]",".keys[\"b\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        bKey.tap()
        bKey.tap()
        saveButton.tap()
        addButton.tap()
        newGarmentNameTextField.tap()
        
        let cKey = app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        cKey.tap()
        cKey.tap()
        saveButton.tap()
        
        app.buttons["Alpha"].tap()
        app.buttons["Creation Time"].tap()
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        let aaaText = firstCell.staticTexts["cc"]
        XCTAssertTrue(aaaText.exists)
    }
    
    func test_WhenPressingReturnKey_TheNewGarmentShouldBeAddedToTableView() {
        
        if app.tables.staticTexts.count > 0 {
            app.navigationBars["List"].buttons["Delete"].tap()
            app.sheets["Warning"].buttons["Delete All"].tap()
        }
        
        app.navigationBars["List"].buttons["Add"].tap()
        app.textFields["New Garment Name"].tap()
        
        let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()
        dKey.tap()
        dKey.tap()
        
        app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"return\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let dddGarment = app.tables/*@START_MENU_TOKEN@*/.staticTexts["ddd"]/*[[".cells.staticTexts[\"ddd\"]",".staticTexts[\"ddd\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(dddGarment.exists)
    }

}
