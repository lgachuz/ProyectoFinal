//
//  ShowHomeViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 19/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit

class ShowHomeViewController: UIViewController {

    @IBOutlet weak var NavBar: UINavigationBar!
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var textoLabel: UILabel!
    
    var dataNoticeSchools: NoticeSchool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TitleLabel.text = dataNoticeSchools.name
        textoLabel.text = dataNoticeSchools.largetext
        NavBar.topItem?.title = UserDefaults.standard.string(forKey: "NameSchool")
    }

    @IBAction func Return(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
