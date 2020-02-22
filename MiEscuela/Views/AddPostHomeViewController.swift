//
//  AddPostHomeViewController.swift
//  MiEscuela
//
//  Created by Luis Alberto Gachuz Morales on 19/02/20.
//  Copyright © 2020 Luis Alberto Gachuz Morales. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import MobileCoreServices
import FirebaseStorage
import FirebaseUI

class AddPostHomeViewController: UIViewController ,UITextViewDelegate{
    var ref: DocumentReference!
    var getRef: Firestore!
    var storageReference: StorageReference!
    
    var ad_school_id = UserDefaults.standard.string(forKey: "IDSchool")!
    
    var image_url = ""
    
    var fecha = getCurrenDateString()
    
    
    @IBOutlet weak var messageText: UITextView!
    @IBOutlet weak var titleLabel: UITextField!
    
    @IBOutlet weak var PhotoImage: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRef = Firestore.firestore()
      //  let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
//view.addGestureRecognizer(tap)
        
        self.messageText.delegate = self
        self.messageText.layer.borderWidth = 1.0
        
       //
        
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    @IBAction func selectPhotoButton(_ sender: UIButton) {
        print("Seleccionando foto")
    }
    
    @IBAction func actionPost(_ sender: Any) {
        postNoticeSchool(ad_school_id: self.ad_school_id, fecha: self.fecha, image_url: self.image_url, largetext: self.messageText.text ?? "", name: self.titleLabel.text ?? "" )
    }
    
    func postNoticeSchool(ad_school_id: String , fecha : String , image_url :String , largetext : String, name : String){
        
        let data:[String: Any] = ["ad_school_id":ad_school_id,
                                      "fecha":fecha,
                                      "image_url":image_url,
                                      "largetext":largetext,
                                      "name":name]
            
            
            
                ref = getRef.collection("notice_school").addDocument(data: data ,completion: { (error) in
                if let error = error{
                    print(error.localizedDescription)
                    
                }else{
                    print("Se guaradaron los datos")
                    //
                }
                
                
            })
            
    //        uploadImage(imageData: optimizedImage)
            self.dismiss(animated: true, completion: nil)
        }

    @IBAction func cancelar(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
}
