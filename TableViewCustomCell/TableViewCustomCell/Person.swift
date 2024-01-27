//
//  Person.swift
//  TableViewCustomCell
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import Foundation
import UIKit

class Person {
    
    var name = ""
    var nameid = 0
    var phoneNumber = ""
    
    
    init(name: String = "", nameid: Int = 0, phoneNumber: String = "") {
        self.name = name
        self.nameid = nameid
        self.phoneNumber = phoneNumber
    }
    
}
