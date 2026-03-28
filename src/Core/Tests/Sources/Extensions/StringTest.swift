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
    let validHex = "000000"
    #expect(validHex.isValidHex())
    let invalidHex = "ZZZZZZ"
    #expect(!invalidHex.isValidHex())
  }
}
