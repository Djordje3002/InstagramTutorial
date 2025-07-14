//
//  MessageView.swift
//  InstagramTutorial
//
//  Created by Djordje on 14. 7. 2025..
//

import SwiftUI

struct MessagesView: View {
    @Environment(\.dismiss) private var dismiss
    let stories = Story.MOCK_STORIES
    let user: User

        var body: some View {
            VStack {
                HStack {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                    }
                    
                    Text(user.username)
                    Spacer()
                }
                .padding(.horizontal)
                .foregroundStyle(.black)
                
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(stories) { story in
                            NavigationLink {
                                ChatView()
                            } label: {
                                HStack {
                                    Circle()
                                        .strokeBorder(
                                            LinearGradient(
                                                colors: [.red, .orange, .purple],
                                                startPoint: .topLeading,
                                                endPoint: .bottomTrailing
                                            ),
                                            lineWidth: 3
                                        )
                                        .background(
                                            Circle()
                                                .fill(Color.gray)
                                                .overlay(
                                                    Image(story.imageName)
                                                        .resizable()
                                                        .scaledToFill()
                                                        .clipShape(Circle())
                                                )
                                        )
                                        .frame(width: 70, height: 70)
                                                                    
                                    Text(story.username)
                                        .padding(.leading)

                                    Spacer()

                                    Image(systemName: "camera")
                                        .font(.headline)
                                }
                                .foregroundStyle(.black)
                                
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true)
        }
}

#Preview {
    NavigationStack {
        MessagesView(user: User.MOCK_USERS[0])
    }
}
