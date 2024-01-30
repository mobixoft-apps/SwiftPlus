//
//  File.swift
//  
//
//  Created by Yusuf Uzan on 1.10.2023.
//

import Foundation

public extension UserDefaults {
  
  static func save<T: Codable>(_ object: T, forKey key: String) {
    let encoder = JSONEncoder()
    if let encodedObject = try? encoder.encode(object) {
      UserDefaults.standard.set(encodedObject, forKey: key)
      UserDefaults.standard.synchronize()
    }
  }
  
  static func getObject<T: Codable>(forKey key: String) -> T? {
    if let object = UserDefaults.standard.object(forKey: key) as? Data {
      let decoder = JSONDecoder()
      if let decodedObject = try? decoder.decode(T.self, from: object) {
        return decodedObject
      }
    }
    return nil
  }
  
}
