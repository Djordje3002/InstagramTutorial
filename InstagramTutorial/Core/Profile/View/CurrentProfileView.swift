//
//  CurrentUserProfileView.swift
//  InstagramTutorial
//
//  Created by Djordje on 24. 6. 2025..
//

import SwiftUI

struct CurrentProfileView: View {
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
                    HStack {
                        Image(systemName: "lock")
                        
                        Text("djordjekartaljevic")
                            .font(.headline)
                        Image(systemName: "chevron.down")
                        
                    }
                    Spacer()
                    HStack {
                        Image("threads_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Image(systemName: "plus.square")
                        Image(systemName: "line.3.horizontal")
                    }
                }
                //            profile stats
                HStack(alignment: .top) {
                    Circle()
                        .frame(width: 100)
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Djordje Kartaljevic")
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
                VStack {
                    Text("Bio bible verse ofc")
                        .font(.callout)
                    HStack {
                        Image("threads_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text("djordjekartaljevic")
                            .font(.callout)
                            .fontWeight(.semibold)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                
                //            edit profile and share button
                HStack {
                    Button {
                        print("edit")
                    } label: {
                        Text("Edit profile")
                            .frame(width: (UIScreen.main.bounds.width - 72) / 2, height: 32)
                            .foregroundStyle(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                            }
                    }
                    Spacer()
                    Button {
                        print("edit")
                    } label: {
                        Text("Share profile")
                            .frame(width: (UIScreen.main.bounds.width - 72) / 2, height: 32)
                            .foregroundStyle(.black)
                            .overlay {
                                RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
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
                    PostsGridView()
                }
            }
            else if selectedFilter == .reels {
                Text("No Reels yet")
            }
            else if selectedFilter == .profile {
                PostsGridView()
            }
            
            Spacer()
        }
    }
}

#Preview {
    CurrentProfileView()
}
