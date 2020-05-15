//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Bhawnish Kumar on 5/14/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

//MARK: - Properties
    
    private var app : XCUIApplication {
        XCUIApplication()
    }
    
    
    lazy var navBar = app.navigationBars.firstMatch
    lazy var navBarTitleLabel = navBar.staticTexts.firstMatch.label
    
    var sol1NavigationBar: XCUIElement {
     app.navigationBars["Sol 1"]
    }
    
    lazy var previousButton = app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
    
    lazy var nextButton = app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
    
   private var savePhoto: XCUIElement {
        app.buttons["Save to Photo Library"]
    }
    
    private var collectionViewCell: XCUIElement {
        return app.collectionViews.firstMatch
    }
    
    private var collectionViewScrolling: XCUIElement {
           return app.collectionViews.children(matching: .cell).element(boundBy: 0).images["CollectionViewCell.Image"]
       }
    
    private var collectionViewImage: XCUIElement {
        collectionViewCell.cells.firstMatch
    }
    
    private var sol1Button: XCUIElement {
        return sol1NavigationBar.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private var savingPhoto: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    private var alertSavingPhoto: XCUIElement {
        return app.alerts["Photo Saved!"].scrollViews.otherElements.buttons["Okay"]
    }
    
//MARK: - Methods
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
   
        app.launchArguments = ["UITesting"]
        app.launch()
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        
    }

    func testSavePhoto() {
        app.launch()
        
        collectionViewImage.tap()
        savingPhoto.tap()
        alertSavingPhoto.tap()
    }
    
    func testNextSol() {
        app.launch()
        
        sol1Button.tap()
        let sol2NavigationBar = app.navigationBars["Sol 2"]
             sol2NavigationBar.staticTexts["Sol 2"].tap()
    }
    
    func testPreviousSol() {
        app.launch()
        
       nextButton.tap()
        previousButton.tap()
        XCTAssertEqual(navBarTitleLabel, "Sol 0")
    }
    
    func testScroolling() {
        collectionViewScrolling.swipeUp()
        collectionViewScrolling.swipeDown()
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
