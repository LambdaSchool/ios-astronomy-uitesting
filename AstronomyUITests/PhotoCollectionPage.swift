//
//  PhotoCollectionPage.swift
//  AstronomyUITests
//
//  Created by Dillon McElhinney on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct PhotoCollectionTestPage: TestPage {
    var testCase: XCTestCase
    
    // MARK: - UI Elements
    private func cell(_ index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index)
    }
    
    private var previousButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    private var nextButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    // MARK: - Actions
    @discardableResult func tapNextButton(file: String = #file, line: UInt = #line) -> PhotoCollectionTestPage {
        testCase.expect(exists: nextButton, file: file, line: line)
        nextButton.tap()
        return self
    }
    
    @discardableResult func tapPreviousButton(file: String = #file, line: UInt = #line) -> PhotoCollectionTestPage {
        testCase.expect(exists: previousButton, file: file, line: line)
        previousButton.tap()
        return self
    }
    
    @discardableResult func tapCell(_ index: Int, file: String = #file, line: UInt = #line) -> PhotoDetailTestPage {
        let title = app.navigationBars.firstMatch.identifier
        let cell = self.cell(index)
        testCase.expect(exists: cell, file: file, line: line)
        cell.tap()
        return PhotoDetailTestPage(testCase: self.testCase, photoCollectionTestPage: self, backButtonLabel: title)
    }
    
    @discardableResult func swipeUp(file: String = #file, line: UInt = #line) -> PhotoCollectionTestPage {
        app.swipeUp()
        return self
    }
    
    // MARK: - Verifications
    
    @discardableResult func titleDisplaysInfo(forSol sol: Int, file: String = #file, line: UInt = #line) -> PhotoCollectionTestPage {
        testCase.expect(exists: app.navigationBars["Sol \(sol)"], file: file, line: line)
        return self
    }
    
}

