@testable import DotDash
import SwiftUI
import Testing

struct HomeTests {
  /// Helper to assert a type conforms to View at compile time
  private func assertIsView<V: View>(_ value: V) -> V {
    value
  }

  @Test
  func Home_conformsToView() {
    _ = assertIsView(Home())
    #expect(true)
  }

  @Test
  @MainActor
  func Home_buildsBodyWithoutCrashing() {
    let home = Home()
    _ = home.body
    #expect(true)
  }

  @Test
  @MainActor
  func Home_bodyContainsTabView() {
    let home = Home()
    let body = home.body
    let description = String(describing: body)
    let contains = description.contains("TabView")
    #expect(contains, "A view Home deve conter um TabView na hierarquia.")
  }
}
