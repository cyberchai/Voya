//
//  Listing.swift
//  Voya
//
//  Created by Chaira Harder on 6/15/25.
//

import Foundation

/* LISTING MODEL */


struct Listing: Identifiable, Codable, Hashable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBedrooms: Int
    let numberOfBathrooms: Int
    let numberOfGuests: Int
    let numberOfBeds: Int
    
    var pricePerNight: Int
    
    let latitude: Double
    let longitude: Double
    
    var imageURLs: [String]
    
    let address: String
    let city: String
    let state: String
    let title: String
    var rating: Int
    
    var features: [ListingFeatures]
    var amenities: [ListingAmenities]
    
    let type: ListingType
}

/* LISTING FEATURES */
enum ListingFeatures: Int, Codable, Identifiable, Hashable {
    case sublease
    case threemonths
    case oneyear
    case monthtomonth
    
    
    var imageName: String {
        switch self {
        case .sublease: return "signature"
        case .threemonths: return "3.square.fill"
        case .oneyear: return "1.square.fill"
        case .monthtomonth: return "calendar.circle.fill"
        }
    }
    
    
    var title: String {
        switch self {
        case .sublease: return "Sublease"
        case .threemonths: return "Lease for 3 months"
        case .oneyear: return "Lease for 1 year"
        case .monthtomonth: return "Month to Month"
        }
    }
    
    var subtitle: String {
        switch self {
        case .sublease: return "This place is a sublease. Dates may be more flexible."
        case .threemonths: return "This place has a 3-month lease option."
        case .oneyear: return "This place has a 1-year lease option."
        case .monthtomonth: return "This place has a month-to-month rent option."
        }
    }
    
    var id: Int { return self.rawValue }
}




/* LISTING AMENITIES */
enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case dishwasher
    case wifi
    case laundry
    case furnished
    case alarmSystem
    case transportation
    case park
    case school
    case balcony
    case airconditioner
    case garage
    
    var title: String {
        switch self {
        case .pool: return "Pool"
        case .dishwasher: return "Dishwasher"
        case .wifi: return "Wifi"
        case .laundry: return "Laundry"
        case .furnished: return "Fully Furnished"
        case .alarmSystem: return "Alarm System"
        case .transportation: return "Public Transportation Nearby"
        case .park: return "Park Nearby"
        case .school: return "School Nearby"
        case .balcony: return "Balcony"
        case .airconditioner: return "Air Conditioning"
        case .garage: return "Garage"
        }
    }
    
    var imageName: String {
        switch self {
        case .pool: return "figure.pool.swim"
        case .dishwasher: return "dishwasher"
        case .wifi: return "wifi"
        case .laundry: return "washer"
        case .furnished: return "sofa"
        case .alarmSystem: return "checkerboard.shield"
        case .transportation: return "tram"
        case .park: return "tree"
        case .school: return "figure.2.and.child.holdinghands"
        case .balcony: return "building"
        case .airconditioner: return "air.conditioner.horizontal"
        case .garage: return "door.garage.double.bay.closed"
        }
    }
    
    var id: Int { return self.rawValue }
}


enum ListingType: Int, Codable, Identifiable, Hashable {
    case apartment
    case house
    case townHouse
    case villa
    case studio
    
    var description: String {
        switch self {
        case .apartment: return "apartment"
        case .house: return "house"
        case .townHouse: return "town home"
        case .villa: return "villa"
        case .studio: return "studio"
        }
    }
    
    var id: Int { return self.rawValue }
}
