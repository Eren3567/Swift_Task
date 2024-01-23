//
//  ViewController.swift
//  PickerView
//
//  Created by Eren Çetintaş on 23.01.2024.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var Label: UILabel!
    
    
    @IBOutlet weak var Picker: UIPickerView!
    var showLetter = ""
    var letter = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Picker.delegate = self
        Picker.dataSource = self
        
        letter += ["a","b","c"]
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
     
        Label.text = letter[row]
        showLetter = letter[row]
    }
    
    
    
    @IBAction func Show(_ sender: Any) {
        print(showLetter)
    }
}
