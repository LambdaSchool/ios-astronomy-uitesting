//
//  PhotoDetailPage.swift
//  AstronomyUITests
//
//  Created by Dillon McElhinney on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotoDetailTestPage: TestPage {
    var testCase: XCTestCase
    var photoCollectionTestPage: PhotoCollectionTestPage
    
    // MARK: - UI Elements
    var backButtonLabel: String
    
    private var detailLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.DetailLabel"]
    }
    
    private var cameraLabel: XCUIElement {
        return app.staticTexts["PhotoDetailViewController.CameraLabel"]
    }
    
    private var savePhotoButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    // MARK: - Actions
    @discardableResult func tapBackButton(file: String = #file, line: UInt = #line) -> PhotoCollectionTestPage {
        let backButton = app.buttons[backButtonLabel]
        testCase.expect(exists: backButton, file: file, line: line)
        backButton.tap()
        return photoCollectionTestPage
    }
    
    @discardableResult func tapSavePhotoButton(file: String = #file, line: UInt = #line) -> PhotoDetailTestPage {
        testCase.expect(exists: savePhotoButton, file: file, line: line)
        savePhotoButton.tap()
        return self
    }
    
    @discardableResult func tapOkayButton(file: String = #file, line: UInt = #line) -> PhotoDetailTestPage {
        let button = app.alerts.buttons["Okay"]
        testCase.expect(exists: button, file: file, line: line)
        button.tap()
        return self
    }
    
    // MARK: - Verifications
    @discardableResult func detailLabelDisplays(rover: Int, date: String, sol: Int, file: String = #file, line: UInt = #line) -> PhotoDetailTestPage {
        testCase.expect(exists: detailLabel)
        let string = "Taken by \(rover) on \(date) (Sol \(sol))"
        testCase.expect(detailLabel.label, equals: string, file: file, line: line)
        return self
    }
    
    @discardableResult func cameraLabelDisplays(camera: String, file: String = #file, line: UInt = #line) -> PhotoDetailTestPage {
        testCase.expect(exists: cameraLabel)
        testCase.expect(cameraLabel.label, equals: camera, file: file, line: line)
        return self
    }
    
    @discardableResult func checkPhotoSaved(file: String = #file, line: UInt = #line) -> PhotoDetailTestPage {
        testCase.expect(exists: app.alerts["Photo Saved!"])
        return self
    }
    
}
