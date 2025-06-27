import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()

    var body: some View {
        VStack {
            Group {
                if viewModel.userSession == nil {
                    LoginView()
                        .environmentObject(registrationViewModel)
                } else {
                    MainTabView()
                        .environmentObject(registrationViewModel)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

