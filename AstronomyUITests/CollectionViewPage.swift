//
//  CollectionViewPage.swift
//  AstronomyUITests
//
//  Created by Nikita Thomas on 12/6/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

struct CollectionViewPage: TestPage {
    var testCase: XCTestCase
    
    // UI Elements
    var previousButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.PreviousSolButton"]
    }
    
    var nextButton: XCUIElement {
        return app.buttons["PhotosCollectionViewController.NextSolButton"]
    }
    
    private func getCell(at index: Int) -> XCUIElement {
        return app.collectionViews.cells.element(boundBy:index)
    }
    
    private func navigationBar(named title: String) -> XCUIElement {
        return app.navigationBars[title]
    }
    
    
    // Interactions
    
    @discardableResult func tapOnCell(at index: Int) -> DetailViewPage {
        let cell = getCell(at: index)
        cell.tap()
        
        return DetailViewPage(testCase: testCase)
    }
    
    @discardableResult func tapNextButton() -> CollectionViewPage {
        
        XCTAssertNotNil(nextButton)
        nextButton.tap()
        return self
    }
    
    @discardableResult func tapPreviousButton() -> CollectionViewPage {
        
        XCTAssertNotNil(previousButton)
        previousButton.tap()
        return self
    }
    
    
    // Verifications
    
    @discardableResult func verifyTitle(title: String) -> CollectionViewPage {
        XCTAssertNotNil(navigationBar(named: title))
        return self
    }
    
}
