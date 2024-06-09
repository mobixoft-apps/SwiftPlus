//
//  Location+Distance.swift
//
//
//  Created by Yusuf Uzan on 9.06.2024.
//

import CoreLocation

public extension CLLocationCoordinate2D {
  //distance in meters, as explained in CLLoactionDistance definition
  func distanceKM(from: CLLocationCoordinate2D) -> String {
    let destination = CLLocation(latitude: from.latitude, longitude: from.longitude)
    let toLocation = CLLocation(latitude: latitude, longitude: longitude)
    let difference = destination.distance(from: toLocation)
    return String(format: "%.02f KM", difference/1000.0)
  }
}

public extension CLLocation {
  class func distance(from: CLLocationCoordinate2D, to: CLLocationCoordinate2D) -> CLLocationDistance {
    let from = CLLocation(latitude: from.latitude, longitude: from.longitude)
    let to = CLLocation(latitude: to.latitude, longitude: to.longitude)
    return from.distance(from: to)
  }
}
