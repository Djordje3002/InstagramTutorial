//
//  AuthService.swift
//  InstagramTutorial
//
//  Created by Djordje on 26. 6. 2025..
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(email: String, password: String) async throws {
        
    }
    
    func createUser(email: String, password: String, username: String) async throws {
        
    }
    
    func loadUserData() async throws {
        
    }
    
    func signoOut() async throws {
        
    }
}
