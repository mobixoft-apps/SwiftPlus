//
//  File.swift
//
//
//  Created by Yusuf Uzan on 9.06.2024.
//

import Foundation

public extension Encodable {
  func jsonData() throws -> Data {
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    encoder.dateEncodingStrategy = .iso8601
    return try encoder.encode(self)
  }
}
