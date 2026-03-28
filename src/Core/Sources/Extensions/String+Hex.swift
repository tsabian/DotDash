//
//  String+Hex.swift
//  Core
//
//  Created by Tiago de Oliveira on 21/10/25.
//

import Foundation

extension String {
  func isValidHex() -> Bool {
    let hexRegEx = "[0-9a-fA-F]+"
    let hexPred = NSPredicate(format: "SELF MATCHES %@", hexRegEx)
    return hexPred.evaluate(with: self)
  }
}
