//
//  User.swift
//  InstagramTutorial
//
//  Created by Djordje on 24. 6. 2025..
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    var username: String
    var profileImageUrl: String?
    var fullName: String?
    var bio: String?
    let email: String?
}

extension User {
    static var MOCK_USERS: [User] = [
        .init(
            id: UUID().uuidString,
            username: "kingjames",
            profileImageUrl: "Lebron",
            fullName: "LeBron James",
            bio: "4x NBA Champion. Strive for greatness.",
            email: "lebron@lakers.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "photo1",
            profileImageUrl: "photo1",
            fullName: "Stephen Curry",
            bio: "Chef Curry with the shot.",
            email: "steph@warriors.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "photo1",
            profileImageUrl: "photo2",
            fullName: "Giannis Antetokounmpo",
            bio: "The Greek Freak 🇬🇷 MVP x2.",
            email: "giannis@bucks.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "kdsniper",
            profileImageUrl: "photo3",
            fullName: "Kevin Durant",
            bio: "Easy Money Sniper. Just hoop.",
            email: "kd@suns.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "luka77",
            profileImageUrl: "photo4",
            fullName: "Luka Dončić",
            bio: "From Slovenia with love 🇸🇮.",
            email: "luka@mavs.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "jokic15",
            profileImageUrl: "Jokic",
            fullName: "Nikola Jokić",
            bio: "Joker. MVP & NBA Champ.",
            email: "jokic@nuggets.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "booker1",
            profileImageUrl: "photo5",
            fullName: "Devin Booker",
            bio: "Buckets. Suns lifer.",
            email: "book@phoenixsuns.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "jaytatum0",
            profileImageUrl: "photo6",
            fullName: "Jayson Tatum",
            bio: "0 on my back. 100 in my heart.",
            email: "jt@celtics.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "ja12",
            profileImageUrl: "photo7",
            fullName: "Ja Morant",
            bio: "Point God in the making.",
            email: "ja@grizzlies.com"
        ),
        .init(
            id: UUID().uuidString,
            username: "kawhi_leonard",
            profileImageUrl: "photo8",
            fullName: "Kawhi Leonard",
            bio: "Board man gets paid.",
            email: "kawhi@clippers.com"
        )
    ]
}

