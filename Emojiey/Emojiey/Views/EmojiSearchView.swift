//
//  EmojiSearchView.swift
//  Emojiey
//
//  Created by Millie Kembe on 4/2/23.
//

import SwiftUI

struct EmojiSearchView: View {
    
    @State var searchText = ""
    @StateObject var vm = EmojiLibraryViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                if searchText.isEmpty {
                    ForEach(vm.emoji, id: \.emoji) { emoji in
                        NavigationLink(destination: EmojiDetailView(vm: EmojiDetailViewModel(emoji: emoji))) {
                            HStack {
                                Text(emoji.emoji).font(.largeTitle)
                            }
                        }
                    }
                }
                ForEach(searchResults, id: \.emoji) { emoji in
                    NavigationLink(destination: EmojiDetailView(vm: EmojiDetailViewModel(emoji: emoji))) {
                        Text(emoji.emoji).font(.largeTitle)
                    }
                }

            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search an Emoji")
        .navigationTitle("Emojiey")
        }
    }
    
    var searchResults: [Emoji] {
        
        if(searchText.isEmpty) {
            return vm.emoji
        }

        return vm.emoji.filter { $0.description.localizedCaseInsensitiveContains(searchText) }

    }
    
}

struct EmojiSearchView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiSearchView()
    }
}
