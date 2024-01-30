//
//  File 2.swift
//  
//
//  Created by Yusuf Uzan on 30.09.2023.
//

import Foundation

public extension Bundle {
  var releaseVersionNumber: String? {
    return infoDictionary?["CFBundleShortVersionString"] as? String
  }
  var buildVersionNumber: String? {
    return infoDictionary?["CFBundleVersion"] as? String
  }
}
