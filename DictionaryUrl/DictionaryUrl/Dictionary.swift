//
//  File.swift
//  DictionaryUrl
//
//  Created by Eren Çetintaş on 31.01.2024.
//

import Foundation

class Kelimeler : Codable {
    
    var kelime_id : Int?
    var ingilizce: String?
    var turkce : String?
    
    
    init(kelime_id: Int? = nil, ingilizce: String? = nil, turkce: String? = nil) {
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
}
