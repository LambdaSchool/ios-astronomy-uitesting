//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Cora Jacobson on 9/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    private var nextSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var previousSolButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    private var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var firstChild: XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: 0)
    }
    
    override func setUp() {
        super.setUp()
        app.launchArguments = ["UITesting"]
        app.launch()
        continueAfterFailure = false
    }

    func testNextSol() {
        XCTAssert(app.staticTexts["Sol 15"].exists)
        nextSolButton.tap()
        XCTAssert(app.staticTexts["Sol 16"].exists)
    }
    
    func testPreviousSol() {
        XCTAssert(app.staticTexts["Sol 15"].exists)
        previousSolButton.tap()
        XCTAssert(app.staticTexts["Sol 14"].exists)
    }
    
    func testDetailView() {
        firstChild.tap()
        XCTAssert(app.staticTexts["Front Hazard Avoidance Camera"].exists)
        XCTAssert(app.staticTexts["Taken by 5 on 8/20/12, 5:00 PM (Sol 15)"].exists)
        XCTAssert(savePhotoButton.exists)
    }
    
    func testSavePhoto() {
        firstChild.tap()
        savePhotoButton.tap()
        app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"].tap()
        // Presence of alert and success in tapping on "Okay" indicates the test succeeded
    }
    
    func testScrolling() {
        // Swipes past the photos taken by "Front Hazard Avoidance Camera" to photos from other cameras
        app.swipeUp()
        app.swipeUp()
        app.swipeUp()
        firstChild.tap()
        XCTAssertFalse(app.staticTexts["Front Hazard Avoidance Camera"].exists)
    }

}
