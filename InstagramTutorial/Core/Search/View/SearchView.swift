import SwiftUI

struct SearchView: View {
    @State private var searchText: String = ""
    @FocusState private var isFocused: Bool
    @StateObject var viewModel = SearchViewModel()
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                    if isFocused || !searchText.isEmpty {
                        LazyVStack {
                            ForEach(viewModel.users) { user in
                                NavigationLink(value: user) {
                                    HStack {
                                        Image(systemName: "person.circle")
                                            .resizable()
                                            .scaledToFill()
                                            .foregroundStyle(.gray)
                                            .frame(width: 40, height: 40)
                                            .clipShape(Circle())
                                        
                                        VStack(alignment: .leading) {
                                            Text(user.username)
                                                .foregroundStyle(.black)
                                                .fontWeight(.semibold)
                                            Text(user.fullName ?? "User")
                                                .foregroundColor(.gray)
                                        }
                                        .font(.footnote)
                                        
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                    .padding(.vertical, 8)
                                }
                            }
                        }
                    } else {
                        PostsGridView()
                        PostsGridView()
                        PostsGridView()
                    }
                }

                // Hidden TextField to monitor focus state
                TextField("", text: $searchText)
                    .opacity(0.01)
                    .focused($isFocused)
            }
            .navigationDestination(for: User.self) { user in
                ProfileView(user: user)
            }
            .searchable(text: $searchText, prompt: "Search")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    isFocused = true
                }
            }
        }
    }
}


#Preview {
    SearchView()
}

