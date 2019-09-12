//
//  PhotoDetailsVCTests.swift
//  AstronomyUITests
//
//  Created by Jeffrey Santana on 9/12/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest

class PhotoDetailsVCTests: XCTestCase {
	var app: XCUIApplication!
	
	override func setUp() {
		super.setUp()
		print("Starting a new UI test")
		
		continueAfterFailure = false
		
		app = XCUIApplication()
		app.launchArguments = ["UITesting"]
		app.launch()
	}
	
	var savePhotoBtn: XCUIElement {
		let button = app.buttons["PhotoDetailViewController.SaveButton"]
		XCTAssertTrue(button.exists)
		XCTAssertTrue(button.isHittable)
		return button
	}
	
	func testSavePhotoBtn() {
		let collectionView = app.collectionViews.firstMatch
		collectionView.cells.firstMatch.tap()
		
		addUIInterruptionMonitor(withDescription: "Photo library access alert") { alert in
			alert.buttons["OK"].tap()
			return true
		}
		
		addUIInterruptionMonitor(withDescription: "Photo Saved!") { alert in
			alert.buttons["OK"].tap()
			return true
		}
		
		savePhotoBtn.tap()
	}

}
