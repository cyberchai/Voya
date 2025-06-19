//
//  ExploreView.swift
//  Voya
//
//  Created by Chaira Harder on 6/14/25.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack {
            
            if showDestinationSearchView {
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
//                    .environmentObject(<#T##object: ObservableObject##ObservableObject#>)
            }else{
                
                // Placement for sticky search bar:
                // Put SearchAndFilterBar and ScrollView into a VStack
    //            SearchAndFilterBar()

                ScrollView {
                    
                    // Placement for relative search bar
                    SearchAndFilterBar(location: $viewModel.searchLocation)
                        .onTapGesture {
                            withAnimation(.snappy) {
                                showDestinationSearchView.toggle()
                            }
                        }
                    
                    
                    LazyVStack(spacing: 32) {
                        ForEach(viewModel.listings) { listing in
                            NavigationLink(value: listing) {
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    .padding()
                }
                .background(Color(red: 203/255, green: 195/255, blue: 227/255, opacity: 0.5))
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailView(listing: listing)
                        .navigationBarBackButtonHidden()
                }
                
            }
            
        }
        
        
    }
}

#Preview {
    ExploreView()
}
