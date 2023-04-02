//
//  EmojiDetailViewModel.swift
//  Emojiey
//
//  Created by Millie Kembe on 4/2/23.
//

import Foundation

class EmojiDetailViewModel: ObservableObject {
    
    @Published var model: Emoji
    
    init(emoji: Emoji) {
        self.model = emoji
    }
    
    
    
    var emoji: String {
        return model.emoji
    }
    var description: String {
        return model.description
    }
    var categroy: String {
        return model.category
    }
    var unicodeVersion: String {
        return model.unicodeVersion
    }
    var iosVersion: String {
        return model.iosVersion
    }
       

    
    
}
