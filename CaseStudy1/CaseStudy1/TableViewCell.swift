//
//  TableViewCell.swift
//  CaseStudy1
//
//  Created by Eren Çetintaş on 2.02.2024.
//

import UIKit
protocol StarIconDelegate: AnyObject {
    func starIconTapped(at indexPath: IndexPath)
}
class TableViewCell: UITableViewCell {
    
    weak var delegate: StarIconDelegate?
        var indexPath: IndexPath?
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var Label1: UILabel!
    
    @IBOutlet weak var iconimage1: UIImageView!
    @IBOutlet weak var image2: UIButton!
    @IBOutlet weak var Label2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
