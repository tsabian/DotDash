import Foundation

public struct MorseEngine {
  public init() {}

  public func encode(_ text: String, separator: String = " ") -> String {
    text
      .uppercased()
      .compactMap { MorseTable.characterToMorse[$0] }
      .joined(separator: separator)
  }

  public func decode(_ morse: String) -> String {
    morse
      .split(separator: " ")
      .map(String.init)
      .compactMap { MorseTable.morseToCharacter[$0] }
      .map(String.init)
      .joined()
  }
}
