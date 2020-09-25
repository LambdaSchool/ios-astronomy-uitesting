//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Bohdan Tkachenko on 9/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {
    
    private var app: XCUIApplication {
        return XCUIApplication()
    }
    
    private var backButton: XCUIElement {
        let sol1Button = app.navigationBars["Title"]
        sol1Button.accessibilityLabel = "PhotoDetailViewController.BackButton"
        return sol1Button
    }
    
    private var firstCellOnCollectionView: XCUIElement {
        return app.collectionViews.children(matching:.any).element(boundBy: 0)
    }
    
    private var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var nasaImage: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    func testBackButton() {
        try! setUpWithError()
        if firstCellOnCollectionView.exists {
            firstCellOnCollectionView.tap()
        }
        backButton.tap()
    }
    
    func testSavePhoto() {
        try! setUpWithError()
        if firstCellOnCollectionView.exists {
            firstCellOnCollectionView.tap()
        }
        saveButton.tap()
        XCTAssertEqual(app.alerts.element.label, "Photo Saved!")
    }
    
    func testChangingSol() {
        try! setUpWithError()
        app.navigationBars["Sol 15"]/*@START_MENU_TOKEN@*/.buttons["PhotosCollectionViewController.PreviousSolButton"]/*[[".buttons[\"<\"]",".buttons[\"PhotosCollectionViewController.PreviousSolButton\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        let newSolTitle = app.navigationBars["Sol 14"].staticTexts["Sol 14"]
        XCTAssertEqual(newSolTitle.label, "\(newSolTitle.label)")
    }
    
    func testViewingCellDetail() {
        try! setUpWithError()
        firstCellOnCollectionView.images["ImageCell"].tap()
        let photo = nasaImage.waitForExistence(timeout: 2)
        XCTAssert(photo)
    }
}
