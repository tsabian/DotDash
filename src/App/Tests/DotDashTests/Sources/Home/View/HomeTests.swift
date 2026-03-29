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
  func homeBodyContainsTabView() {
    let description = bodyDescription()
    #expect(description.contains("TabView"), "A view Home deve conter um TabView na hierarquia.")
  }

  @Test
  @MainActor
  func homeContainsAllTabLabels() {
    let description = bodyDescription()
    #expect(description.contains("Aprender"))
    #expect(description.contains("Praticar"))
    #expect(description.contains("Ajustes"))
  }

  @Test
  @MainActor
  func homeContainsLearningTabContent() {
    let description = bodyDescription()
    #expect(description.contains("Frequência"))
    #expect(description.contains("PAM"))
    #expect(description.contains("Tradução de texto"))
    #expect(description.contains("-/.-..-..-.--."))
  }

  @Test
  @MainActor
  func homeContainsPracticeTabContent() {
    let description = bodyDescription()
    #expect(description.contains("Área de prática"))
  }

  @Test
  @MainActor
  func homeContainsSettingsTabContent() {
    let description = bodyDescription()
    #expect(description.contains("Configurações"))
    #expect(description.contains("Conteúdo de exemplo"))
  }
}
