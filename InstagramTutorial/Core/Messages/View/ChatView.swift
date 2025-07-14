import SwiftUI

struct ChatView: View {
    @StateObject var messagesManager = MessagesManager()

    var body: some View {
        VStack {
            ScrollViewReader { proxy in
                ScrollView {
                    LazyVStack {
                        ForEach(messagesManager.messages) { message in
                            MessageBubble(message: message)
                        }
                    }
                }
                .onChange(of: messagesManager.messages.count) { _ in
                    if let lastMessage = messagesManager.messages.last {
                        withAnimation {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                        }
                    }
                }
            }

            MessageFieldView()
                .environmentObject(messagesManager)
        }
    }
}

#Preview {
    ChatView()
}

