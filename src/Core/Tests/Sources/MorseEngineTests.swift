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
}
