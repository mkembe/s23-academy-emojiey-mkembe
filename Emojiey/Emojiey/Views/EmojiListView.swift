//
//  EmojiListView.swift
//  Emojiey
//
//  Created by Millie Kembe on 4/2/23.
//

import SwiftUI

struct EmojiListView: View {
    
    @StateObject var vm = EmojiLibraryViewModel()
    @State var searchText = ""
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    
    var searchResults: [Emoji] {
        
        if(searchText.isEmpty) {
            return vm.emoji
        }

        return vm.emoji.filter { $0.description.localizedCaseInsensitiveContains(searchText) }

    }
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                VStack {
                    EmojiSearchView()
                }
                
            }
        }
    }
    
    
    struct EmojiListView_Previews: PreviewProvider {
        static var previews: some View {
            EmojiListView()
        }
    }
}
