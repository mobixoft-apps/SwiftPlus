//
//  UITableView+.swift
//  
//
//  Created by Yusuf Uzan on 9.01.2023.
//

#if canImport(UIKit)
import UIKit

public extension UITableView {
  
  func dequeReusebleCell<T: UITableViewCell>(
    type: T.Type,
    indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.className, for: indexPath) as? T else {
      fatalError("dequeReusebleCell error")
    }
    return cell
  }
  
  func dequeReusebleView<T: UITableViewHeaderFooterView>(type: T.Type) -> T {
    guard let cell = dequeueReusableHeaderFooterView(withIdentifier: type.className) as? T else {
      fatalError("dequeReusebleView error")
    }
    return cell
  }
  
  @discardableResult
  func registerCell<T: UITableViewCell>(_ cell: T.Type) -> UITableView {
    register(cell, forCellReuseIdentifier: cell.className)
    return self
  }
  
  @discardableResult
  func registerView<T: UITableViewHeaderFooterView>(_ view: T.Type) -> UITableView {
    register(view, forHeaderFooterViewReuseIdentifier: view.className)
    return self
  }
  
}
#endif
