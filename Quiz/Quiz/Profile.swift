//
//  Profile.swift
//  Quiz
//
//  Created by Eren Çetintaş on 20.02.2024.
//

import Foundation
import Firebase
class Profile {
    
    
    let  userNameLabel1 : String?
    var  scoreLabel1 = 0
    let  dateLabel1 : Timestamp?
    let username1 : String?
    
    init(userNameLabel1: String?, scoreLabel1: Int = 0, dateLabel1: Timestamp?, username1: String?) {
        self.userNameLabel1 = userNameLabel1
        self.scoreLabel1 = scoreLabel1
        self.dateLabel1 = dateLabel1
        self.username1 = username1
    }
 
    
}
