//
//  UIImageView+.swift
//  
//
//  Created by Yusuf Uzan on 6.05.2023.
//

#if canImport(UIKit)
import UIKit

public extension UIImageView {
  
  func load(url: String?, placeholder: UIImage? = nil, _ completion: (() -> Void)? = nil) {
    guard let urlString = url, let fullUrl = URL(string: urlString) else { return }
    let cache = URLCache.shared
    let request = URLRequest(url: fullUrl)
    if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
      DispatchQueue.main.async {
        self.image = image
        completion?()
      }
    } else {
      self.image = placeholder
      URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
        guard let data = data, let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode, let image = UIImage(data: data) else { return }
        let cachedData = CachedURLResponse(response: httpResponse, data: data)
        cache.storeCachedResponse(cachedData, for: request)
        DispatchQueue.main.async {
          self?.image = image
          completion?()
        }
      }.resume()
    }
  }
  
}
#endif
