@testable import Core
import Testing

final class MorseDataTests {
  @Test
  func mappingsAreCorrect() {
    let morse = MorseData()

    #expect(morse.morseTable[Character("A")] == ".-")
    #expect(morse.morseTable[Character("1")] == ".----")
    #expect(morse.morseTable[Character(" ")] == "/")
  }
}
