//
//  ColorTest.swift
//  Core
//
//  Created by Tiago de Oliveira on 21/10/25.
//

@testable import Core
import SwiftUI
import Testing

struct ColorTest {
  @Test func hexColorTest() {
    let expectedColor = Color.white
    let actualColor = Color(hex: "#FFFFFF")
    #expect(actualColor == expectedColor)
  }

  @Test func hexNonWhiteTest() {
    let expected = Color(red: 1, green: 0, blue: 0)
    let actual = Color(hex: "#FF0000")
    #expect(actual.hex == expected.hex)
  }

  @Test func hexRoundtrip6Digits() {
    let input = "#123456"
    let c = Color(hex: input)
    #expect(c.hex == "#123456FF")
  }

  @Test func hexRoundtrip3Digits() {
    let input = "#0F8"
    let c = Color(hex: input)
    #expect(c.hex == "#00FF88FF")
  }

  @Test func hexRoundtrip8DigitsWithAlpha() {
    let input = "#11223344"
    let c = Color(hex: input)
    #expect(c.hex == "#11223344")
  }

  @Test func hexWithoutHashHandlesInput() {
    let input = "ABCDEF"
    let c = Color(hex: input)
    #expect(c.hex == "#ABCDEFFF")
  }

  @Test func hexLowercaseInputNormalizesToUppercaseHex() {
    let input = "#abcdef"
    let c = Color(hex: input)
    #expect(c.hex == "#ABCDEFFF")
  }

  @Test func hexTrimsOuterNonAlphanumericCharacters() {
    let input = " #123456 "
    let c = Color(hex: input)
    #expect(c.hex == "#123456FF")
  }

  @Test func hexInvalidCharactersFallBackToOpaqueBlack() {
    let input = "#12G456"
    let c = Color(hex: input)
    #expect(c.hex == "#000000FF")
  }

  @Test func hexEmptyInputFallsBackToOpaqueBlack() {
    let c = Color(hex: "")
    #expect(c.hex == "#000000FF")
  }

  @Test func hexUnsupportedLengthFallsBackToOpaqueBlack() {
    let c = Color(hex: "#12345")
    #expect(c.hex == "#000000FF")
  }

  @Test func hexPropertyIncludesAlphaChannel() {
    let c = Color(.sRGB, red: 0x12 / 255.0, green: 0x34 / 255.0, blue: 0x56 / 255.0, opacity: 0x78 / 255.0)
    #expect(c.hex == "#12345678")
  }

  @Test func hexPropertyRoundsComponentValues() {
    let c = Color(.sRGB, red: 0.5, green: 0.5, blue: 0.5, opacity: 0.5)
    #expect(c.hex == "#80808080")
  }
}
