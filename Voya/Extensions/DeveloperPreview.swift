//
//  DeveloperPreview.swift
//  Voya
//
//  Created by Chaira Harder on 6/15/25.
//

import Foundation


/* FOR MOCK DATA */

class DeveloperPreview {
    
    static let shared = DeveloperPreview()
    
    var listings: [Listing] = [
    
        // ALLIYAH NYC
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Alliyah Logan",
            ownerImageUrl: "alliyah-profile-photo",
            numberOfBedrooms: 3,
            numberOfBathrooms: 2,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 2200,
            latitude: 40.7282,
            longitude: -73.7949,
            imageURLs: ["nyc-1", "nyc-2", "nyc-3"],
            address: "123 Main St",
            city: "New York City",
            state: "New York",
            title: "Townhouse in Queens, NY",
            rating: 21,
            features: [.threemonths, .sublease],
            amenities: [.wifi, .alarmSystem, .balcony, .transportation, .school],
            type: .townHouse
        ),
        // LILY DC
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Liliana Hetherman",
            ownerImageUrl: "liliana-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 2,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 1800,
            latitude: 38.9072,
            longitude: -77.0369,
            imageURLs: ["dc-1", "dc-2", "dc-3"],
            address: "123 Main St",
            city: "Washington",
            state: "D.C.",
            title: "Villa in DC",
            rating: 28,
            features: [.sublease, .monthtomonth],
            amenities: [.wifi, .park, .laundry, .dishwasher, .transportation],
            type: .villa
        ),
        // LILY northampton
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Liliana Hetherman",
            ownerImageUrl: "liliana-profile-photo",
            numberOfBedrooms: 7,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 1100,
            latitude: 42.3251,
            longitude: -72.6412,
            imageURLs: ["northampton-1", "northampton-2"],
            address: "123 Main St",
            city: "Northampton",
            state: "Massachusetts",
            title: "House in Northampton",
            rating: 12,
            features: [.monthtomonth, .threemonths, .oneyear],
            amenities: [.balcony, .dishwasher, .furnished, .laundry, .school, .park],
            type: .apartment
        ),
        // SIAN LA
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Sian Baraket",
            ownerImageUrl: "sian-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 2950,
            latitude: 34.0549,
            longitude: -118.2426,
            imageURLs: ["losangeles-1", "losangeles-2", "losangeles-3"],
            address: "123 Main St",
            city: "Los Angeles",
            state: "California",
            title: "Studio in LA",
            rating: 8,
            features: [.threemonths, .oneyear],
            amenities: [.alarmSystem, .balcony, .garage, .airconditioner],
            type: .studio
        ),
        // GAV MICHIGAN
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Gavriella Harder",
            ownerImageUrl: "gavee-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 1600,
            latitude: 42.7325,
            longitude: -84.5555,
            imageURLs: ["michigan-1", "michigan-2"],
            address: "123 Main St",
//            city: "Montréal",
            city: "Lancing",
            state: "Michigan",
            title: "House in Michigan",
            rating: 5,
            features: [.oneyear],
            amenities: [.garage, .balcony, .park, .pool, .school],
            type: .house
        ),
        // GAV MIAMI
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Gavriella Harder",
            ownerImageUrl: "gavee-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 1900,
            latitude: 25.7602,
            longitude: -80.1936,
            imageURLs: ["miami-1", "miami-2","miami-3"],
            address: "123 Main St",
//            city: "Montréal",
            city: "Miami",
            state: "Florida",
            title: "Apartment in Miami",
            rating: 10,
            features: [.monthtomonth, .threemonths, .oneyear],
            amenities: [.wifi, .balcony, .laundry, .pool, .furnished, .airconditioner, .dishwasher],
            type: .apartment
        ),
        // CHAI MILFORD
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Gavriella Harder",
            ownerImageUrl: "gavee-profile-photo",
            numberOfBedrooms: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 1200,
            latitude: 41.2223,
            longitude: -73.0565,
            imageURLs: ["milford-1", "milford-2","milford-3"],
            address: "123 Main St",
//            city: "Montréal",
            city: "Milford",
            state: "Connecticut",
            title: "Villa in Milford",
            rating: 1,
            features: [.monthtomonth, .oneyear],
            amenities: [.alarmSystem, .dishwasher, .park],
            type: .villa
        )
    
    
    ]
    
}
