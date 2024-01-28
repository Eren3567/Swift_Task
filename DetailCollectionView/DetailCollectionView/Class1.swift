//
//  Class1.swift
//  DetailCollectionView
//
//  Created by Eren Çetintaş on 28.01.2024.
//

import Foundation
import UIKit
class Class1 {
    var FilmImageName = ""
    var FilmTitle = ""
    var FilmId = 0
    var FilmPrice : Double?
    
    init(FilmImageName: String = "", FilmTitle: String = "", FilmId: Int = 0, FilmPrice: Double? = nil) {
        self.FilmImageName = FilmImageName
        self.FilmTitle = FilmTitle
        self.FilmId = FilmId
        self.FilmPrice = FilmPrice
    
    }
    
    
}
