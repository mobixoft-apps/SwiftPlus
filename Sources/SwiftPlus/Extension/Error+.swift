//
//  Error+.swift
//  
//
//  Created by Yusuf Uzan on 13.05.2023.
//

import Foundation

public extension Error {
  
  var debugDescription: String {
    return "Type: \(String(describing: type(of: self)))\nDetail: \(String(describing: self))\nCode: \((self as NSError).code)\nDescription: \(localizedDescription)"
  }
  
}
