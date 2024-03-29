//
//  Collection+.swift
//  
//
//  Created by Yusuf Uzan on 15.08.2023.
//

import Foundation

public extension Collection {
  func unfoldSubSequences(limitedTo maxLength: Int) -> UnfoldSequence<SubSequence,Index> {
    sequence(state: startIndex) { start in
      guard start < self.endIndex else { return nil }
      let end = self.index(start, offsetBy: maxLength, limitedBy: self.endIndex) ?? self.endIndex
      defer { start = end }
      return self[start..<end]
    }
  }
}
