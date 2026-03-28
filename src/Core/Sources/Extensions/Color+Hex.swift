//
//  Color+Hex.swift
//  DotDashIOS
//
//  Created by Tiago de Oliveira on 21/10/25.
//

import Foundation
import SwiftUI

extension Color {
  init(hex: String) {
    var hex = hex
    let red, green, blue, alpha: UInt64
    let fullOpacity = 255.0
    if hex.isValidHex() {
      if hex.hasPrefix("#") {
        hex.remove(at: hex.startIndex)
      }
      let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
      var hexInt: UInt64 = 0
      Scanner(string: hexString).scanHexInt64(&hexInt)
      let hexStringLength = hexString.count
      switch hexStringLength {
      case 3: // RGB (12-bit)
        let factor = 17 // Para converter 4 bits em 8 bits, multiplicamos por 17
        red = (hexInt >> 8) * UInt64(factor)
        green = ((hexInt >> 4) & 0xF) * UInt64(factor)
        blue = (hexInt & 0xF) * UInt64(factor)
        alpha = UInt64(fullOpacity)
      case 6: // RGB (24-bit)
        red = hexInt >> 16
        green = (hexInt >> 8) & 0xFF
        blue = hexInt & 0xFF
        alpha = UInt64(fullOpacity)
      case 8: // RGBA (32-bit)
        red = hexInt >> 24
        green = (hexInt >> 16) & 0xFF
        blue = (hexInt >> 8) & 0xFF
        alpha = hexInt & 0xFF
      default:
        (red, green, blue, alpha) = (255, 255, 255, 255)
      }
    } else {
      (red, green, blue, alpha) = (255, 255, 255, 255)
    }
    self.init(
      .sRGB,
      red: Double(red) / 255.0,
      green: Double(green) / 255.0,
      blue: Double(blue) / 255.0,
      opacity: Double(alpha) / 255.0
    )
  }

  var hex: String {
    let uiColor = UIColor(self)
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    return String(format: "#%02X%02X%02X%02X", Int(red) * 255, Int(green) * 255, Int(blue) * 255, Int(alpha) * 255)
  }
}
