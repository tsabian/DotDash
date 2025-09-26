//
//  DotDashUITests.swift
//  DotDashUITests
//
//  Created by Tiago de Oliveira on 22/09/25.
//

import XCTest

final class DotDashUITests: XCTestCase {
  override func setUpWithError() throws {
    continueAfterFailure = false
  }

  override func tearDownWithError() throws {
  }

  @MainActor
  func testExample() throws {
    let application = XCUIApplication()
    application.launch()
  }

  @MainActor
  func testLaunchPerformance() throws {
    measure(metrics: [XCTApplicationLaunchMetric()]) {
      XCUIApplication().launch()
    }
  }
}
