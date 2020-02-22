//
//  InfoTableViewCell.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 20/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var Contenttext: UITextView!
    
    
    @IBOutlet weak var TitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
