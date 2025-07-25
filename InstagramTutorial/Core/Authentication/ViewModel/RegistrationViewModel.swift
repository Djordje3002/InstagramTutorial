//
//  RegistrationViewModel.swift
//  InstagramTutorial
//
//  Created by Djordje on 27. 6. 2025..
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    func createUser() async throws {
        try await AuthService.shared.createUser(email: email, password: password, username: username)
        username = ""
        password = ""
        email = ""
    }
}
