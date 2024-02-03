//
//  TableViewCell.swift
//  DictionaryUrl
//
//  Created by Eren Çetintaş on 31.01.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
