//
//  CollectionViewCell2.swift
//  Quiz
//
//  Created by Eren Çetintaş on 2.03.2024.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {
    
    
    @IBOutlet weak var question2023Image2: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()

            question2023Image2.layer.cornerRadius = 20
                    question2023Image2.layer.masksToBounds = true // Köşeleri kesintiye uğrat
    }
}
