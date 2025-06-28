//
//  ProfileView.swift
//  InstagramTutorial
//
//  Created by Djordje on 22. 6. 2025..
//

import SwiftUI

struct ProfileView: View {
    
    let user: User
    let stories = Story.MOCK_STORIES
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    @State private var selectedFilter = InstagramViewModel.posts
    @Namespace var animation
    
    var body: some View {
        ScrollView {
            VStack {
 //            header
                HStack {
                    HStack(spacing: 6) {
                        Text(user.username)
                            .font(.headline)
                        Image(systemName: "checkmark.seal.fill")
                            .foregroundColor(.blue)

                        
                    }
                    Spacer()
                    HStack {
                        Image(systemName: "ellipsis")
                        Image(systemName: "bell")
                    }
                }
                //            profile stats
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 100)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text(user.fullName ?? "User")
                            .font(.headline)
                            .fontWeight(.semibold)
                            .padding(.bottom, 8)
                        HStack {
                            UserStatView(value: 3, title: "posts")
                                .frame(width: (UIScreen.main.bounds.width - 164) / 3)
                            
                            UserStatView(value: 379, title: "followers")
                                .frame(width: (UIScreen.main.bounds.width - 164) / 3)
                            
                            UserStatView(value: 260, title: "following")
                                .frame(width: (UIScreen.main.bounds.width - 164) / 3)
                        }
                        .frame(width: UIScreen.main.bounds.width - 164)
                    }
                }
                //            Bio and threads
                VStack(alignment: .leading) {
                    if let bio = user.bio {
                        Text(bio)
                            .font(.callout)
                    }
                    
                    Text(user.username)
                    HStack {
                        Image("threads_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text(user.email ?? "")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                
                //            edit profile and share button
                HStack {
                    if user.isCurrentUser {
                        Button {
                            print("edit")
                        } label: {
                            Text("Following")
                                .frame(width: (UIScreen.main.bounds.width - 72) / 2, height: 32)
                                .foregroundStyle(.black)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                                }
                        }
                        Spacer()
                        Button {
                            
                        } label: {
                            Text("Message")
                                .frame(width: (UIScreen.main.bounds.width - 72) / 2, height: 32)
                                .foregroundStyle(.black)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                                }
                        }

                    }
                    
                    if !user.isCurrentUser {
                        Button {
                            
                        } label: {
                            Text("Follow")
                                .frame(width: (UIScreen.main.bounds.width - 72) , height: 32)
                                .foregroundStyle(.white)
                                .background(.blue)
                                .overlay {
                                    RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                                }
                        }
                    }
                    Spacer()
                    Image(systemName: "person.badge.plus")
                        .padding(6)
                        .overlay {
                            RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                        }
                    
                }
                .font(.subheadline)
                .fontWeight(.semibold)
                //            stories
                StoriesView()
                
                
            }
            .padding(.horizontal)
            //            posts reels and profile
            
            HStack {
                ForEach(InstagramViewModel.allCases, id: \.rawValue) { item in
                    VStack {
                        Image(systemName: item.icon)
                            .font(.title2)
                            .frame(maxWidth: (UIScreen.main.bounds.width - 32) / 3 )
                            .fontWeight(selectedFilter == item ? .semibold : .regular)
                            .foregroundStyle(selectedFilter == item ? .black : .gray)
                        if selectedFilter == item {
                            Capsule()
                                .foregroundStyle(.gray)
                                .frame(width: 80, height: 3, alignment: .center)
                                .matchedGeometryEffect(id: "filter", in: animation)
                        } else {
                            Capsule()
                                .foregroundStyle(.clear)
                                .frame(width: 80, height: 3, alignment: .center)
                        }
                    }
                    .padding(.vertical, 6)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            selectedFilter = item
                        }
                    }
                }
            }
            if selectedFilter == .posts {
                VStack {
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        
                        ForEach(stories) { image in
                            Image(image.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: (UIScreen.main.bounds.width - 10) / 2, height: 120)
                                .clipped()
                        }

                    }
                }
            }
            else if selectedFilter == .reels {
                VStack {
                    LazyVGrid(columns: gridItems, spacing: 1) {
                        
                        ForEach(stories) { image in
                            Image(image.imageName)
                                .resizable()
                                .scaledToFill()
                                .frame(width: (UIScreen.main.bounds.width - 10) / 2, height: 120)
                                .clipped()
                        }

                    }
                }
            }
            else if selectedFilter == .profile {
                Text("Profile")
            }
            
            Spacer()
        }
    }
}

#Preview {
    ProfileView(user: User.MOCK_USERS[0])
}
