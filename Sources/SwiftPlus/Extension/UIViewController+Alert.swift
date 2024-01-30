//
//  File.swift
//  
//
//  Created by Yusuf Uzan on 11.01.2023.
//

#if canImport(UIKit)
import UIKit

public extension UIViewController {
  
  @discardableResult
  func showAlert(
    title: String?,
    message: String?,
    buttonTitles: [String]? = nil,
    highlightedButtonIndex: Int? = nil,
    completion: ((Int) -> Void)? = nil,
    style: UIAlertController.Style = .alert,
    withCancel: Bool = false) -> UIAlertController {
      let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
      var allButtons = buttonTitles ?? [String]()
      if allButtons.count == 0 {
        allButtons.append("OK")
      }
      for index in 0..<allButtons.count {
        let buttonTitle = allButtons[index]
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: { _ in
          completion?(index)
        })
        alertController.addAction(action)
        // Check which button to highlight
        if let highlightedButtonIndex = highlightedButtonIndex, index == highlightedButtonIndex {
          alertController.preferredAction = action
        }
      }
      if withCancel {
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in })
        alertController.addAction(cancelAction)
      }

      DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: { [weak self] in
        self?.present(alertController, animated: true, completion: nil)
      })
      return alertController
    }
  
  func topMostViewController() -> UIViewController {
    if self.presentedViewController == nil {
      return self
    }
    if let navigation = self.presentedViewController as? UINavigationController {
      return navigation.visibleViewController!.topMostViewController()
    }
    if let tab = self.presentedViewController as? UITabBarController {
      if let selectedTab = tab.selectedViewController {
        return selectedTab.topMostViewController()
      }
      return tab.topMostViewController()
    }
    return self.presentedViewController!.topMostViewController()
  }
  
  func hideKeyboardWhenTappedAround() {
      let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
      tap.cancelsTouchesInView = false
      view.addGestureRecognizer(tap)
  }
  
  @objc func dismissKeyboard() {
      view.endEditing(true)
  }

}
#endif
