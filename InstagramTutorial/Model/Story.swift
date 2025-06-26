//
//  Story.swift
//  InstagramTutorial
//
//  Created by Djordje on 24. 6. 2025..
//
import Foundation

struct Story: Identifiable {
    let id = UUID()
    let imageName: String
    let username: String
}

extension Story {
    static let MOCK_STORIES: [Story] = [
        .init(imageName: "photo1", username: "lebron"),
        .init(imageName: "photo2", username: "steph"),
        .init(imageName: "photo3", username: "giannis"),
        .init(imageName: "photo4", username: "tatum"),
        .init(imageName: "photo5", username: "booker"),
        .init(imageName: "photo6", username: "wemby"),
        .init(imageName: "photo7", username: "luka"),
        .init(imageName: "photo8", username: "jokic"),
        .init(imageName: "photo9", username: "ja")
    ]
}
