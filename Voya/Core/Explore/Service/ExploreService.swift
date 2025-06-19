//
//  ExploreService.swift
//  Voya
//
//  Created by Chaira Harder on 6/15/25.
//

import Foundation

class ExploreService {
    func fetchListings() async throws -> [Listing] {
//        return DeveloperPreview().listings
        return DeveloperPreview.shared.listings
    }
}
