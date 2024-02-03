//
//  Class2.swift
//  DetailTableView
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import Foundation
import UIKit

//For what class2? for who class2?
//Class2 şu şu metotdan faydalanarak şu şu tanımları çalıştırır şu fonksiyona yön verir. 
class Class2 {
    //Soldan Sağa ne yaptığını max 5 kelime İNG TR
    //var defined id,name, image,price for meal app user
    var mealid = 0
    var mealname = ""
    var mealimage = ""
    var mealPrice = 0
    
    
    init(mealid: Int = 0, mealname: String = "", mealimage: String = "", mealPrice: Int = 0) {
        self.mealid = mealid
        self.mealname = mealname
        self.mealimage = mealimage
        self.mealPrice = mealPrice
    } // end init
} //end class
