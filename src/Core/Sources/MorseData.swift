public struct MorseData {
  public let morseTable: [Character: String]

  public init() {
    morseTable = MorseTable.characterToMorse
  }
}
