//
//  UIView+.swift
//  
//
//  Created by Yusuf Uzan on 9.01.2023.
//

#if canImport(UIKit)
import UIKit

public extension UIView {
  
  func pin(to: UILayoutGuide, insets: UIEdgeInsets = .zero)  {
    guard let _ = superview else {
      return
    }
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: to.topAnchor, constant: insets.top).isActive = true
    bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: -insets.bottom).isActive = true
    leftAnchor.constraint(equalTo: to.leftAnchor, constant: insets.left).isActive = true
    rightAnchor.constraint(equalTo: to.rightAnchor, constant: -insets.right).isActive = true
  }
  
  func pin(to: UIView, insets: UIEdgeInsets = .zero)  {
    guard let _ = superview else {
      return
    }
    translatesAutoresizingMaskIntoConstraints = false
    topAnchor.constraint(equalTo: to.topAnchor, constant: insets.top).isActive = true
    bottomAnchor.constraint(equalTo: to.bottomAnchor, constant: -insets.bottom).isActive = true
    leadingAnchor.constraint(equalTo: to.leadingAnchor, constant: insets.left).isActive = true
    trailingAnchor.constraint(equalTo: to.trailingAnchor, constant: -insets.right).isActive = true
  }
  
  func addSubviews(autoLayoutIsEnable: Bool = true, _ subviews: UIView...) {
    subviews.forEach {
      $0.translatesAutoresizingMaskIntoConstraints = !autoLayoutIsEnable
      addSubview($0)
    }
  }
  
  func roundCorners(corners: UIRectCorner, radius: CGFloat) {
    let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
    let mask = CAShapeLayer()
    mask.path = path.cgPath
    layer.mask = mask
  }
  
  func addTopShadow(shadowColor : UIColor, shadowOpacity : CGFloat, shadowRadius : CGFloat, offset:CGSize){
    self.layer.shadowColor = shadowColor.cgColor
    self.layer.shadowOffset = offset
    self.layer.shadowOpacity = Float(shadowOpacity)
    self.layer.shadowRadius = shadowRadius
    self.clipsToBounds = false
  }

  @discardableResult
  func addBlur(style: UIBlurEffect.Style = .extraLight, alpha: CGFloat = 1.0) -> UIVisualEffectView {
    let blurEffect = UIBlurEffect(style: style)
    let blurBackground = UIVisualEffectView(effect: blurEffect)
    addSubview(blurBackground)
    blurBackground.translatesAutoresizingMaskIntoConstraints = false
    blurBackground.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    blurBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
    blurBackground.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    blurBackground.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    blurBackground.alpha = alpha
    return blurBackground
  }
  
  func addBlackGradientLayerInForeground(frame: CGRect, colors:[UIColor]) {
    let gradient = CAGradientLayer()
    gradient.frame = frame
    gradient.colors = colors.map{$0.cgColor}
    self.layer.addSublayer(gradient)
  }

  func addBlackGradientLayerInBackground(frame: CGRect, colors:[UIColor]) {
    let gradient = CAGradientLayer()
    gradient.frame = frame
    self.layer.backgroundColor = UIColor.clear.cgColor
    gradient.colors = colors.map{$0.cgColor}
    self.layer.insertSublayer(gradient, at: 0)
  }
 
  class func fromNib<T: UIView>() -> T {
    return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
  }
}

#endif
