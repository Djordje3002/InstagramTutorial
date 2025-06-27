//
//  PostsGridView.swift
//  InstagramTutorial
//
//  Created by Djordje on 25. 6. 2025..
//

import SwiftUI

struct PostsGridView: View {
    
    let stories = Story.MOCK_STORIES
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        VStack {
            LazyVGrid(columns: gridItems, spacing: 1) {
                
                ForEach(stories) { image in
                    Image(image.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: (UIScreen.main.bounds.width - 3) / 3, height: 120)
                        .clipped()
                }

            }
        }
    }
}

#Preview {
    PostsGridView()
}
