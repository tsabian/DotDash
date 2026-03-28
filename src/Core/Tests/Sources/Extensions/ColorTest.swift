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
}
