@testable import Core
import Testing

struct KeyerEngineTests {
  @Test
  func shortPressBecomesDot() {
    let engine = KeyerEngine(wpm: 20)

    #expect(engine.symbol(forPressDuration: 0.03) == ".")
  }

  @Test
  func longPressBecomesDash() {
    let engine = KeyerEngine(wpm: 20)

    #expect(engine.symbol(forPressDuration: 0.20) == "-")
  }

  @Test
  func timingUsesStandardWpmFormula() {
    let timing = MorseTiming(wpm: 20)

    #expect(abs(timing.unitDuration - 0.06) < 0.0001)
  }
}
