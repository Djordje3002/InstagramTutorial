import Foundation
import FirebaseFirestore
import FirebaseFirestore

class MessagesManager: ObservableObject {
    @Published var messages: [Message] = []
    private var db = Firestore.firestore()
    private var listener: ListenerRegistration?

    init() {
        getMessages()
    }

    func getMessages() {
        listener = db.collection("messages")
            .order(by: "timestamp", descending: false)
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents else {
                    print("No documents")
                    return
                }

                self.messages = documents.compactMap { doc -> Message? in
                    try? doc.data(as: Message.self)
                }
            }
    }

    func sendMessage(text: String) {
        do {
            let newMessage = Message(
                id: UUID().uuidString,
                text: text,
                received: false,
                timestamp: Date()
            )
            try db.collection("messages").document(newMessage.id).setData(from: newMessage)
        } catch {
            print("Error sending message: \(error)")
        }
    }

    deinit {
        listener?.remove()
    }
}

