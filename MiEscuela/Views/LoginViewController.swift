//
//  LoginViewController.swift
//  MiEscuela
//
//  Created by Luis Gachuz Trabajo on 22/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var ad_school_id : String = getSchoolID()
    var nameSchool : String = getNameSchool()

    @IBOutlet weak var emailTexrFiel: UITextField!
    @IBOutlet weak var lognNavBar: UINavigationBar!
    @IBOutlet weak var passwordTextFiel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        lognNavBar.topItem?.title = nameSchool
    }
    

    @IBAction func cancelloginButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func loginActionButton(_ sender: UIButton) {
    }
}
