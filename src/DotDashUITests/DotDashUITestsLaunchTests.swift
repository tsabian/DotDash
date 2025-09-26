//
//  DotDashUITestsLaunchTests.swift
//  DotDashUITests
//
//  Created by Tiago de Oliveira on 22/09/25.
//

import XCTest

final class DotDashUITestsLaunchTests: XCTestCase {
  override class var runsForEachTargetApplicationUIConfiguration: Bool {
    true
  }
  
  override func setUpWithError() throws {
    continueAfterFailure = false
  }
  
  @MainActor
  func testLaunch() throws {
    let app = XCUIApplication()
    app.launch()
    let attachment = XCTAttachment(screenshot: app.screenshot())
    attachment.name = "Launch Screen"
    attachment.lifetime = .keepAlways
    add(attachment)
  }
}
