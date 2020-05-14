//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Hunter Oppel on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
import SwiftMonkey

class AstronomyUITests: XCTestCase {
    
    private var app: XCUIApplication {
        XCUIApplication()
    }
    
    private func getNavBarTitleFor(_ sol: Int) -> XCUIElement {
        app.staticTexts["Sol \(sol)"]
    }
    private func getCellFor(_ index: Int) -> XCUIElement {
        app.collectionViews.cells["Cell \(index)"]
    }
    
    private var nextSol: XCUIElement {
        app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    private var previousSol: XCUIElement {
        app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    private var cellImage: XCUIElement {
        app.images["PhotoDetailViewController.ImageView"]
    }
    private var saveButton: XCUIElement {
        app.buttons["PhotoDetailViewController.SaveButton"]
    }

    override func setUpWithError() throws {
        app.launchArguments = ["UITesting"]
        
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testViewingSols() {
        app.launch()
        
        guard getNavBarTitleFor(1).waitForExistence(timeout: 3) else {
            XCTFail()
            return
        }
        XCTAssertEqual(getNavBarTitleFor(1).label, "Sol 1")
        
        nextSol.tap()
        guard getNavBarTitleFor(2).waitForExistence(timeout: 3) else {
            XCTFail()
            return
        }
        XCTAssertEqual(getNavBarTitleFor(2).label, "Sol 2")

        previousSol.tap()
        guard getNavBarTitleFor(1).waitForExistence(timeout: 3) else {
            XCTFail()
            return
        }
        XCTAssertEqual(getNavBarTitleFor(1).label, "Sol 1")
    }
    
    func testViewingCell() {
        app.launch()
        
        for _ in 0...5 {
            nextSol.tap()
        }
        
        guard getNavBarTitleFor(14).waitForExistence(timeout: 3) else {
            XCTFail()
            return
        }
        XCTAssertEqual(getNavBarTitleFor(14).label, "Sol 14")
        
        getCellFor(0).tap()
        
        XCTAssert(cellImage.exists)
        XCTAssert(app.staticTexts["8/19/12, 8:00 PM"].exists)
    }
    
    func testSavingImage() {
        app.launch()
        
        for _ in 0...5 {
            nextSol.tap()
        }
        
        guard getNavBarTitleFor(14).waitForExistence(timeout: 3) else {
            XCTFail()
            return
        }
        XCTAssertEqual(getNavBarTitleFor(14).label, "Sol 14")
        
        getCellFor(0).tap()
        
        saveButton.tap()
        XCTAssert(app.staticTexts["Photo Saved!"].exists)
        app.buttons["Okay"].tap()
        XCTAssert(!app.staticTexts["Photo Saved!"].exists)
    }
    
    func testExitingImages() {
        app.launch()
        
        for _ in 0...5 {
            nextSol.tap()
        }
        
        guard getNavBarTitleFor(14).waitForExistence(timeout: 3) else {
            XCTFail()
            return
        }
        XCTAssertEqual(getNavBarTitleFor(14).label, "Sol 14")
        
        getCellFor(0).tap()
        
        XCTAssert(cellImage.exists)
        XCTAssert(app.staticTexts["8/19/12, 8:00 PM"].exists)
        
        app.buttons["Sol 14"].tap()
        
        XCTAssertEqual(getNavBarTitleFor(14).label, "Sol 14")
        getCellFor(1).tap()
        
        XCTAssert(cellImage.exists)
        XCTAssert(app.staticTexts["8/19/12, 8:00 PM"].exists)
    }
    
    func testMonkey() {
        app.launch()
        
        let monkey = Monkey(frame: app.frame)
        monkey.addDefaultXCTestPublicActions(app: app)
        
        monkey.addXCTestTapAlertAction(interval: 100, application: app)
        
        monkey.monkeyAround()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
