//
//  DetailViewPage.swift
//  AstronomyUITests
//
//  Created by Nikita Thomas on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct DetailViewPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var imageView: XCUIElement {
        return app.images["PhotoDetailViewController.ImageView"]
    }
    
    var saveButton: XCUIElement {
        return app.buttons["PhotoDetailViewController.SaveButton"]
    }
    
    var alertController: XCUIElement {
        return app.alerts["Photo Saved!"]
    }
    
    // Interactions
    @discardableResult func tapSaveButton() -> DetailViewPage {
        XCTAssertNotNil(saveButton)
        saveButton.tap()
        return self
    }
    
    
    // Verification
    @discardableResult func verifyImage() -> DetailViewPage {
        XCTAssertNotNil(imageView)
        return self
    }
    
    @discardableResult func verifySavePopupShows() -> DetailViewPage {
        XCTAssertNotNil(alertController)
        return self
    }
    
    
    
    
}
