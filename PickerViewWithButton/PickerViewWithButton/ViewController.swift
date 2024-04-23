//
//  ViewController.swift
//  PickerViewWithButton
//
//  Created by Eren Çetintaş on 23.01.2024.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var TextField: UITextField!
    
    var Picker : UIPickerView?
    var letter = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
Picker = UIPickerView()
        
        letter += ["araba","direksiyon","vites","tekerlek"]
        
        Picker?.dataSource = self
        Picker?.delegate = self
        
        TextField.inputView = Picker
        
        let toolbar = UIToolbar()
        toolbar.tintColor = .blue
        toolbar.sizeToFit()
        
        let Okbutton = UIBarButtonItem(title: "ok", style:.plain, target: self, action: #selector(self.okClick) )
        let cancelbutton = UIBarButtonItem(title: "cancel", style:.plain, target: self, action: #selector(self.cancelClick) )
        let spacebutton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        
        toolbar.setItems([Okbutton,spacebutton,cancelbutton], animated: true)
        TextField.inputAccessoryView = toolbar
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return letter.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return letter[row]
    }
       
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        TextField.text = letter[row]
    }
    @objc func cancelClick(){
        view.endEditing(true)
    }
    @objc func okClick(){
        
        TextField.text = ""
        TextField.placeholder = "Select Letter"
        view.endEditing(true)
    }
    
}

