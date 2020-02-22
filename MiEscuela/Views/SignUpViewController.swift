//
//  SignUpViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 22/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var ad_school_id : String = getSchoolID()
    var nameSchool : String = getNameSchool()

    @IBOutlet weak var signNavBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signNavBar.topItem?.title = nameSchool
        
    }
    
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
