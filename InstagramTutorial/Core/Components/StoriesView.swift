import SwiftUI

struct StoriesView: View {
    let stories = Story.MOCK_STORIES
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(stories) { story in
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
    }
}

#Preview {
    StoriesView()
}
