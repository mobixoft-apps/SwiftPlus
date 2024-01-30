//
//  UISegmentedControl+.swift
//  
//
//  Created by Yusuf Uzan on 9.01.2023.
//

#if canImport(UIKit)
import UIKit

public extension UISegmentedControl {
  
  @discardableResult
  func setSegmentTitles(_ titles: [String]) -> Self {
    for index in 0..<titles.count {
      let title = titles[index]
      insertSegment(withTitle: title, at: index, animated: false)
    }
    return self
  }
  
}
#endif
