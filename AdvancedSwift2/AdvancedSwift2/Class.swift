//
//  Class.swift

//
//  Created by Eren Çetintaş on 2.01.2024.
//

import Foundation

class UserClass {
    
    var isim : String
    var yas : Int
    var meslek : String
    
    init(isim: String, yas: Int, meslek: String) {
        self.isim = isim
        self.yas = yas
        self.meslek = meslek
    }
    
    func birartir (){
        
        self.yas += 1
        print(yas)
    }
}

