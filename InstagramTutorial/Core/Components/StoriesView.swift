//
//  StoriesView.swift
//  InstagramTutorial
//
//  Created by Djordje on 23. 6. 2025..
//

import SwiftUI

struct StoriesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(1..<10, id: \.self) { index in
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
                            .background(Circle().fill(Color.gray)) // Placeholder image
                            .frame(width: 70, height: 70)
                        
                        Text("User \(index)")
                            .font(.caption)
                            .frame(width: 70)
                            .lineLimit(1)
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
    }
}

#Preview {
    StoriesView()
}
