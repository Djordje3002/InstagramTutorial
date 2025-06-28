//
//  UserService.swift
//  InstagramTutorial
//
//  Created by Djordje on 28. 6. 2025..
//

import SwiftUI
import Firebase

struct UserService {
    
    @MainActor
        static func fetchAllUsers() async throws -> [User] {
        let snapshot = try await Firestore.firestore().collection("users").getDocuments()
            return snapshot.documents.compactMap({ try? $0.data(as: User.self) })
    }
    
}
