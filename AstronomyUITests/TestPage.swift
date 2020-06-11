//
//  TestPage.swift
//  AstronomyUITests
//
//  Created by De MicheliStefano on 13.09.18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import XCTest

protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
