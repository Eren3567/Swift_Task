//
//  TableViewCell.swift
//  ContactAppWithCoreData
//
//  Created by Eren Çetintaş on 11.02.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var LabelCell: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
