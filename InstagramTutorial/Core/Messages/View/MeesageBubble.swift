import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false

    var body: some View {
        VStack(alignment: message.received ? .leading : .trailing) {
            HStack {
                Text(message.text)
                    .padding()
                    .background(message.received ? Color.blue : Color.gray)
                    .foregroundStyle(.white)
                    .cornerRadius(30)
            }
            .frame(maxWidth: .infinity, alignment: message.received ? .leading : .trailing)
            .padding(message.received ? .leading : .trailing)
            .padding(.horizontal, 10)
            .onTapGesture {
                showTime.toggle()
            }

            if showTime {
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundStyle(.gray)
                    .padding(message.received ? .leading : .trailing, 25)
            }
        }
    }
}

#Preview {
    MessageBubble(message: Message(id: "1234", text: "Hello!", received: true, timestamp: Date()))
}

