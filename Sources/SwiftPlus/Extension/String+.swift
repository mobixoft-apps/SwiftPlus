//
//  File.swift
//  
//
//  Created by Yusuf Uzan on 10.05.2023.
//

import Foundation
import CommonCrypto

#if canImport(UIKit)
import UIKit
public extension String {
  
  func md5ToHexString() -> String {
    let length = Int(CC_MD5_DIGEST_LENGTH)
    let messageData = self.data(using:.utf8)!
    var digestData = Data(count: length)
    _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
      messageData.withUnsafeBytes { messageBytes -> UInt8 in
        if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
          let messageLength = CC_LONG(messageData.count)
          CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
        }
        return 0
      }
    }
    return digestData.map { String(format: "%02hhx", $0) }.joined()
  }
 
  func widthOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.width
  }
  
  func heightOfString(usingFont font: UIFont) -> CGFloat {
    let fontAttributes = [NSAttributedString.Key.font: font]
    let size = self.size(withAttributes: fontAttributes)
    return size.height
  }
  
  func sizeOfString(usingFont font: UIFont) -> CGSize {
    let fontAttributes = [NSAttributedString.Key.font: font]
    return self.size(withAttributes: fontAttributes)
  }
  
  func toURL() -> URL? {
    if let url = URL(string: self) {
      if UIApplication.shared.canOpenURL(url) {
        return url
      }
    }
    return nil
  }

}
#endif



public extension String {
  
  private func compare(toVersion targetVersion: String) -> ComparisonResult {
    let versionDelimiter = "."
    var result: ComparisonResult = .orderedSame
    var versionComponents = components(separatedBy: versionDelimiter)
    var targetComponents = targetVersion.components(separatedBy: versionDelimiter)
    while versionComponents.count < targetComponents.count {
      versionComponents.append("0")
    }
    while targetComponents.count < versionComponents.count {
      targetComponents.append("0")
    }
    for (version, target) in zip(versionComponents, targetComponents) {
      result = version.compare(target, options: .numeric)
      if result != .orderedSame {
        break
      }
    }
    return result
  }
  
  func `is`(lessThan targetVersion: String) -> Bool {
    compare(toVersion: targetVersion) == .orderedAscending
  }
  
}
