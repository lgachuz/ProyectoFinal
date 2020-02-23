//
//  UserInfoViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 22/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    var ad_school_id : String = getSchoolID()
    var nameSchool : String = getNameSchool()
    
    @IBOutlet weak var infoUserNavBar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()

//        infoUserNavBar.topItem?.title = nameSchool
    }
    

    
}
