//
//  ViewController2.swift
//  Coredata
//
//  Created by Eren Çetintaş on 23.12.2023.
//

import UIKit
import CoreData

class ViewController2: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var ÜrünismiText: UITextField!
    @IBOutlet weak var ÜrünFiyatıText: UITextField!
    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var ÜrünBedeniText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(kapat))
           view.addGestureRecognizer(gesture)

        if let imageView = imageview {
            imageView.isUserInteractionEnabled = true
            let gestureimage = UITapGestureRecognizer(target: self, action: #selector(ac))
            imageView.addGestureRecognizer(gestureimage)
        } else {
            print("imageview is nil")
        }

        // Do any additional setup after loading the view.
    }
    @objc func kapat(){
        view.endEditing(true)
        
    }
    
    @objc func ac()
    {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        present(picker, animated: true, completion: nil)
       
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imageview.image = info[.originalImage] as? UIImage
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func KaydetButton(_ sender: Any) {
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appdelegate.persistentContainer.viewContext
        
        let alisveris = NSEntityDescription.insertNewObject(forEntityName: "Alisveris", into: context)
        
        alisveris.setValue(ÜrünismiText.text, forKey: "isim")
        alisveris.setValue(ÜrünBedeniText.text, forKey: "beden")
        if let Fiyat = Int(ÜrünBedeniText.text!)
        {
            
            alisveris.setValue(Fiyat, forKey: "fiyat")
        }
        alisveris.setValue(UUID(), forKey: "id")
        
        let data = imageview.image!.jpegData(compressionQuality: 0.5)
        alisveris.setValue(data, forKey: "gorsel")
        
        do {
            try context.save()
        }
        
        catch{
            print("hata")
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
