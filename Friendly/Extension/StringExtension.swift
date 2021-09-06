//
//  StringExtension.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import Foundation

extension String {
  func localized() -> String {
    return NSLocalizedString(self, comment: "")
  }
}
