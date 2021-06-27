//
//  FirstTest.swift
//  ExpenseTrackerUITests
//
//  Created by Roberto Timis on 26/06/2021.
//  Copyright © 2021 Alfian Losari. All rights reserved.
//

/**
 This test verifies application's base feature:
 - creating an expense and assigning attributes (name, amount, date, category)
 - going to Dashboard to see if expenses were added (if no expenses were created user should not see "Total expenses" text)
 */
import XCTest

class FirstTest: TestBase {

func testCreateExpense() {
    checkStaticText("Please add your expenses from the logs tab")
    checkAndClickHomeScreenButtons("Dashboard", "Logs")
    checkAndClickButton("Add", "Add")
    checkAndClickButton("Cancel", "Cancel")
    checkAndClickButton("Add", "Add")
    enterTextField("Name", "Netflix")
    clickInputField("Amount")
    deleteText("delete", 4)
    enterTextField("Amount", "12")
    checkAndClickButton("Date", "Date")
    modifyDatePickerValue("May", "22", "2020")
    checkAndClickButton("Category", "Category")
    checkAndClickTableButton("Entertainment", "Entertainment")
    checkAndClickButton("Save", "Save")
    checkAndClickHomeScreenButtons("Dashboard", "Dashboard")
    checkStaticText("Total expenses")
    }
}
