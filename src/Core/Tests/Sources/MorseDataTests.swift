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

  @Test
  func allAsciiLettersAreMapped() {
    let morse = MorseData()
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    for letter in letters {
      #expect(morse.morseTable[letter] != nil, "Missing mapping for letter: \(letter)")
    }
  }

  @Test
  func allDigitsAreMapped() {
    let morse = MorseData()
    let digits = "0123456789"
    for digit in digits {
      #expect(morse.morseTable[digit] != nil, "Missing mapping for digit: \(digit)")
    }
  }

  @Test
  func spaceIsMappedToSlash() {
    let morse = MorseData()
    #expect(morse.morseTable[Character(" ")] == "/")
  }

  @Test
  func tableIsNotEmpty() {
    let morse = MorseData()
    #expect(!morse.morseTable.isEmpty)
  }

  @Test
  func morseTableMatchesMorseTableEnum() {
    let morse = MorseData()
    #expect(morse.morseTable == MorseTable.characterToMorse)
  }
}
