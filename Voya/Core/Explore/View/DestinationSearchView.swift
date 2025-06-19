//
//  DestinationSearchView.swift
//  Voya
//
//  Created by Chaira Harder on 6/14/25.
//

import SwiftUI

// This is a MUCH cleaner version for using bool states
// much more scalable
enum DestinationSearchOptions {
    case location
    case dates
    case guests
}

struct DestinationSearchView: View {
    @Binding var show: Bool
    @ObservedObject var viewModel: ExploreViewModel
    
//    @State private var destination = ""
    @State private var selectedOption: DestinationSearchOptions = .location
    @State private var startDate = Date()
    @State private var endDate = Date()
    @State private var numGuests = 0
    
    // TODO: Make more efficient colour asset
    let voyaBlue = Color(red: 0/255, green: 74/255, blue: 173/255)
    
    var body: some View {
        VStack() {
            HStack {
                Button {
                    withAnimation(.snappy) {
                        viewModel.updateListingsForLocation()
                        show.toggle()
                    }
                } label: {
                    Image(systemName: "xmark.circle")
                        .imageScale(.large)
                        .foregroundStyle(.black)
                }
                
                Spacer()
                
                if !viewModel.searchLocation.isEmpty {
                    Button("Clear") {
                        viewModel.searchLocation = ""
                        viewModel.updateListingsForLocation()
                    }
                    .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
            .padding()
            
            
            
            VStack(alignment :.leading) {
                if selectedOption == .location {
                    Text("Where to?")
                        .font(.title2)
                        .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                        .fontWeight(.semibold)
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .imageScale(.small)
                        
                        TextField("Search places", text: $viewModel.searchLocation)
                            .font(.subheadline)
                            .onSubmit {
                                viewModel.updateListingsForLocation()
                                show.toggle()
                            }
                    }
                    .frame(height: 44)
                    .padding(.horizontal)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(lineWidth: /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(Color(.systemGray4))
                    }
                } else {
                    CollapsedPickerView(title: "Search places", description: "Add place")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .location ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .location}
            }
            
            // -- Right clicked and 'Extract Subview' for the Date and Num guests views to clean up code sections.
            
            // Date selection view
            
            VStack(alignment: .leading) {
                if selectedOption == .dates {
                    Text("When do you want to move in?")
                        .font(.title2)
                        .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                        .fontWeight(.semibold)
                    
                    // iOS 17.1 has an issue where you have to hold DatePicker press for 2+ seconds before it responds. Here is a fix:
                    VStack {
                        DatePicker("On", selection: $startDate, displayedComponents: .date)
//                        .datePickerStyle(.compact)
                        .onTapGesture(count: 99, perform: {
                            // overrides tap gesture to fix ios 17.1 bug
                        })
                        
//                        Divider()
//                        
//                        DatePicker("To", selection: $endDate,
//                                   displayedComponents: .date)
//                        .onTapGesture(count: 99, perform: {
//                        })
                    }
                    .foregroundStyle(.gray)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }else{
                    CollapsedPickerView(title: "When's move in?", description: "Add date")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .dates ? 180 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .dates}
            }
            
            // Num guests view
            
            VStack(alignment: .leading) {
                if selectedOption == .guests {
                    Text("How many roommates?")
                        .font(.title)
                        .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                        .fontWeight(.semibold)
                    
                    
                    Stepper{
                        Text("\(numGuests) roommates")
                            .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
                    } onIncrement: {
                        numGuests += 1
                    } onDecrement: {
                        guard numGuests > 0 else {return}
                        numGuests -= 1
                    }
                    .onTapGesture(count: 99, perform: {
                        // overrides tap gesture to fix ios 17.1 bug -- stepper has same issue
                    })
                    
                }else{
                    CollapsedPickerView(title: "Who's crashing?", description: "Add people")
                }
            }
            .modifier(CollapsibleDestinationViewModifier())
            .frame(height: selectedOption == .guests ? 120 : 64)
            .onTapGesture {
                withAnimation(.snappy) {selectedOption = .guests}
            }
            
            Spacer()
            
        }
        .background(Color(red: 203/255, green: 195/255, blue: 227/255, opacity: 1))
    }
}

#Preview {
    DestinationSearchView(show: .constant(false), viewModel: ExploreViewModel(service: ExploreService()))
}

// Custom modifier -- helps with cleaner code
struct CollapsibleDestinationViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding()
            .shadow(radius: 10)
    }
}

struct CollapsedPickerView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
//                    .foregroundStyle(voyaBlue)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(description)
            }
            .fontWeight(.semibold)
            .font(.subheadline)
        }
//        .padding()
//        .background(.white)
//        .clipShape(RoundedRectangle(cornerRadius: 12))
//        .padding()
//        .shadow(radius: 10)
    }
}
