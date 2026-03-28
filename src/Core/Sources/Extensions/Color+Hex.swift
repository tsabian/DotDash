//
//  Color+Hex.swift
//  Core
//
//  Created by Tiago de Oliveira on 21/10/25.
//

import Foundation
import SwiftUI
#if canImport(UIKit)
  import UIKit
#endif

extension Color {
  init(hex: String) {
    let fullOpacity = 255.0
    let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var hexInt: UInt64 = 0
    Scanner(string: hexString).scanHexInt64(&hexInt)
    let red, green, blue, alpha: UInt64
    let hexStringLength = hexString.count
    switch hexStringLength {
    case 3:
      let factor = 17
      red = (hexInt >> 8) * UInt64(factor)
      green = ((hexInt >> 4) & 0xF) * UInt64(factor)
      blue = (hexInt & 0xF) * UInt64(factor)
      alpha = UInt64(fullOpacity)
    case 6:
      red = hexInt >> 16
      green = (hexInt >> 8) & 0xFF
      blue = hexInt & 0xFF
      alpha = UInt64(fullOpacity)
    case 8:
      red = hexInt >> 24
      green = (hexInt >> 16) & 0xFF
      blue = (hexInt >> 8) & 0xFF
      alpha = hexInt & 0xFF
    default:
      red = 0
      green = 0
      blue = 0
      alpha = 1
    }
    self.init(
      .sRGB,
      red: Double(red) / 255.0,
      green: Double(green) / 255.0,
      blue: Double(blue) / 255.0,
      opacity: Double(alpha) / 255.0
    )
  }

  /**
   *  Retorna a cor em formato hexadecimal
   */
  var hex: String {
    #if canImport(UIKit)
      let uiColor = UIColor(self)
      var red: CGFloat = 0
      var green: CGFloat = 0
      var blue: CGFloat = 0
      var alpha: CGFloat = 0
      uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
      return writeHex(red, green, blue, alpha)
    #else
      guard let components = cgColor?.components else { return "#000000FF" }
      let red = Float(components[0])
      let green = Float(components[1])
      let blue = Float(components[2])
      let alpha = Float(components[3])
      return writeHex(red, green, blue, alpha)
    #endif
  }

  private func writeHex(_ red: CGFloat,
                        _ green: CGFloat,
                        _ blue: CGFloat,
                        _ alpha: CGFloat) -> String
  {
    String(format: "#%02X%02X%02X%02X", Int(red) * 255, Int(green) * 255,
           Int(blue) * 255, Int(alpha) * 255)
  }
}
