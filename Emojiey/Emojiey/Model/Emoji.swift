//
//  Emoji.swift
//  Emojiey
//
//  Created by Millie Kembe on 4/2/23.
//

import Foundation

struct Emoji: Codable {
    let emoji: String
    let description: String
    let category: String
    let aliases: [String]
    let tags: [String]
    let unicodeVersion: String
    let iosVersion: String
    
    enum CodingKeys: String, CodingKey {
        case emoji, description, category, aliases, tags
        case unicodeVersion = "unicode_version"
        case iosVersion = "ios_version"
    }
}

extension Emoji {
    static var example: Emoji {
        Emoji(emoji: "😃", description: "Smiling", category: "Smiley Face", aliases: ["Smile", "Smiling"], tags: ["Smile"], unicodeVersion: "0.0", iosVersion: "2.0")
    }
}

