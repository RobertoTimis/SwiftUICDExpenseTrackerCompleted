//
//  TestBase.swift
//  ExpenseTrackerUITests
//
//  Created by Roberto Timis on 26/06/2021.
//  Copyright © 2021 Alfian Losari. All rights reserved.
//

/**
 Class TestBase is used as a parent for our automated tests since it holds all functions and the setup for them.
 I added marks to categorise functions  in order to be more readable.
 */
import Foundation
import XCTest

class TestBase: XCTestCase {
    var testData: Data!
    let app = XCUIApplication()
    
    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        super.setUp()
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app.launchEnvironment = ["TEST": "YES"]
        app.launchArguments = ["NoAnimations", "{}"]
        app.launch()
    }
    
    // MARK: - Miscellaneous
    
    func deleteItemFromList(_ identifier: Int) {
        let cell = app.cells.element(boundBy: identifier)
        let rightOffset = CGVector(dx: 0.95, dy: 0.5)
        let leftOffset = CGVector(dx: 0.05, dy: 0.5)
        let farRightCoordinate = cell.coordinate(withNormalizedOffset: rightOffset)
        let farLeftCoordinate = cell.coordinate(withNormalizedOffset: leftOffset)
        farRightCoordinate.press(forDuration: 0.1, thenDragTo: farLeftCoordinate)
    }
    
    func checkStaticText(_ identifier: String) {
        app.staticTexts[identifier].exists
    }
    
    func modifyDatePickerValue(_ identifier: String, _ identifier1: String, _ identifier2: String) {
        app.pickerWheels.element(boundBy: 0).adjust(toPickerWheelValue: identifier)
        app.pickerWheels.element(boundBy: 1).adjust(toPickerWheelValue: identifier1)
        app.pickerWheels.element(boundBy: 2).adjust(toPickerWheelValue: identifier2)
    }
 
    // MARK: - Buttons
    
    func checkAndClickHomeScreenButtons(_ identifier: String, _ identifier1: String) {
        XCTAssert(app.tabBars.buttons[identifier].waitForExistence(timeout: 3))
        XCTAssert(app.tabBars.buttons[identifier].exists)
        app.tabBars.buttons[identifier1].tap()
    }
    
    func checkAndClickButton(_ identifier: String, _ identifier1: String) {
        XCTAssert(app.buttons[identifier].waitForExistence(timeout: 3))
        XCTAssert(app.buttons[identifier].exists)
        app.buttons[identifier1].tap()
    }
    
    func checkAndClickTableButton(_ identifier: String, _ identifier1: String) {
        XCTAssert(app.tables.buttons[identifier].waitForExistence(timeout: 3))
        XCTAssert(app.tables.buttons[identifier].exists)
        app.tables.buttons[identifier1].tap()
    }
    
    func clickRadioButtons(_ identifier: Int, _ identifier1: Int) {
        if app.buttons.element(boundBy: identifier).isEnabled {
        app.buttons.element(boundBy: identifier1).tap()
        } else {
        app.buttons.element(boundBy: identifier).tap()
        }
    }
 
    // MARK: - Text
    
    func clickInputField(_ identifier: String) {
        if app.tables.textFields[identifier].exists,
        app.tables.textFields[identifier].isHittable {
        app.tables.textFields[identifier].tap()
        } else {
            app.searchFields[identifier].tap()
        }
    }
    
    func enterTextField(_ identifier: String, _ identifier1: String) {
        XCTAssert(app.tables.textFields[identifier].waitForExistence(timeout: 3))
        clickInputField(identifier)
        app.typeText(identifier1)
        checkAndClickButton("return", "return")
    }
    
    func deleteText(_ identifier: String, _ identifier1: Int) {
        let deleteInput = app.keys
        deleteInput[identifier].tap(withNumberOfTaps: identifier1, numberOfTouches: 1)
    }
    
    func enterSearchField(_ identifier: String, _ identifier1: String) {
        XCTAssert(app.searchFields[identifier].waitForExistence(timeout: 3))
        clickInputField(identifier)
        app.typeText(identifier1)
        checkAndClickButton("search", "search")
    }
}
