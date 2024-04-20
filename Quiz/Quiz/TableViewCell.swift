//
//  TableViewCell.swift
//  Quiz
//
//  Created by Eren Çetintaş on 20.02.2024.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var username: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        scoreLabel.textColor = UIColor.label
        dateLabel.textColor = UIColor.label
        userNameLabel.textColor = UIColor.label
        username.textColor = UIColor.label
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

 }
