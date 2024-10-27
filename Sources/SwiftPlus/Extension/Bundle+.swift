//
//  File 2.swift
//  
//
//  Created by Yusuf Uzan on 30.09.2023.
//

import Foundation

public extension Bundle {
  var versionNumber: String {
    return infoDictionary?["CFBundleShortVersionString"] as? String ?? "0"
  }
  var buildNumber: String {
    return infoDictionary?["CFBundleVersion"] as? String ?? "0"
  }
}
