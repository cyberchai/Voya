//
//  SearchAndFilterBar.swift
//  Voya
//
//  Created by Chaira Harder on 6/14/25.
//

import SwiftUI

struct SearchAndFilterBar: View {
    @Binding var location: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            VStack(alignment: .leading, spacing: 2) {
                Text(location.isEmpty ? "Where are we looking?" : location)
                    .font(.footnote)
                    .fontWeight(.semibold)
                
//                Text("Let's get you living somewhere great!")
//                Text("\(location.isEmpty ? "" : "") Find the right people, right place, right time.")
//                Text("\(location.isEmpty ? "Find the right people, right place, right time." : "With the right people, at the right time.")")
                Text("\(location.isEmpty ? "Let's get you living somewhere great!" : "Let's make it happen!")")
                    .font(.caption2)
//                    .foregroundStyle(.gray)
                    .foregroundStyle(Color(red: 39/255, green: 27/255, blue: 77/255))
            }
            
            Spacer()
            
            Button(action: {}, label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .foregroundStyle(.black)
            })
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .overlay {
            Capsule()
                .stroke(lineWidth: 0.5)
                //.foregroundStyle(Color(.systemGray4))
                //.shadow(color: .blue.opacity(0.4), radius:2) // TODO: change shadow colour to voyaBlue
                .foregroundStyle(Color(.black))
                .shadow(color: .gray.opacity(0.5), radius: 2)
        }
        .padding()
    }
}

#Preview {
    SearchAndFilterBar(location: .constant("Los Angeles"))
}
