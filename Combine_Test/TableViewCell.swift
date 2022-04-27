//
//  TableViewCell.swift
//  Combine_Test
//
//  Created by arshad on 4/27/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let TableViewCellIdentifier = "TableViewCell"
    static let TableViewCellNib = UINib(nibName: "TableViewCell", bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
