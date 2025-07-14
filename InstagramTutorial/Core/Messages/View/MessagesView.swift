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

        var body: some View {
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .padding()
                    }
                }
                Spacer()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 16) {
                        ForEach(stories) { story in
                            NavigationLink {
                                
                            }
                            VStack {
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
                                    .font(.caption)
                                    .frame(width: 70)
                                    .lineLimit(1)
                            }
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
                
                Spacer()
            }
            .navigationBarBackButtonHidden(true) // Hide the default back button if you want
        }
}

#Preview {
    MessagesView()
}
