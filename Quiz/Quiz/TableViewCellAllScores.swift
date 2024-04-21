//
//  TableViewCellAllScores.swift
//  Quiz
//
//  Created by Eren Çetintaş on 18.04.2024.
//

import UIKit

class TableViewCellAllScores: UITableViewCell {
    @IBOutlet weak var UserScore: UILabel!
    
    @IBOutlet weak var UserDate: UILabel!
    @IBOutlet weak var UserName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
