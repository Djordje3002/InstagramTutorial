import SwiftUI
import PhotosUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

@MainActor
class UploadPostViewModel: ObservableObject {
    
    @Published var selectedImage: PhotosPickerItem? {
        didSet { Task { await loadImage(fromItem: selectedImage) } }
    }
    
    @Published var postImage: Image?
    private var uiImage: UIImage?
    
    @Published var posts = [Post]()        // Global feed
    @Published var userPosts = [Post]()    // User's posts
    
    private let postsCollection = Firestore.firestore().collection("posts")
    private let usersCollection = Firestore.firestore().collection("users")
    
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.postImage = Image(uiImage: uiImage)
    }
    
    func uploadPost(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let uiImage = self.uiImage else { return }
        
        // Convert to base64 for local testing
        guard let imageData = uiImage.jpegData(compressionQuality: 0.5) else { return }
        let base64String = imageData.base64EncodedString()
        
        let postId = UUID().uuidString
        let postData: [String: Any] = [
            "id": postId,
            "ownerUid": uid,
            "caption": caption,
            "likes": 0,
            "imageUrl": base64String,
            "timestamp": Timestamp(date: Date())
        ]
        
        // Save to global feed
        try await postsCollection.document(postId).setData(postData)
        
        // Save to user's posts
        try await usersCollection.document(uid).collection("posts").document(postId).setData(postData)
        
        print("✅ Post uploaded!")
    }
    
    func fetchFeedPosts() async throws {
        let snapshot = try await postsCollection.order(by: "timestamp", descending: true).getDocuments()
        self.posts = snapshot.documents.compactMap { doc in
            try? doc.data(as: Post.self)
        }
    }
    
    func fetchUserPosts() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await usersCollection.document(uid).collection("posts").order(by: "timestamp", descending: true).getDocuments()
        self.userPosts = snapshot.documents.compactMap { doc in
            try? doc.data(as: Post.self)
        }
    }
}

