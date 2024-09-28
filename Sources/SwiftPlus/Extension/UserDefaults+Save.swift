//
//  File.swift
//  
//
//  Created by Yusuf Uzan on 28.09.2024.
//

import Foundation

public extension UserDefaults {
  /// Sets the codable value of the specified key.
  func write<Element: Codable>(_ value: Element, forKey key: String) {
    let data = try? JSONEncoder().encode(value)
    UserDefaults.standard.setValue(data, forKey: key)
  }
  
  /// Returns the codable value associated with the specified key.
  func read<Element: Codable>(forKey key: String) -> Element? {
    guard let data = UserDefaults.standard.data(forKey: key) else { return nil }
    let element = try? JSONDecoder().decode(Element.self, from: data)
    return element
  }
  
}
