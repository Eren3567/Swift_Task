//
//  FeedCell.swift
//  FirstFirebaseApplication
//
//  Created by Eren Çetintaş on 1.01.2024.
//

import UIKit

class FeedCell: UITableViewCell {
   
    

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var KullanıcıYorumuText: UILabel!
   
    @IBOutlet weak var emailtext2: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
