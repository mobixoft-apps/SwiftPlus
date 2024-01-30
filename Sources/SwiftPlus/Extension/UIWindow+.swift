//
//  UIWindow.swift
//  
//
//  Created by Yusuf Uzan on 22.05.2023.
//

#if canImport(UIKit)
import UIKit

public extension UIWindow {
  
  static var key: UIWindow? {
    if #available(iOS 13, *) {
      return UIApplication.shared.windows.first { $0.isKeyWindow }
    } else {
      return UIApplication.shared.keyWindow
    }
  }
  
}
#endif
