//
//  ListingDetailView.swift
//  Voya
//
//  Created by Chaira Harder on 6/14/25.
//

import SwiftUI
import MapKit

struct ListingDetailView: View {
    
    
    @Environment(\.dismiss) var dismiss
    let listing: Listing
    @State private var cameraPosition: MapCameraPosition
    
    init(listing: Listing) {
        self.listing = listing
        
        let region = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude),
            span: MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
        )

        
        self._cameraPosition = State(initialValue: .region(region))
    }
    
    var body: some View {
        
        let wohnaDark = Color(red: 39/255, green: 27/255, blue: 77/255)
        let wohnaLight = Color(red: 203/255, green: 195/255, blue: 227/255)
        let wohnaClick = Color(red: 160/255, green: 80/255, blue: 235/255)
        
        
        ScrollView {
            
            ZStack(alignment: .topLeading) { // Could have alternatively overlayed this, like below.
                ListingImageCarouselView(listing: listing)
                    .frame(height: 320)
                
                // TODO: Test and adjust back button positioning...
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .foregroundStyle(.black)
                        .background {
                            Circle()
                                .fill(.white)
                                .frame(width: 32, height: 32)
                        }
                        .padding(32)
                }
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text(listing.title)
                    .font(.title)
                    .fontWeight(.semibold)
                
                VStack(alignment: .leading) {
                    
                    // TODO: clean up rating feature. make reusable.
                    // also found in ListingItemView.
                    HStack(spacing: 2) {
                        Image(systemName: "heart.fill").foregroundStyle(wohnaClick)
                        
                        Text("\(listing.rating) people interested")
                        
                        Text(" - ")
                        
                        Text("4 people on tour list")
                            . underline()
                            .fontWeight(.semibold)
                        
//                        Image(systemName: "location.fill")
//                        
//                        Text("Based in NYC")
//                        
//                        Text(" - ")
//                        
//                        Text("9 international trips this year")
//                            . underline()
//                            .fontWeight(.semibold)
                    }
                    .foregroundStyle(.black)
                    
                    Text("\(listing.city), \(listing.state)")
                }
                .font(.caption)
            }
            .padding(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Divider()
                .background(wohnaLight)
            
            // Host info view
            
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Full \(listing.type.description) posted by \(listing.ownerName)")
                        .font(.headline)
                        .frame(width: 250, alignment: .leading)
                    
                    HStack(spacing: 2) {
                        Text("With \(listing.numberOfBedrooms) bedrooms, ")
//                        Text("\(listing.numberOfGuests) guests - ")
//                        Text("\(listing.numberOfBeds) beds - ")
                        Text("\(listing.numberOfBathrooms) baths")
                    }
                    .font(.caption)
                    
                }
                .frame(width: 300, alignment: .leading)
                
                Spacer()
                
                Image(listing.ownerImageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
            }
            .padding()
            
            
//            Divider()
//                .background(wohnaLight)
            
            /* --- start --- */
            // Listing features
            VStack(alignment: .leading, spacing: 16) {
                ForEach(listing.features) {feature in
                    HStack(spacing: 12) {
                        Image(systemName: feature.imageName)
                        
                        VStack(alignment: .leading) {
                            Text(feature.title)
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text(feature.subtitle)
                                . font(.caption)
                                .foregroundStyle(.gray)
                        }
                        
                        Spacer()
                        
                    }
                    
                }
            }
//            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading) // or use Spacer on HStack
            .padding()
            
//            Divider()
            /*--- end ---*/
            
            // Listing Ammenities
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Perks on perks")
                    .font(.headline)
                
                ForEach(listing.amenities) { amenity in
                    HStack {
                        Image(systemName: amenity.imageName)
                            .frame(width: 32)
                        
                        Text(amenity.title)
                            .font(.footnote)
                        
                        Spacer()
                    }
                }
            }
            .padding()
            
            
            Divider()
                .background(wohnaLight)
            
            // Map
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Satellite POV of where you'll live")
                    .font(.headline)
                
                Map(position: $cameraPosition) {
                    Annotation("Listing Location", coordinate: CLLocationCoordinate2D(latitude: listing.latitude, longitude: listing.longitude)) {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundStyle(.purple)
                            .font(.title)
                    }
                }
                .frame(height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            }
            .padding()
            
            
            Divider()
                .background(wohnaLight)
            
            // Bedrooms view
            
            VStack(alignment: .leading, spacing: 16) {
//                Text("Where you'll sleep")
                Text("Wanna see some other places nearby?")
                    .font(.headline)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1 ... listing.numberOfBedrooms, id: \.self) { bedroom in
                            VStack {
                                Image(systemName: "house.fill")
                                
                                Text("Place \(bedroom)")
                            }
                            .frame(width: 132, height: 100)
                            .overlay {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                }
                .scrollTargetBehavior(.paging) // Comment this out for free-form scrolling.
            }
            .padding()
            
        }
        .toolbar(.hidden, for: .tabBar)
        .ignoresSafeArea()
        .padding(.bottom, 64)
        .overlay(alignment: .bottom) {
            VStack {
                Divider()
                    .padding(.bottom)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("$\(listing.pricePerNight)")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
//                        Text("Total before taxes")
                        Text("Monthly, including amenities")
                            .font(.footnote)
                        
//                        Text("Start renting as soon as")
//                            .font(.footnote)
//                            .fontWeight(.semibold)
//                            .underline()
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Get your tour")
                            .foregroundStyle(.white)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .frame(width: 140, height: 40)
                            .background(wohnaClick)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                }
                .padding(.horizontal, 32)
            }
            .background(.white)
        }
        
        
        
    }
}

#Preview {
    ListingDetailView(listing: DeveloperPreview.shared.listings[0])
}
