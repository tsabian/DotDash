//
//  StringTest.swift
//  Core
//
//  Created by Tiago de Oliveira on 21/10/25.
//

@testable import Core
import Testing

struct StringTest {
  @Test func isValidHexTest() {
    // Basic valid and invalid cases
    let validHex = "000000"
    #expect(validHex.isValidHex())

    let invalidHex = "ZZZZZZ"
    #expect(!invalidHex.isValidHex())

    // Edge cases: empty string
    let emptyHex = ""
    #expect(!emptyHex.isValidHex())

    // Edge cases: strings with special characters
    let specialCharHex = "12$%AB"
    #expect(!specialCharHex.isValidHex())

    // Edge cases: valid hex strings with uppercase letters
    let validUppercaseHex = "ABCDEF"
    #expect(validUppercaseHex.isValidHex())

    // Edge cases: valid hex strings with lowercase letters
    let validLowercaseHex = "abcdef"
    #expect(validLowercaseHex.isValidHex())

    // Edge cases: strings shorter than expected (e.g., less than 6 characters)
    let shortHex = "12345"
    #expect(!shortHex.isValidHex())

    // Edge cases: strings longer than expected (e.g., more than 6 characters)
    let longHex = "1234567"
    #expect(!longHex.isValidHex())

    // Edge cases: odd-length strings
    let oddLengthHex = "ABC"
    #expect(!oddLengthHex.isValidHex())
  }

  // MARK: - Hash-prefix variants

  @Test func hashWith3DigitsIsValid() {
    // "#" + 3 hex digits is a valid shorthand colour
    #expect("#FFF".isValidHex())
    #expect("#0A9".isValidHex())
  }

  @Test func hashWith6DigitsIsValid() {
    #expect("#ABCDEF".isValidHex())
    #expect("#123456".isValidHex())
  }

  @Test func hashWith8DigitsIsValid() {
    // 8-digit form includes an alpha channel
    #expect("#12345678".isValidHex())
    #expect("#AABBCCDD".isValidHex())
  }

  @Test func hashWith4DigitsIsInvalid() {
    // 4-digit length is not a recognised form
    #expect(!"#1234".isValidHex())
  }

  @Test func eightDigitsWithoutHashIsValid() {
    #expect("12345678".isValidHex())
    #expect("AABBCCDD".isValidHex())
  }

  @Test func whitespaceAroundHashIsTrimmedBeforeValidation() {
    // Leading/trailing whitespace should be ignored
    #expect(" #123456 ".isValidHex())
    #expect("\t#ABC\n".isValidHex())
  }

  @Test func hashWithInvalidCharactersIsInvalid() {
    #expect(!"#GG0000".isValidHex())
    #expect(!"#ZZZZZ".isValidHex())
  }

  @Test func bareThreeDigitStringWithoutHashIsInvalid() {
    // Without a "#" prefix, 3-digit forms are not accepted
    #expect(!"FFF".isValidHex())
    #expect(!"0A9".isValidHex())
  }
}
