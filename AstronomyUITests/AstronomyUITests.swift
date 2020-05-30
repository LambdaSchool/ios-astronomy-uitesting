//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Chad Parker on 5/28/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        app = XCUIApplication()
        
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testThatThreeSolsAvailable() throws {
        let navBar = app.navigationBars["NavBar"]
        let prev = navBar.buttons["PreviousSolButton"]
        let next = navBar.buttons["NextSolButton"]
        
        prev.tap()
        prev.tap()
        XCTAssert(app.staticTexts["Sol 14"].exists)
        next.tap()
        XCTAssert(app.staticTexts["Sol 15"].exists)
        next.tap()
        XCTAssert(app.staticTexts["Sol 16"].exists)
        next.tap()
        next.tap()
        XCTAssert(app.staticTexts["Sol 16"].exists)
    }
    
    func testCellsLoaded() {
        let navBar = app.navigationBars["NavBar"]
        let prev = navBar.buttons["PreviousSolButton"]
        let next = navBar.buttons["NextSolButton"]
        
        prev.tap()
        XCTAssert(app.collectionViews.cells.count > 1)
        next.tap()
        XCTAssert(app.collectionViews.cells.count > 1)
        next.tap()
        XCTAssert(app.collectionViews.cells.count > 1)
    }
    
    func testDetailView() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).tap()
        XCTAssert(app.staticTexts["Title"].exists)
        XCTAssert(app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Taken by '")).element.exists)
        XCTAssert(app.staticTexts.containing(NSPredicate(format: "label CONTAINS 'Camera:'")).element.exists)
        XCTAssert(app.staticTexts["Save to Photo Library"].exists)
    }
    
    func testSavingToCameraRoll() {
        app.collectionViews.children(matching: .cell).element(boundBy: 0).tap()
        app.buttons["PhotoDetailViewController.SaveButton"].tap()
        XCTAssert(app.alerts["Photo Saved!"].exists)
    }
    
    //    func testLaunchPerformance() throws {
    //        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
    //            // This measures how long it takes to launch your application.
    //            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
    //                XCUIApplication().launch()
    //            }
    //        }
    //    }
}
