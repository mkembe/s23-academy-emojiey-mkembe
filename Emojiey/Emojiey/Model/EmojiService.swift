//
//  EmojiService.swift
//  Emojiey
//
//  Created by Millie Kembe on 4/2/23.
//

import Foundation

class EmojiService {
    
    init() {
        loadEmojiLibrary()
    }
    
    static var shared: EmojiService {
        EmojiService()
    }
    
    var emojiLibrary: EmojiLibrary?
    
    func loadEmojiLibrary() {
        emojiLibrary = getEmojiLibraryFromJSON()
    }
    
    func getEmojiLibraryFromJSON() -> EmojiLibrary? {
        
        func decode<T: Codable>(_ file: String) -> T {
            let data: Data
            
            guard let file = Bundle.main.url(forResource: file, withExtension: nil)
            else {
                fatalError("Couldn't find \(file) in bundle.")
            }
            
            do {
                data = try Data(contentsOf: file)
            } catch {
                fatalError("Couldn't load \(file) from bundle: \n\(error)")
            }
            
            do {
                let decoder = JSONDecoder()
                return try decoder.decode(T.self, from: data)
            } catch {
                fatalError("Couldn't parse \(file) as \(T.self):\n\(error)")
            }
            
        }
        
        return(decode("emoji.json"))
        
    }
}
