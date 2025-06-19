//
//  Regions.swift
//  Voya
//
//  Created by Chaira Harder on 6/15/25.
//

//import Foundation
import CoreLocation

extension CLLocationCoordinate2D {
    static var losAngeles = CLLocationCoordinate2D(latitude: 34.0549, longitude: -118.2426)
    static var miami = CLLocationCoordinate2D(latitude: 25.7602, longitude: -80.1959)
    static var lansing = CLLocationCoordinate2D(latitude: 42.7325, longitude: -84.5555)
    static var milford = CLLocationCoordinate2D(latitude: 41.2223, longitude: -73.0565)
    static var northampton = CLLocationCoordinate2D(latitude: 42.3251, longitude: -72.6412)
    static var washingtonDC = CLLocationCoordinate2D(latitude: 38.9072, longitude: -77.0369)
    static var queens = CLLocationCoordinate2D(latitude: 40.7282, longitude: -73.7949)
}


func coordinate(for city: String) -> CLLocationCoordinate2D? {
    switch city.lowercased() {
    case "los angeles":
        return .losAngeles
    case "miami":
        return .miami
    case "lansing", "lansing, michigan":
        return .lansing
    case "milford", "milford, ct", "milford ct":
        return .milford
    case "northampton", "northampton, ma", "northampton ma":
        return .northampton
    case "washington", "dc", "washington dc":
        return .washingtonDC
    case "queens", "queens ny":
        return .queens
    default:
        return nil
    }
}
