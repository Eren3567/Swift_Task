//
//  CollectionViewCell.swift
//  Quiz
//
//  Created by Eren Çetintaş on 24.02.2024.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    

    
    @IBOutlet weak var question2023Image: UIImageView!
   
    override func awakeFromNib() {
        super.awakeFromNib()
        question2023Image.layer.cornerRadius = 20
                question2023Image.layer.masksToBounds = true // Köşeleri kesintiye uğrat
    }

    
    
}
