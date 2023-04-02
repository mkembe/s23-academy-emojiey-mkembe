//
//  EmojiDetailView.swift
//  Emojiey
//
//  Created by Millie Kembe on 4/2/23.
//

import SwiftUI

struct EmojiDetailView: View {
    
    @StateObject var vm: EmojiDetailViewModel
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    Section {
                        Text("\(vm.emoji)")
                            .font(.largeTitle)
                    }
                }
                Section {
                    Text("\(vm.description)").font(.largeTitle)
                    Text("Category: \(vm.categroy)")
                    Text("Unicode Version: \(vm.unicodeVersion)")
                    Text("iOS Version: \(vm.iosVersion)")
                }
            }
        }
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(vm: EmojiDetailViewModel(emoji: .example))
    }
}
