//
//  Class_class.swift
//  Class
//
//  Created by Eren Çetintaş on 21.12.2023.
//

import Foundation

enum kullanici {
case admin
    case normalkullanici
    case yetkisizkullanici
}
class user {
    
    var isim : String
    var tel : Int
    var soyisim : String
    var tip : kullanici
    init(isim: String, tel: Int, soyisim: String, tip: kullanici) {
        self.isim = isim
        self.tel = tel
        self.soyisim = soyisim
        self.tip = tip
        
        
    }
    
    func First (){
        print("first cagrildi")
    }
}
