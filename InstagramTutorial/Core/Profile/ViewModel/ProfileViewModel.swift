//
//  ProfileViewModel.swift
//  InstagramTutorial
//
//  Created by Djordje on 24. 6. 2025..
//

import SwiftUI

enum InstagramViewModel: Int, CaseIterable {
    case posts
    case reels
    case profile
    
    var icon: String {
        switch self {
        case .posts:
            return "house"
        case .reels:
            return "film"
        case .profile:
            return "person.circle"
        }
    }
}
