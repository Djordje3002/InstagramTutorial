//
//  MainTabView.swift
//  InstagramTutorial
//
//  Created by Djordje on 22. 6. 2025..
//

import SwiftUI

struct MainTabView: View {
    let user: User
    let posts: [Post]
    @State private var selectedIndex: Int = 0
    
//  isk ne mogu sad da se ebavam ali kad dodjem ce odradim:
//    1. reels view samo ui
//    2. messages nese muci napravi obicno
//    3. pogledas app mozda neki settings nesto tako, mozda na stori da se udje kao sheet neki sa rendom sliku. like feature je izi i comment dodaj sheet. to je
    
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onAppear {
                    selectedIndex = 0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            
            SearchView()
                .onAppear {
                    selectedIndex = 1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            
            UploadPostView(tabIndex: $selectedIndex)
                .onAppear {
                    selectedIndex = 2
                }
                .tabItem {
                    Image(systemName: "plus.square")
                }.tag(2)
            
            ReelsView(posts: posts)
//            Text("Reels")
                .onAppear {
                    selectedIndex = 3
                }
                .tabItem {
                    Image(systemName: "play.square")
                }.tag(3)
            
            CurrentProfileView(user: user)
                .onAppear {
                    selectedIndex = 4
                }
                .tabItem {
                    Image(systemName: "person")
                }.tag(4)
        }
        .accentColor(.black)
    }
}

#Preview {
    MainTabView(user: User.MOCK_USERS[0], posts: Post.MOCK_POSTS)
}
