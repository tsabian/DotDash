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

  // MARK: - Boundary tests

  @Test
  func symbolJustBelowBoundaryIsDot() {
    // unitDuration at 20 wpm is 0.06s; boundary is 2 × 0.06 = 0.12s
    // A press strictly less than the boundary becomes a dot
    let engine = KeyerEngine(wpm: 20)
    let unit = MorseTiming(wpm: 20).unitDuration
    let justBelow = unit * 2 - 0.001
    #expect(engine.symbol(forPressDuration: justBelow) == ".")
  }

  @Test
  func symbolAtExactBoundaryIsDash() {
    // A press exactly equal to 2 × unitDuration is NOT strictly less, so it becomes a dash
    let engine = KeyerEngine(wpm: 20)
    let unit = MorseTiming(wpm: 20).unitDuration
    let atBoundary = unit * 2
    #expect(engine.symbol(forPressDuration: atBoundary) == "-")
  }

  @Test
  func symbolJustAboveBoundaryIsDash() {
    let engine = KeyerEngine(wpm: 20)
    let unit = MorseTiming(wpm: 20).unitDuration
    let justAbove = unit * 2 + 0.001
    #expect(engine.symbol(forPressDuration: justAbove) == "-")
  }

  // MARK: - WPM clamping

  @Test
  func zeroWpmClampsToOneWpm() {
    let timing = MorseTiming(wpm: 0)
    let expectedUnit = 1.2 / 1.0
    #expect(abs(timing.unitDuration - expectedUnit) < 0.0001)
  }

  @Test
  func negativeWpmClampsToOneWpm() {
    let timing = MorseTiming(wpm: -5)
    let expectedUnit = 1.2 / 1.0
    #expect(abs(timing.unitDuration - expectedUnit) < 0.0001)
  }

  @Test
  func veryHighWpmGivesShortUnitDuration() {
    let timing = MorseTiming(wpm: 100)
    #expect(abs(timing.unitDuration - 0.012) < 0.0001)
  }

  // MARK: - WPM-dependent symbol resolution

  @Test
  func symbolDependsOnConfiguredWpm() {
    // At 5 wpm, unit = 1.2 / 5 = 0.24s; boundary = 0.48s
    // A 0.20s press is below the boundary, so it's a dot at 5 wpm
    // but was a dash at 20 wpm (boundary 0.12s)
    let slow = KeyerEngine(wpm: 5)
    let fast = KeyerEngine(wpm: 20)
    let duration: TimeInterval = 0.20
    #expect(slow.symbol(forPressDuration: duration) == ".")
    #expect(fast.symbol(forPressDuration: duration) == "-")
  }
}
