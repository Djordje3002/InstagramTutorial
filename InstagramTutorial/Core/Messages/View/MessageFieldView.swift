import SwiftUI

struct MessageFieldView: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @State private var messageText = ""

    var body: some View {
        HStack {
            TextField("Enter your message...", text: $messageText)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: sendMessage) {
                Image(systemName: "paperplane.fill")
                    .foregroundStyle(.blue)
            }
        }
        .padding()
    }

    func sendMessage() {
        guard !messageText.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        messagesManager.sendMessage(text: messageText)
        messageText = ""
    }
}

#Preview {
    MessageFieldView().environmentObject(MessagesManager())
}

