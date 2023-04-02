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
        
    VStack {
            Text("\(vm.emoji)").font(.system(size: 150))
            Text("\(vm.description)").font(.largeTitle).bold()
            Text("**Category:** \(vm.categroy)")
            Text("**Unicode Version:** \(vm.unicodeVersion)")
            Text("**iOS Version:** \(vm.iosVersion)")
        }
        .padding(.bottom, 400)
    }
}

struct EmojiDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiDetailView(vm: EmojiDetailViewModel(emoji: .example))
    }
}
