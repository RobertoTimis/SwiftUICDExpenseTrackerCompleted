//
//  ThirdTest.swift
//  ExpenseTrackerUITests
//
//  Created by Roberto Timis on 27/06/2021.
//  Copyright © 2021 Alfian Losari. All rights reserved.
//

/**
 This test verifies the search and deletion features of an expense:
 - creating an expense first to populate the list
 - search for an expense (line 29)
 - delete an expense using "deleteItemFromList" function and passing the entry from the list
 - clearing the search field
 - going to Dashboard to see if the expense was deleted
 */
import XCTest

class ThirdTest: TestBase {

func testSearchAndDeleteExpense() {
    checkAndClickHomeScreenButtons("Dashboard", "Logs")
    checkAndClickButton("Add", "Add")
    enterTextField("Name", "Uber")
    clickInputField("Amount")
    deleteText("delete", 4)
    enterTextField("Amount", "20")
    checkAndClickButton("Category", "Category")
    checkAndClickTableButton("Transportation", "Transportation")
    checkAndClickButton("Save", "Save")
    enterSearchField("Search expenses", "Uber")
    deleteItemFromList(0)
    clickInputField("Search expenses")
    checkAndClickButton("Clear text", "Clear text")
    checkAndClickButton("search", "search")
    checkAndClickHomeScreenButtons("Dashboard", "Dashboard")
    }
}
