//
//  AddInfoSchoolViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 21/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI

class AddInfoSchoolViewController: UIViewController {
    @IBOutlet weak var addInfoNavBar: UINavigationBar!
    @IBOutlet weak var contentText: UITextView!
    @IBOutlet weak var photoSection: UIImageView!
    
    var ref: DocumentReference!
    var getRef: Firestore!
    var storageReference: StorageReference!
    var ad_school_id = UserDefaults.standard.string(forKey: "IDSchool")!
    var fecha = getCurrenDateString()
    
    @IBOutlet weak var titleText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    getRef = Firestore.firestore()
        
            
func dismissKeyboard() {
                view.endEditing(true)
            }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func selectionButton(_ sender: UIButton) {
        
        print("tapped button")
    }
    @IBAction func addPostButton(_ sender: UIButton) {
        addPostInfoSchool(ad_school_id: ad_school_id, fecha: fecha, image_url: "", title: titleText.text ?? "", contentText: contentText.text ?? "")
        
    }
    
    func addPostInfoSchool(ad_school_id : String, fecha : String , image_url : String, title : String, contentText : String) {
        let data:[String: Any] = ["ad_school_id":ad_school_id,
                                  "fecha":fecha,
                                  "image_url":image_url,
                                  "title":title,
                                  "contentText":contentText]
        
       ref = getRef.collection("info_school").addDocument(data: data ,completion: { (error) in
                    if let error = error{
                        print(error.localizedDescription)
                        
                    }else{
                        print("Se guaradaron los datos")
                        //
                    }
                    
                    
                })
                
        //        uploadImage(imageData: optimizedImage)
                self.dismiss(animated: true, completion: nil)
        
    }// Fin Funcion
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
