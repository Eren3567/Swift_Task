//
//  TableViewCell.swift
//  TableViewCustomCell
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import UIKit

class TableViewCell: UITableViewCell {
   
    @IBOutlet weak var Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
