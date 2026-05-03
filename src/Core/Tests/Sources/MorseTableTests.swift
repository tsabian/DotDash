@testable import Core
import Testing

struct MorseTableTests {
  @Test
  func characterToMorseCoversAllLetters() {
    let letters: [Character] = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
    for letter in letters {
      #expect(MorseTable.characterToMorse[letter] != nil, "Missing Morse for letter: \(letter)")
    }
  }

  @Test
  func characterToMorseCoversAllDigits() {
    let digits: [Character] = Array("0123456789")
    for digit in digits {
      #expect(MorseTable.characterToMorse[digit] != nil, "Missing Morse for digit: \(digit)")
    }
  }

  @Test
  func morseToCharacterIsExactInverseOfCharacterToMorse() {
    for (char, morse) in MorseTable.characterToMorse {
      let decoded = MorseTable.morseToCharacter[morse]
      #expect(decoded == char, "morseToCharacter[\"\(morse)\"] should be '\(char)' but got '\(String(describing: decoded))'")
    }
  }

  @Test
  func morseToCharacterAndCharacterToMorseHaveSameSize() {
    #expect(MorseTable.characterToMorse.count == MorseTable.morseToCharacter.count)
  }

  @Test
  func knownLetterMappings() {
    #expect(MorseTable.characterToMorse["A"] == ".-")
    #expect(MorseTable.characterToMorse["E"] == ".")
    #expect(MorseTable.characterToMorse["T"] == "-")
    #expect(MorseTable.characterToMorse["S"] == "...")
    #expect(MorseTable.characterToMorse["O"] == "---")
  }

  @Test
  func knownDigitMappings() {
    #expect(MorseTable.characterToMorse["0"] == "-----")
    #expect(MorseTable.characterToMorse["5"] == ".....")
    #expect(MorseTable.characterToMorse["9"] == "----.")
  }

  @Test
  func spaceCharacterMapsToSlash() {
    #expect(MorseTable.characterToMorse[" "] == "/")
    #expect(MorseTable.morseToCharacter["/"] == " ")
  }

  @Test
  func allMorseCodesAreUniqueStrings() {
    let values = Array(MorseTable.characterToMorse.values)
    let uniqueValues = Set(values)
    #expect(values.count == uniqueValues.count)
  }
}
