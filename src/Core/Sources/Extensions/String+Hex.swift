//
//  String+Hex.swift
//  Core
//
//  Created by Tiago de Oliveira on 21/10/25.
//

import Foundation

extension String {
  func isValidHex() -> Bool {
    let raw = trimmingCharacters(in: .whitespacesAndNewlines)
    let hasHash = raw.hasPrefix("#")
    let digits = hasHash ? String(raw.dropFirst()) : raw
    let len = digits.count
    let allowedLength: Bool = hasHash ? (len == 3 || len == 6 || len == 8) : (len == 6 || len == 8)
    if !allowedLength { return false }
    let hexSet = CharacterSet(charactersIn: "0123456789ABCDEFabcdef")
    return digits.unicodeScalars.allSatisfy { hexSet.contains($0) }
  }
}
