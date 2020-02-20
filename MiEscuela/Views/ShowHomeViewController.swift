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

    @IBAction func Return(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
