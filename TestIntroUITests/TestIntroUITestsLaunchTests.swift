//
//  TestIntroUITestsLaunchTests.swift
//  TestIntroUITests
//
//  Created by Martin Wainaina on 14/05/2024.
//

import XCTest

class SetUpLaunchingAddNewTasksScreen: XCTestCase {
    // Short cut is CMD + U
    var app: XCUIApplication!
    
    override func setUp() {
        // Arrange
        app = XCUIApplication()
        app.launch()
        
        //Act
        let addTaskButton = app.buttons["showAddTaskButton"]
        addTaskButton.tap()
    }
}

class WhenAddNewScreenIsPresnted: SetUpLaunchingAddNewTasksScreen {
    
    func testShouldMakeSureScreenIsPresented() {
        // Assert
        let addTaskNavBarTitle = app.staticTexts["Add Tasks"]
        XCTAssert(addTaskNavBarTitle.waitForExistence(timeout: 0.5))
    }
    
    func testShouldMakeSureAllRequireAllControllsArePresent(){
        XCTAssertTrue(app.textFields["addTaskTextField"].exists)
        XCTAssertTrue(app.buttons["addTaskButton"].exists)
    }
    
    func testShouldDismissSheetAfterAddingNewTask() {
        let taskTextField = app.textFields["addTaskTextField"]
        taskTextField.tap()
        taskTextField.typeText("Wash Dishes")

        let addTaskButton = app.buttons["addTaskButton"]
        addTaskButton.tap()
        
        // Assert that button has gone away
        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 0.5), "Assert that button has gone away")
    }
    
}

class WhenAddNewTask: SetUpLaunchingAddNewTasksScreen {
    func testShoulDisplayNewTaskInTheList() {
        let taskTextField = app.textFields["addTaskTextField"]
        taskTextField.tap()
        taskTextField.typeText("Wash Dishes")
        
        let addTaskButton = app.buttons["addTaskButton"]
        addTaskButton.tap()
        
        XCTAssertFalse(addTaskButton.waitForExistence(timeout: 0.5), "Assert that button has gone away")
        
        let taskList = app.tables["taskList"]
        let _ = taskList.waitForExistence(timeout: 0.5)
        
        let totalTaskItems = taskList.descendants(matching: .staticText).count
        
//        XCTAssertEqual(1, totalTaskItems, "Assert that totalTaskItems is one or more ")

    }
}
