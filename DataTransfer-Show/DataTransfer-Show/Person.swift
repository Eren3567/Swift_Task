//
//  Person.swift
//  DataTransfer-Show
//
//  Created by Eren Çetintaş on 19.01.2024.
//

import Foundation

class Person {
    var Personid: Int?
    var PersonName : String?
    
    init(Personid: Int? = nil, PersonName: String? = nil) {
        self.Personid = Personid
        self.PersonName = PersonName
    }
    
}
