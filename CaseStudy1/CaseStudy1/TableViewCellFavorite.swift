//
//  TableViewCellFavorite.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 7.04.2024.
//

import UIKit

class TableViewCellFavorite: UITableViewCell {
    @IBOutlet weak var artworkImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
