//
//  ProfileView.swift
//  Voya
//
//  Created by Chaira Harder on 6/15/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        // TODO: Make voyaBlue declaration more efficient later. (reusable)
        let voyaBlue = Color(red: 0/255, green: 74/255, blue: 173/255)
        
        
        VStack {
            
            // Profile login section
            VStack(alignment: .leading, spacing: 32) {
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Profile")
                        .font(.largeTitle)
                    .fontWeight(.semibold)
                    
                    Text("Log in to find your new home!")
                }
                
                Button {
                    print("Log in")
                } label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        //.background(voyaBlue) // adjust colour later
                        .background(Color(red: 39/255, green: 27/255, blue: 77/255))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                HStack {
                    Text("Don't have an account yet?")
                    
                    Text("Sign up!")
                        .fontWeight(.semibold)
                        .underline()
                }
                .font(.caption)
            }
            
            //
            VStack(spacing: 24) {
                ProfileOptionRowView(imageName: "gear", title: "Settings")
//                ProfileOptionRowView(imageName: "gear", title: "Accessibility")
                ProfileOptionRowView(imageName: "questionmark.circle", title: "Help")
            }
            .padding(.vertical)
        }
        .padding()
    }
}

#Preview {
    ProfileView()
}
