//
//  File.swift
//  
//
//  Created by Yusuf Uzan on 18.01.2023.
//

#if canImport(UIKit)
import UIKit

public extension UITableView {
  
  func setMessage(_ message: String, font: UIFont = UIFont(name: "TrebuchetMS", size: 15)!, textColor: UIColor = UIColor.black) {
    let lblMessage = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
    lblMessage.text = message
    lblMessage.textColor = textColor
    lblMessage.numberOfLines = 0
    lblMessage.textAlignment = .center
    lblMessage.font = font
    lblMessage.sizeToFit()
    self.backgroundView = lblMessage
    self.separatorStyle = .none
  }
  
  func clearBackground() {
    self.backgroundView = nil
    self.separatorStyle = .singleLine
  }
}

#endif
