//
//  LogInViewModel.swift
//  InstagramTutorial
//
//  Created by Djordje on 27. 6. 2025..
//

import Foundation

class LogInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    func signIn() async throws {
        try await AuthService.shared.login(email: email, password: password)
    }
}
