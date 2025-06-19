//
//  MainTabView.swift
//  Voya
//
//  Created by Chaira Harder on 6/15/25.
//

import SwiftUI

//extension Color {
//    static let voyaPurple = Color(hex: "#6A0DAD")
//}

let voyaBlue = Color(red: 37/255, green: 58/255, blue: 153/255)
let wohnaDark = Color(red: 39/255, green: 27/255, blue: 77/255)
let wohnaLight = Color(red: 203/255, green: 195/255, blue: 227/255)
//let voyaMint = Color(red: 96/255, green: 230/255, blue: 203/255)

struct MainTabView: View {
    
    init() {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor(wohnaLight)

            UITabBar.appearance().standardAppearance = appearance
            if #available(iOS 15.0, *) {
                UITabBar.appearance().scrollEdgeAppearance = appearance
            }
    }
    
    
    
    var body: some View {
        TabView {
            ExploreView()
                .tabItem { Label("Explore", systemImage: "magnifyingglass")}
            WishlistsView()
                .tabItem { Label("Saved", systemImage: "heart")}
            ProfileView()
                .tabItem { Label("Profile", systemImage: "person")}
        }
        .tint(wohnaDark)
    }
}

#Preview {
    MainTabView()
}
