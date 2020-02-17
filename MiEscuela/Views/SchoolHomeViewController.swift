//
//  SchoolHomeViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 17/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class SchoolHomeViewController: UIViewController {

    @IBOutlet weak var NameSchoolLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameSchoolLabel.text = UserDefaults.standard.string(forKey: "NameSchool")
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
