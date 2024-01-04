//
//  UploadViewController.swift
//  FirstFirebaseApplication
//
//  Created by Eren Çetintaş on 31.12.2023.
//

import UIKit

import FirebaseStorage
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var Resim: UIImageView!
    

    @IBOutlet weak var YorumText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Resim.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec))
        
        Resim.addGestureRecognizer(gestureRecognizer)
    }
    @objc func gorselSec (){
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        present(pickerController, animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        Resim.image = info[.originalImage] as? UIImage
    }

    @IBAction func KaydetButton(_ sender: Any) {
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media")
        
        if let data = Resim.image?.jpegData(compressionQuality: 0.5){
        
            let uuid = UUID().uuidString
            
            let imageReference = mediaFolder.child("\(uuid).jpg")
            imageReference.putData(data) { (StorageMetadata, Error) in
                if Error != nil{
                    
                    hatamesajıgönderelim(Title: "Hata", Message: Error?.localizedDescription ?? "Hata alındı, Tekrar Deneyelim" )
                }
                else{
                    imageReference.downloadURL { (URL, Error) in
                        if Error == nil {
                            
                            let imageURL = URL?.absoluteString
                            
                            if let imageURL = imageURL {
                                
                                let FireStoneDatabase = Firestore.firestore()
                                let FirestonePost = [ "gorselurl": imageURL, "yorum": self.YorumText.text!, "email" : Auth.auth().currentUser?.email! as Any, "tarih": FieldValue.serverTimestamp()] as [String : Any]
                                
                                
                                FireStoneDatabase.collection("Post").addDocument(data: FirestonePost) { (Error) in
                                    if Error != nil{
                                        hatamesajıgönderelim(Title: "Hata", Message: Error?.localizedDescription ?? "Hata mesajı aldiniz")
                                    
                                    }
                                    else   {
                                        
                                    }
                                }
                                }
                        }
                    }
                            
                        
                    
                    }
            }
        }
        func hatamesajıgönderelim (Title : String, Message : String){
            
            let alert = UIAlertController(title: Title, message: Message, preferredStyle: UIAlertController.Style.alert)
            let Okbutton = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(Okbutton)
            
            self.present(alert, animated: true, completion: nil)
            
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

}
