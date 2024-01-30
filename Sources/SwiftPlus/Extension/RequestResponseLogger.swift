//
//  RequestResponseLogger.swift
//  
//
//  Created by Yusuf Uzan on 13.05.2023.
//

import Foundation

public class RequestResponseLogger {
  
  public static func logWith(request: URLRequest?, data: Data?, response: URLResponse?, error: Error?) -> String {
    var fullMessage = ""
    let urlString = response?.url?.absoluteString
    let components = NSURLComponents(string: urlString ?? "")
    let path = "\(components?.path ?? "")"
    let query = "\(components?.query ?? "")"
    if let request = request {
      let method = request.httpMethod != nil ? "\(request.httpMethod!)": ""
      let host = "\(components?.host ?? "")"
      var requestLog = "\n\n-------------------- REQUEST --------------------\n"
      requestLog += "\(String(describing: urlString ?? ""))"
      requestLog += "\n\n"
      requestLog += "\(method) \(path)?\(query) HTTP/1.1\n"
      requestLog += "Host: \(host)\n"
      for (key,value) in request.allHTTPHeaderFields ?? [:] {
        requestLog += "\(key): \(value)\n"
      }
      if let body = request.httpBody{
        let bodyString = body.prettyPrintedJSONString ?? String(data: body, encoding: .utf8) ?? "Can't render body; not utf8 encoded";
        requestLog += "\(bodyString)\n"
      }
      requestLog += "---------------------------------------------------\n";
      fullMessage += requestLog
    }
    var responseLog = "\n-------------------- RESPONSE --------------------\n"
    if let urlString = urlString {
      responseLog += "\(urlString)"
      responseLog += "\n\n"
    }
    if let httpResponse = response as? HTTPURLResponse{
      responseLog += "HTTP \(httpResponse.statusCode) \(path)?\(query)\n"
    }
    if let host = components?.host{
      responseLog += "Host: \(host)\n"
    }
    for (key,value) in (response as? HTTPURLResponse)?.allHeaderFields ?? [:] {
      responseLog += "\(key): \(value)\n"
    }
    if let body = data{
      let bodyString = body.prettyPrintedJSONString ?? String(data: body, encoding: .utf8) ?? "Can't render body; not utf8 encoded";
      responseLog += "\(bodyString)\n"
    }
    if let error = error{
      responseLog += "\(error.debugDescription)\n"
    }
    responseLog += "----------------------------------------------------\n";
    fullMessage += responseLog
    return fullMessage
  }
}
