import SwiftUI

struct FeedView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    StoriesView()
                }
                LazyVStack(spacing: 32) {
                    ForEach(Post.MOCK_POSTS) { post in
                        FeedCell(post: post)
                    }
                }
                .padding(.top, 4)
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline) 

            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 46)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "heart")
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "paperplane")
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
