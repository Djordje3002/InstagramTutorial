import SwiftUI

struct EditProfileRowView: View {
    let title: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text(title)
                .padding(.leading, 8)
                .frame(width: 100, alignment: .leading)
            
            VStack(alignment: .leading) {
                TextField(placeholder, text: $text)
                Divider()
            }
        }
    }
}

#Preview {
    EditProfileRowView(title: "Name", placeholder: "Enter your name", text: .constant("John Doe"))
}

