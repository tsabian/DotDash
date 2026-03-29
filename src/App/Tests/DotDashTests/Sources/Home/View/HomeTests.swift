@testable import DotDash
import SwiftUI
import Testing

struct HomeTests {
  /// Helper to assert a type conforms to View at compile time.
  private func assertIsView<V: View>(_ value: V) -> V {
    value
  }

  @MainActor
  private func bodyDescription() -> String {
    String(describing: Home().body)
  }

  @Test
  func homeConformsToView() {
    _ = assertIsView(Home())
    #expect(true)
  }

  @Test
  @MainActor
  func homeBuildsBodyWithoutCrashing() {
    _ = Home().body
    #expect(true)
  }

  @Test
  @MainActor
  func homeCanBeInstantiatedMultipleTimes() {
    let first = Home()
    let second = Home()
    _ = first.body
    _ = second.body
    #expect(true)
  }
}
