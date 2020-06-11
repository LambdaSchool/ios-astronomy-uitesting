//
//  PhotosCollectionViewPage.swift
//  AstronomyUITests
//
//  Created by Enzo Jimenez-Soto on 6/11/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest

struct PhotosCollectionViewPage: TestPage {

    let testCase: XCTestCase

    // Elements
    
    var nextSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    var previousSolButton: XCUIElement {
        return app.navigationBars.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    func getCertainCell(index: Int) -> XCUIElement {
        return app.collectionViews.children(matching: .cell).element(boundBy: index).children(matching: .other).element
    }
    // Interactions
    
    @discardableResult func tapOnNextSolButton(file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        testCase.expect(exists: nextSolButton)
        nextSolButton.tap()
        return self
    }
    @discardableResult func tapOnPreviousSolButton(file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        testCase.expect(exists: previousSolButton)
        previousSolButton.tap()
        return self
    }
    @discardableResult func tapOnCell(index: Int, file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        testCase.expect(exists: getCertainCell(index: index))
        getCertainCell(index: index).tap()
        return self
    }

    // Verifications
    
    @discardableResult func verifyNextSolButtonLabelChanges(sol: Int, file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        testCase.expect(exists: app.navigationBars["Sol \(sol)"], file: file, line: line)
        tapOnNextSolButton()
        return self
    }
    
    @discardableResult func verifyPreviousSolButtonLabelChanges(sol: Int, file: String = #file, line: UInt = #line) -> PhotosCollectionViewPage {
        testCase.expect(exists: app.navigationBars["Sol \(sol)"], file: file, line: line)
        tapOnPreviousSolButton()
        return self
    }
    
}


