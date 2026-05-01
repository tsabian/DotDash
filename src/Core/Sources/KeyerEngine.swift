import Foundation

public struct MorseTiming {
  public let unitDuration: TimeInterval

  public init(wpm: Double) {
    let safeWpm = max(wpm, 1)
    unitDuration = 1.2 / safeWpm
  }

  public func symbol(forPressDuration duration: TimeInterval) -> Character {
    duration < unitDuration * 2 ? "." : "-"
  }
}

public struct KeyerEngine {
  private let timing: MorseTiming

  public init(wpm: Double) {
    timing = MorseTiming(wpm: wpm)
  }

  public func symbol(forPressDuration duration: TimeInterval) -> Character {
    timing.symbol(forPressDuration: duration)
  }
}
