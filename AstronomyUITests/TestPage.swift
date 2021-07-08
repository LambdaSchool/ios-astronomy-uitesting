//
//  TestPage.swift
//  AstronomyUITests
//
//  Created by Dillon McElhinney on 10/18/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation
import XCTest

protocol TestPage {
    var testCase: XCTestCase { get }
}

extension TestPage {
    
    var app: XCUIApplication {
        return XCUIApplication()
    }
}
