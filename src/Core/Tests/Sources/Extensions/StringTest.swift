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
}
