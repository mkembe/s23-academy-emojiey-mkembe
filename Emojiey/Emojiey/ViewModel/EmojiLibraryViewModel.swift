//
//  EmojiLibraryViewModel.swift
//  Emojiey
//
//  Created by Millie Kembe on 4/2/23.
//

import Foundation

class EmojiLibraryViewModel: ObservableObject {
    @Published var emojilibrary: EmojiLibrary?
    
    init() {
        emojilibrary = EmojiService.shared.emojiLibrary
    }
    
    var emoji: [Emoji] {
        return emojilibrary?.emoji ?? []
    }
    
    
    
}
