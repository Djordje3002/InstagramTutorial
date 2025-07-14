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
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Image("instagram_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 46)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        NotificationsView()
                    } label: {
                        Image(systemName: "heart")
                            .foregroundStyle(.black)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        MessageView()
                    } label: {
                        Image(systemName: "paperplane")
                            .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    FeedView()
}
