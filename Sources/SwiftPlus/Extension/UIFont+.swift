//
//  UIFont+.swift
//  
//
//  Created by Yusuf Uzan on 20.05.2023.
//

#if canImport(UIKit)
import UIKit

extension UIFont {
  class func printFontNames() {
    for family in UIFont.familyNames {
      let fonts = UIFont.fontNames(forFamilyName: family)
      print("Family: ", family, "Font Names: ", fonts)
    }
  }
}
#endif
