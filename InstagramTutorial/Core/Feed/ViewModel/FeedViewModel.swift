import SwiftUI
import FirebaseFirestore

@MainActor
class FeedViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    private let postsCollection = Firestore.firestore().collection("posts")
    
    init() {
        Task { await fetchPosts() }
    }
    
    func fetchPosts() async {
        do {
            let snapshot = try await postsCollection.order(by: "timestamp", descending: true).getDocuments()
            self.posts = snapshot.documents.compactMap { doc in
                try? doc.data(as: Post.self)
            }
        } catch {
            print("❌ Failed to fetch posts: \(error)")
        }
    }
}
