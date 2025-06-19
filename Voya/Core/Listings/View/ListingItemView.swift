//
//  ListingItemView.swift
//  Voya
//
//  Created by Chaira Harder on 6/14/25.
//

import SwiftUI

struct ListingItemView: View {
    
    let listing: Listing
    
    var body: some View {
        VStack(spacing: 8) {
            // images
            ListingImageCarouselView(listing: listing)
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        
            // listing details
            
            HStack(alignment: .top) {
                // details
                VStack(alignment: .leading) {
                    Text("\(listing.city), \(listing.state)")
//                    Text("Liliana Hetherman")
                        .fontWeight(.semibold)
//                        .foregroundStyle(.black)
                        .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                    
                    Text("Move in as early as")
//                    Text("Based in NYC")
//                        .foregroundStyle(.gray)
                        .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                    
                    Text("July 2")
//                    Text("9 international trips this year")
//                        .foregroundStyle(.gray)
                        .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                    
                    HStack(spacing: 4) {
                        Text("$\(listing.pricePerNight)")
                            .fontWeight(.semibold)
                        Text("/ month")
                    }
//                    .foregroundStyle(.black)
                    .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                    
                    
                }
                
                Spacer()
                
                
                // rating
                // TODO: clean up rating feature. make reusable.
                HStack(spacing: 2) {
//                    Image(systemName: "star.fill")
                    Image(systemName: "heart.fill")
                    
                    Text("\(listing.rating) \(listing.rating == 1 ? "person" : "people") interested")
                }
                .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                
            }
            .font(.footnote)
        }
//        .padding()
    }
}

#Preview {
    ListingItemView(listing: DeveloperPreview.shared.listings[0])
}
