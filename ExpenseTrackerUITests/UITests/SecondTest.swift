//
//  SecondTest.swift
//  ExpenseTrackerUITests
//
//  Created by Roberto Timis on 27/06/2021.
//  Copyright © 2021 Alfian Losari. All rights reserved.
//

/**
 This test verifies the sort, order and filter features of the application:
 - creating an expense first to populate the list
 - function "clickRadioButtons" manipulates the sort and order buttons. Because the app does not have identifiers for sort and order buttons I have decided to use the position on the screen (3 and 4 for sort,  5 and 6 for order).
 - filtering is done on lines 31, 32 (selecting a filtering option) and 33 (deselecting filtering option)
 */
import XCTest

class SecondTest: TestBase {

func testSortOrderAndFilterExpenses() {
    checkAndClickHomeScreenButtons("Dashboard", "Logs")
    checkAndClickButton("Add", "Add")
    enterTextField("Name", "Ted's Coffee")
    clickInputField("Amount")
    deleteText("delete", 4)
    enterTextField("Amount", "5")
    checkAndClickButton("Category", "Category")
    checkAndClickTableButton("Food", "Food")
    checkAndClickButton("Save", "Save")
    clickRadioButtons(3, 4)
    clickRadioButtons(6, 5)
    checkAndClickButton("Food", "Food")
    checkAndClickButton("Entertainment", "Entertainment")
    checkAndClickButton("Food", "Food")
    }
}
