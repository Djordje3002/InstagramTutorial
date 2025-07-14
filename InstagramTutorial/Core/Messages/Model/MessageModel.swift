//
//  MessageModel.swift
//  InstagramTutorial
//
//  Created by Djordje on 14. 7. 2025..
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var recived: Bool
    var timestamp: Date
}
