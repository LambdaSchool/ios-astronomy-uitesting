//
//  AstronomyUITests.swift
//  AstronomyUITests
//
//  Created by Dillon McElhinney on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

class AstronomyUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        let app = XCUIApplication()
        app.launchArguments = ["UITesting"]
        app.launch()
    }
    
    /// Tests clicking into a photo, verifies the information, and clicks back out
    func testClickingPhoto() {
        PhotoCollectionTestPage(testCase: self)
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/20/12, 6:00 PM", sol: 15)
        .cameraLabelDisplays(camera: "Front Hazard Avoidance Camera")
        .tapBackButton()
        .titleDisplaysInfo(forSol: 15)
    }
    
    /// Tests changing Sols and verifies that the title updates, and that we are seeing different photos
    func testChangingSols() {
        PhotoCollectionTestPage(testCase: self)
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/20/12, 6:00 PM", sol: 15)
        .cameraLabelDisplays(camera: "Front Hazard Avoidance Camera")
        .tapBackButton()
        .tapNextButton()
        .titleDisplaysInfo(forSol: 16)
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/21/12, 6:00 PM", sol: 16)
        .cameraLabelDisplays(camera: "Front Hazard Avoidance Camera")
        .tapBackButton()
        .tapPreviousButton()
        .tapPreviousButton()
        .titleDisplaysInfo(forSol: 14)
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/19/12, 6:00 PM", sol: 14)
        .cameraLabelDisplays(camera: "Front Hazard Avoidance Camera")
        .tapBackButton()
    }
    
    /// Tests clicking on photos, swiping up, and then clicking on another photo. Verifies that the photos are different.
    func testClickingOnPhotosAndSwiping() {
        PhotoCollectionTestPage(testCase: self)
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/20/12, 6:00 PM", sol: 15)
        .cameraLabelDisplays(camera: "Front Hazard Avoidance Camera")
        .tapBackButton()
        .swipeUp()
        .swipeUp()
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/20/12, 6:00 PM", sol: 15)
        .cameraLabelDisplays(camera: "Rear Hazard Avoidance Camera")
        .tapBackButton()
        .swipeUp()
        .swipeUp()
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/20/12, 6:00 PM", sol: 15)
        .cameraLabelDisplays(camera: "Chemistry and Camera Complex")
        .tapBackButton()
        .swipeUp()
        .swipeUp()
        .tapCell(2)
        .detailLabelDisplays(rover: 5, date: "8/20/12, 6:00 PM", sol: 15)
        .cameraLabelDisplays(camera: "Navigation Camera")
        .tapBackButton()
    }

    /// Tests saving a photo to the photo library
    func testSavingPhoto() {
        PhotoCollectionTestPage(testCase: self)
        .tapCell(2)
        .tapSavePhotoButton()
        .checkPhotoSaved()
        .tapOkayButton()
        .tapBackButton()
    }
}
