//
//  TastyTest_Challenge_APP_on_SwiftUITestsLaunchTests.swift
//  TastyTest-Challenge APP on SwiftUITests
//
//  Created by Mohammed AlZmzmi on 10/01/2023.
//

import XCTest

final class TastyTest_Challenge_APP_on_SwiftUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
