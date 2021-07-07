//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Nikita Thomas on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSavingPhoto() {
        CollectionViewPage(testCase: self)
        .tapOnCell(at: 0)
        .tapSaveButton()
        .verifySavePopupShows()
    }
    
    func testDetailImageLoads() {
        CollectionViewPage(testCase: self)
        .tapOnCell(at: 0)
        .verifyImage()
    }
    
    func testNextSol() {
        CollectionViewPage(testCase: self)
        .tapNextButton()
        .verifyTitle(title: "Sol 16")
    }
    
    func testPreviousSol() {
        CollectionViewPage(testCase: self)
        .tapPreviousButton()
        .verifyTitle(title: "Sol 14")
    }

}
