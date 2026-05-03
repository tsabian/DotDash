@testable import Components
import Testing

final class ComponentsTests {
  @Test
  func componentsClassCanBeInstantiated() {
    let instance = Components()
    #expect(type(of: instance) == Components.self)
  }
}
