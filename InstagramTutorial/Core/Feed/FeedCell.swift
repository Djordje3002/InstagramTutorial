import SwiftUI

struct FeedCell: View {
    let post: Post

    var body: some View {
        VStack {
            // Profile image and username
            HStack {
                Image("photo1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())

                Text(post.user?.username ?? "Unknown")
                    .font(.footnote)
                    .fontWeight(.semibold)

                Spacer()
            }
            .padding(.leading, 8)

            // Post image
            Image(post.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(height: 400)
                .clipShape(Rectangle())

            // Action buttons
            HStack(spacing: 16) {
                Button {
                    print("Liked post")
                } label: {
                    Image(systemName: "heart")
                }

                Button {
                    print("Comment on post")
                } label: {
                    Image(systemName: "bubble.right")
                }

                Button {
                    print("Share post")
                } label: {
                    Image(systemName: "paperplane")
                }

                Spacer()
            }
            .imageScale(.large)
            .foregroundStyle(.black)
            .padding(.leading, 8)
            .padding(.top, 4)

            // Likes
            Text("\(post.likes) likes")
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 2)

            // Caption
            HStack {
                Text(post.user?.username ?? "Unknown")
                    .fontWeight(.semibold)
                +
                Text(" \(post.caption)")
            }
            .font(.footnote)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 10)
            .padding(.top, 1)

            // Timestamp
            Text(post.timestamp.timeAgoString())
                .font(.footnote)
                .foregroundStyle(.gray)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 2)
        }
    }
}

extension Date {
    func timeAgoString() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}


#Preview {
    FeedCell(post: Post.MOCK_POSTS[0])
}
