//
//  File.swift
//
//
//  Created by Yusuf Uzan on 29.08.2023.
//

#if canImport(UIKit)
import UIKit
public extension UIDevice {
  var hasNotch: Bool {
    if #available(iOS 11.0, *) {
      let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
      return keyWindow?.safeAreaInsets.bottom ?? 0 > 0
    }
    return false
  }
  
}
#endif
