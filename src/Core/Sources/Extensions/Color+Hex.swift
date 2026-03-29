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

@available(iOS 14.0, macOS 11.0, watchOS 6.0, tvOS 13.0, *)
extension Color {
  init(hex: String) {
    let fullOpacity: UInt64 = 255
    let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
    var hexInt: UInt64 = 0
    let scanner = Scanner(string: hexString)

    guard scanner.scanHexInt64(&hexInt), scanner.isAtEnd else {
      self.init(.sRGB, red: 0, green: 0, blue: 0, opacity: 1.0)
      return
    }

    var red: UInt64
    var green: UInt64
    var blue: UInt64
    var alpha: UInt64
    let hexStringLength = hexString.count

    switch hexStringLength {
    case 3:
      let factor: UInt64 = 17
      red = (hexInt >> 8) * factor
      green = ((hexInt >> 4) & 0xF) * factor
      blue = (hexInt & 0xF) * factor
      alpha = fullOpacity
    case 6:
      red = hexInt >> 16
      green = (hexInt >> 8) & 0xFF
      blue = hexInt & 0xFF
      alpha = fullOpacity
    case 8:
      red = hexInt >> 24
      green = (hexInt >> 16) & 0xFF
      blue = (hexInt >> 8) & 0xFF
      alpha = hexInt & 0xFF
    default:
      red = 0
      green = 0
      blue = 0
      alpha = fullOpacity
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
    var red: CGFloat = .zero
    var green: CGFloat = .zero
    var blue: CGFloat = .zero
    var alpha: CGFloat = .zero
    #if canImport(UIKit)
      let uiColor = UIColor(self)
      let cg = uiColor.cgColor
      if let sRGBSpace = CGColorSpace(name: CGColorSpace.sRGB),
         let converted = cg.converted(to: sRGBSpace, intent: .defaultIntent, options: nil),
         let comps = converted.components
      {
        switch comps.count {
        case 2:
          red = comps[0]
          green = comps[0]
          blue = comps[0]
          alpha = comps[1]
        case 3:
          red = comps[0]
          green = comps[1]
          blue = comps[2]
          alpha = 1.0
        default:
          red = comps[0]
          green = comps.count > 1 ? comps[1] : 0
          blue = comps.count > 2 ? comps[2] : 0
          alpha = comps.count > 3 ? comps[3] : 1.0
        }
        return writeHex(red, green, blue, alpha)
      } else {
        if uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha) {
          return writeHex(red, green, blue, alpha)
        }
        return "#000000FF"
      }
    #else
      guard let components = cgColor?.components else { return "#000000FF" }
      switch components.count {
      case 2:
        red = components[0]
        green = components[0]
        blue = components[0]
        alpha = components[1]
      case 3:
        red = components[0]
        green = components[1]
        blue = components[2]
        alpha = 1.0
      case 4...:
        red = components[0]
        green = components[1]
        blue = components[2]
        alpha = components[3]
      default:
        return "#000000FF"
      }
      return writeHex(red, green, blue, alpha)
    #endif
  }

  private func writeHex(_ red: CGFloat,
                        _ green: CGFloat,
                        _ blue: CGFloat,
                        _ alpha: CGFloat) -> String
  {
    String(format: "#%02X%02X%02X%02X", Int((red * 255).rounded()), Int((green * 255).rounded()),
           Int((blue * 255).rounded()), Int((alpha * 255).rounded()))
  }
}
