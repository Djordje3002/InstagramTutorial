import SwiftUI

struct ReelsView: View {
    let posts: [Post]

    var body: some View {
        GeometryReader { geometry in
            TabView {
                ForEach(posts) { post in
                    ReelCell(post: post, geometry: geometry)
                        .frame(width: geometry.size.width, height: geometry.size.height)
                        .rotationEffect(.degrees(-90))
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .rotationEffect(.degrees(90), anchor: .topLeading)
            .frame(width: geometry.size.height, height: geometry.size.width)
            .offset(x: geometry.size.width)
            .ignoresSafeArea()
            .background(.black) // Ensure background is clean
        }
    }
}

struct ReelCell: View {
    let post: Post
    let geometry: GeometryProxy
    let isLiked: Bool = false

    var body: some View {
        ZStack() {
            // Background image with gradient overlay for better text readability
            ZStack {
                Image(post.imageUrl)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.height, height: geometry.size.width)
                    .clipped()
                
                LinearGradient(
                    gradient: Gradient(colors: [.black.opacity(0.4), .clear, .black.opacity(0.6)]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            }
            .ignoresSafeArea()

            // Overlays
            VStack(spacing: 0) {
                Spacer()
                HStack(alignment: .bottom) {
                    // Post info
                    VStack(alignment: .leading, spacing: 10) {
                        HStack(spacing: 8) {
                            // User profile image (optional, assuming Post has this)
                            Image(post.user?.profileImageUrl ?? "default_profile")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 32, height: 32)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.white, lineWidth: 1))
                            
                            Text("@\(post.user?.username ?? "unknown")")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                        }
                        
                        Text(post.caption)
                            .font(.system(size: 14))
                            .foregroundStyle(.white)
                            .lineLimit(3)
                            .padding(.leading, 40) // Align with username
                    }
                    
                    Spacer()
                    
                    // Action buttons
                    VStack(spacing: 20) {
                        // Like button
                        Button {
                            print("Like tapped")
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                    .font(.system(size: 24))
                                Text("\(post.likes)")
                                    .font(.system(size: 12, weight: .medium))
                            }
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(.black.opacity(0.3))
                            .clipShape(Circle())
                        }
                        
                        // Comment button
                        Button {
                            print("Comment tapped")
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: "bubble.right.fill")
                                    .font(.system(size: 24))
                            }
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(.black.opacity(0.3))
                            .clipShape(Circle())
                        }
                        
                        // Share button
                        Button {
                            print("Share tapped")
                        } label: {
                            VStack(spacing: 4) {
                                Image(systemName: "paperplane.fill")
                                    .font(.system(size: 24))
                                Text("Share")
                                    .font(.system(size: 12, weight: .medium))
                            }
                            .foregroundStyle(.white)
                            .padding(8)
                            .background(.black.opacity(0.3))
                            .clipShape(Circle())
                        }
                    }
                    .padding(.vertical, 10)
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 40)
            }
        }
        .frame(width: geometry.size.height, height: geometry.size.width)
        .ignoresSafeArea()
    }
}

#Preview {
    ReelsView(posts: Post.MOCK_POSTS)
}
