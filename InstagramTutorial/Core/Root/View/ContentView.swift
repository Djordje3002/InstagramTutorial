import SwiftUI

struct ContentView: View {
    @State var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            Group {
                if viewModel.userSession == nil {
                    LoginView()
                }else {
                    MainTabView()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
