//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Bobby Keffury on 11/22/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
        
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingPhoto() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        
        let cell = app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"photoCell").element
        cell.tap()
        let saveButton = app.buttons["PhotoDetailViewController.SaveButton"]
        saveButton.tap()
        let alert = app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
        alert.tap()
        // Make sure the photo was saved
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testViewSol() {
        
        let app = XCUIApplication()
        let nextButton = app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
        let previousButton = app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
        var sol: Int = 15
        
        nextButton.tap()
        sol += 1
        previousButton.tap()
        sol -= 1
        previousButton.tap()
        sol -= 1
        
        XCTAssertEqual(sol, 14)
        
        // Need to make sure that the app is on the 14th sol
        
    }

}


