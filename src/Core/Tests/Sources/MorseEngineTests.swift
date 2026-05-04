@testable import Core
import Testing

struct MorseEngineTests {
  @Test
  func encodeConvertsPlainTextToMorse() {
    let engine = MorseEngine()

    #expect(engine.encode("SOS") == "... --- ...")
    #expect(engine.encode("HELLO WORLD") == ".... . .-.. .-.. --- / .-- --- .-. .-.. -..")
  }

  @Test
  func decodeConvertsMorseToPlainText() {
    let engine = MorseEngine()

    #expect(engine.decode("... --- ...") == "SOS")
    #expect(engine.decode(".... . .-.. .-.. --- / .-- --- .-. .-.. -..") == "HELLO WORLD")
  }

  @Test
  func encodeEmptyStringReturnsEmpty() {
    let engine = MorseEngine()
    #expect(engine.encode("") == "")
  }

  @Test
  func decodeEmptyStringReturnsEmpty() {
    let engine = MorseEngine()
    #expect(engine.decode("") == "")
  }

  @Test
  func encodeLowercaseInputIsNormalisedToUppercase() {
    let engine = MorseEngine()
    #expect(engine.encode("sos") == engine.encode("SOS"))
  }

  @Test
  func encodeDigitsProducesCorrectMorse() {
    let engine = MorseEngine()
    #expect(engine.encode("0") == "-----")
    #expect(engine.encode("1") == ".----")
    #expect(engine.encode("9") == "----.")
    #expect(engine.encode("123") == ".---- ..--- ...--")
  }

  @Test
  func encodeSpaceCharacterProducesSlash() {
    let engine = MorseEngine()
    #expect(engine.encode("A B") == ".- / -...")
  }

  @Test
  func encodeSpecialCharactersProducesCorrectMorse() {
    let engine = MorseEngine()
    #expect(engine.encode(".") == ".-.-.-")
    #expect(engine.encode("?") == "..--..")
    #expect(engine.encode("@") == ".--.-.")
  }

  @Test
  func encodeWithCustomSeparatorJoinsWithProvidedString() {
    let engine = MorseEngine()
    #expect(engine.encode("SOS", separator: "|") == "...|---|...")
    #expect(engine.encode("AB", separator: "  ") == ".-  -...")
  }

  @Test
  func encodeSkipsUnknownCharacters() {
    let engine = MorseEngine()
    // Characters with no Morse mapping are silently dropped
    let result = engine.encode("A😀B")
    #expect(result == ".- -...")
  }

  @Test
  func decodeSkipsUnknownMorseSequences() {
    let engine = MorseEngine()
    // "......." has no mapping in the Morse table so it is silently dropped
    let result = engine.decode(".- ....... -...")
    #expect(result == "AB")
  }

  @Test
  func encodeThenDecodeIsIdentityForLetters() {
    let engine = MorseEngine()
    let original = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    let roundtrip = engine.decode(engine.encode(original))
    #expect(roundtrip == original)
  }

  @Test
  func encodeThenDecodeIsIdentityForDigits() {
    let engine = MorseEngine()
    let original = "0123456789"
    let roundtrip = engine.decode(engine.encode(original))
    #expect(roundtrip == original)
  }

  @Test
  func decodeSingleMorseSymbol() {
    let engine = MorseEngine()
    #expect(engine.decode(".-") == "A")
    #expect(engine.decode("-") == "T")
    #expect(engine.decode(".") == "E")
  }

  @Test
  func encodeProducesSingleTokenPerCharacter() {
    let engine = MorseEngine()
    let tokens = engine.encode("SOS").split(separator: " ")
    #expect(tokens.count == 3)
  }
}
