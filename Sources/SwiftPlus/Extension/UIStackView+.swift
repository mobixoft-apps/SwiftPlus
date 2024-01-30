//
//  UIStackView+.swift
//  
//
//  Created by Yusuf Uzan on 9.01.2023.
//

#if canImport(UIKit)
import UIKit

public extension UIStackView {
  
  @discardableResult
  func horizontal(
    spacing: CGFloat = 0,
    alignment: Alignment = .fill,
    distribution: Distribution = .fill) -> Self {
      build {
        $0.axis = .horizontal
        $0.spacing = spacing
        $0.alignment = alignment
        $0.distribution = distribution
      }
    }
  
  @discardableResult
  func vertical(
    spacing: CGFloat = 0,
    alignment: Alignment = .fill,
    distribution: Distribution = .fill) -> Self {
      build {
        $0.axis = .vertical
        $0.spacing = spacing
        $0.alignment = alignment
        $0.distribution = distribution
      }
    }
  
  func addArrangedSubviews(_ views: UIView...) {
    for view in views {
      addArrangedSubview(view)
    }
  }
  
  func removeArrangedSubviews() {
    for view in arrangedSubviews {
      removeArrangedSubview(view)
    }
  }
  
  func addBackground(color: UIColor) {
    let subView = UIView(frame: bounds)
    subView.backgroundColor = color
    subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    insertSubview(subView, at: 0)
  }

}

#endif
