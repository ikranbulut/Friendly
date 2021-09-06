//
//  UIViewExtension.swift
//  Friendly
//
//  Created by Mac on 2.09.2021.
//

import UIKit

extension UIView {
  @IBInspectable
  var cornerRadius: CGFloat {
    get {
      return layer.cornerRadius
    } set {
      layer.cornerRadius = newValue
      layer.masksToBounds = newValue > 0
    }
  }
}
