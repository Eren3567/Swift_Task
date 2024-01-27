//
//  TableViewCell.swift
//  DetailTableView
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import UIKit

protocol TableViewCellProtocol {
    
    func AddProtocol(indexpath : IndexPath)
    
    
}

class TableViewCell: UITableViewCell {
    
    var protocolcell : TableViewCellProtocol?
    var indexpath : IndexPath?
    
    @IBOutlet weak var Imageview: UIImageView!
    
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
    @IBAction func OrderButton(_ sender: Any) {
        
        protocolcell?.AddProtocol(indexpath: indexpath!)
    }
}
