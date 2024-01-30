//
//  File.swift
//  
//
//  Created by Yusuf Uzan on 30.01.2024.
//

import Foundation

public extension URL {
  init(_ string: StaticString) {
    self.init(string: "\(string)")!
  }
}

public extension URL {
  func appendPath(_ string: String) -> Self {
    URL(string: string, relativeTo: self)!
  }
}
