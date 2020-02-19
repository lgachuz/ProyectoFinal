//
//  SchoolHomeViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 17/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI

class SchoolHomeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate  {
    
    
    
    

    @IBOutlet weak var NameSchoolLabel: UILabel!
    
    @IBOutlet weak var HomeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NameSchoolLabel.text = UserDefaults.standard.string(forKey: "NameSchool")
        HomeTableView.delegate = self
        HomeTableView.dataSource = self
        getNoticeAndInformation(IDSchool: UserDefaults.standard.string(forKey: "IDSchool") ?? "N/A")
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "housecell", for: indexPath) as! HomeTableViewCell
        
        cell.TitleLabel.text = "Aviso de fin de Cursos"
        cell.fechaLabel.text = "14-02-2020"
        print("lgm")
        
        return cell
    }
    
    func getNoticeAndInformation(IDSchool : String)  {
        
    }
    

}

