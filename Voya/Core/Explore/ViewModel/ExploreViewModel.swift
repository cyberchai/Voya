//
//  ExploreViewModel.swift
//  Voya
//
//  Created by Chaira Harder on 6/15/25.
//

import Foundation
//import Fuse

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var searchLocation = ""
    private let service: ExploreService
    private var listingsCopy = [Listing]() // so we have all original listings set after filter
    
    init(service: ExploreService) {
        self.service = service
        
        Task { await fetchListings() }
    }
    
    /* An async func is suspendable. Uses await to pause execution to free thread and resume later */
    func fetchListings() async {
        do {
            self.listings = try await service.fetchListings()
            self.listingsCopy = listings
        } catch {
            print("DEBUG: Failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    /* ORIGINAL FUNCTION V0 */
//    func updateListingsForLocation() {
//        let filteredListings = listings.filter({
//            
//            $0.city.lowercased().contains(searchLocation.lowercased()) ||
//            $0.city.lowercased().contains(searchLocation.lowercased()) ||
//            $0.city.lowercased() == searchLocation.lowercased() ||
//            $0.state.lowercased() == searchLocation.lowercased()
//        })
//        
//        self.listings = filteredListings.isEmpty ? listingsCopy: filteredListings
//        
//    }
    
    // V1
    /* TODO: THIS IS CURRRENTLY NOT WORKING -- WILL COME BACK TO IT */
    /* https://github.com/krisk/fuse-swift?tab=readme-ov-file */
    // Fuzzy power query using Fuse
    /*
    func updateListingsForLocation() {
        let fuse = Fuse()
        let normalizedSearch = searchLocation.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)

        let filteredListings = listings.filter { listing in
            let city = listing.city.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
            let state = listing.state.folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)

            // Fuzzy match score is optional (nil if no match)
            let cityMatch = fuse.search(pattern: normalizedSearch, in: city) != nil
            let stateMatch = fuse.search(pattern: normalizedSearch, in: state) != nil

            return cityMatch || stateMatch
        }

        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
     */
    
    
    // V2
    /**/
    func updateListingsForLocation() {
        func normalize(_ string: String) -> String {
            return string
                .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
                .components(separatedBy: CharacterSet.alphanumerics.inverted)
                .joined()
        }

        let normalizedSearch = normalize(searchLocation)

        let filteredListings = listings.filter {
            let city = normalize($0.city)
            let state = normalize($0.state)

            return city.contains(normalizedSearch) ||
                   city == normalizedSearch ||
                   state == normalizedSearch
        }

        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
    /**/
    
    // No external libraries -- V3 -- improve later. TODO: fix fatal error. Thread 1: Range requires lowerBound <= uppserBound for j in 1 ...b.count
//    func updateListingsForLocation() {
//        func normalize(_ string: String) -> String {
//            string
//                .folding(options: [.diacriticInsensitive, .caseInsensitive], locale: .current)
//                .replacingOccurrences(of: "[^a-zA-Z0-9\\s]", with: "", options: .regularExpression)
//                .lowercased()
//        }
//
//        func levenshtein(_ a: String, _ b: String) -> Int {
//            let a = Array(a)
//            let b = Array(b)
//            var dist = Array(repeating: Array(repeating: 0, count: b.count + 1), count: a.count + 1)
//
//            for i in 0...a.count { dist[i][0] = i }
//            for j in 0...b.count { dist[0][j] = j }
//
//            for i in 1...a.count {
//                for j in 1...b.count {
//                    dist[i][j] = a[i - 1] == b[j - 1]
//                        ? dist[i - 1][j - 1]
//                        : min(dist[i - 1][j] + 1, dist[i][j - 1] + 1, dist[i - 1][j - 1] + 1)
//                }
//            }
//            return dist[a.count][b.count]
//        }
//
//        let normalizedSearch = normalize(searchLocation)
//
//        let filteredListings = listings.filter { listing in
//            let cityWords = normalize(listing.city).split(separator: " ")
//            let stateWords = normalize(listing.state).split(separator: " ")
//            let allWords = cityWords + stateWords
//
//            for word in allWords {
//                if word.contains(normalizedSearch) || normalizedSearch.contains(word) {
//                    return true
//                }
//
//                let distance = levenshtein(String(word), normalizedSearch)
//                if distance <= 2 { // allow up to 2 edits for fuzzy match
//                    return true
//                }
//            }
//
//            return false
//        }
//
//        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
//    }
    
    
}
