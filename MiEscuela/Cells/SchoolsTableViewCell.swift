//
//  SchoolsTableViewCell.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 16/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class SchoolsTableViewCell: UITableViewCell {

    @IBOutlet weak var NameSchoolLabel: UILabel!
    
    @IBOutlet weak var DescriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
