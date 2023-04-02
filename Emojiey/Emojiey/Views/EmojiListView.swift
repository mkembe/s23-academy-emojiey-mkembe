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

        return vm.emoji.filter { $0.description.localizedCaseInsensitiveContains(searchText) }

    }
    
    var body: some View {
        
        NavigationStack {
            VStack {
                ForEach(searchResults, id: \.emoji) { emoji in
                    NavigationLink(destination: EmojiDetailView(vm: EmojiDetailViewModel(emoji: emoji))) {
                        Text(emoji.emoji).font(.largeTitle)
                    }
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .navigationTitle("Emojiey")
            
            VStack {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(vm.emoji, id: \.emoji) { emoji in
                                NavigationLink(destination: EmojiDetailView(vm: EmojiDetailViewModel(emoji: emoji))) {
                                    HStack {
                                        Text(emoji.emoji).font(.largeTitle)
                                    }
                                }
                            }
                            
                        }
                    }
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
