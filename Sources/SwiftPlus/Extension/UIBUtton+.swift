//
//  UIButton+.swift
//  
//
//  Created by Yusuf Uzan on 17.04.2023.
//

#if canImport(UIKit)
import UIKit
public extension UIButton {
  
  typealias Action = () -> Void
  
  var onTap: Action? {
    get {
      associatedObject(for: "onTapAction") as? Action
    }
    set {
      set(associatedObject: newValue, for: "onTapAction")
    }
  }
  
  @discardableResult
  func onTap(_ action: @escaping Action) -> Self {
    self.onTap = action
    addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
    return self
  }
  
  @objc func didTouchUpInside() {
    onTap?()
  }
  
  @discardableResult
  func cornerRadius(_ radius: CGFloat) -> Self {
    layer.cornerRadius = radius
    layer.masksToBounds = true
    return self
  }
  
  @discardableResult
  func makeCircular(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: UIColor) -> Self {
    self.layer.cornerRadius = cornerRadius
    self.clipsToBounds = true
    self.layer.borderWidth = borderWidth
    self.layer.borderColor = borderColor.cgColor
    return self
  }

}

#endif
