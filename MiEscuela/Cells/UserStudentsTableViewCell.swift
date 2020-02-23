//
//  UserStudentsTableViewCell.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 23/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class UserStudentsTableViewCell: UITableViewCell {

    @IBOutlet weak var StudentNamaLabel: UILabel!
    
    @IBOutlet weak var gradoGrupoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
