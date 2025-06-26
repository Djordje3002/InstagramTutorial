import Foundation

struct Post: Identifiable, Codable, Hashable {
    let id: String
    var ownerUid: String
    var caption: String
    var likes: Int
    var imageUrl: String
    let timestamp: Date
    var user: User?
}

extension Post {
    static var MOCK_POSTS: [Post] = [
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[0].id,
            caption: "Putting in that work. 🏀 #grindseason",
            likes: 1240,
            imageUrl: "Lebron",
            timestamp: Date().addingTimeInterval(-3600),
            user: User.MOCK_USERS[0]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[1].id,
            caption: "Splash zone activated 🌊🔥",
            likes: 3421,
            imageUrl: "photo2",
            timestamp: Date().addingTimeInterval(-7200),
            user: User.MOCK_USERS[1]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[2].id,
            caption: "Defend the paint like a wall. 🧱",
            likes: 870,
            imageUrl: "photo3",
            timestamp: Date().addingTimeInterval(-10800),
            user: User.MOCK_USERS[2]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[3].id,
            caption: "Just hoop. No talk. 💯",
            likes: 2503,
            imageUrl: "photo4",
            timestamp: Date().addingTimeInterval(-14400),
            user: User.MOCK_USERS[3]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[4].id,
            caption: "King of the court 👑",
            likes: 6542,
            imageUrl: "photo5",
            timestamp: Date().addingTimeInterval(-18000),
            user: User.MOCK_USERS[4]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[5].id,
            caption: "No luck. Just buckets. 🎯",
            likes: 2104,
            imageUrl: "photo6",
            timestamp: Date().addingTimeInterval(-21600),
            user: User.MOCK_USERS[5]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[6].id,
            caption: "Post-workout vibes 💪",
            likes: 1021,
            imageUrl: "Jokic",
            timestamp: Date().addingTimeInterval(-25200),
            user: User.MOCK_USERS[6]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[7].id,
            caption: "Lights out shooter 🎯🔥",
            likes: 3309,
            imageUrl: "photo3",
            timestamp: Date().addingTimeInterval(-28800),
            user: User.MOCK_USERS[7]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[8].id,
            caption: "Magic in the air ✨",
            likes: 1980,
            imageUrl: "photo2",
            timestamp: Date().addingTimeInterval(-32400),
            user: User.MOCK_USERS[8]
        ),
        .init(
            id: UUID().uuidString,
            ownerUid: User.MOCK_USERS[9].id,
            caption: "Game face on 😤 #focus",
            likes: 2750,
            imageUrl: "photo5",
            timestamp: Date().addingTimeInterval(-36000),
            user: User.MOCK_USERS[9]
        )
    ]
}
