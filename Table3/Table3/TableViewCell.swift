//
//  TableViewCell.swift
//  Table3
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import UIKit

protocol cellProtocol {
    
    func cellprotocoladd (indexpath : IndexPath)
     
    
}
class TableViewCell: UITableViewCell {
    @IBOutlet weak var Label: UILabel!
    var  protocolCell : cellProtocol?
    var indexpath : IndexPath?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func Add(_ sender: Any) {
        
        protocolCell?.cellprotocoladd(indexpath: indexpath!)
    }
}
