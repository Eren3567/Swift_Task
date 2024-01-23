//
//  ViewController.swift
//  DatePicker1
//
//  Created by Eren Çetintaş on 22.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var TimeText: UITextField!
    @IBOutlet weak var DateText: UITextField!
    
    @IBOutlet weak var datepicker: UIDatePicker!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var datePicker : UIDatePicker?
        
        datePicker = UIDatePicker()
        datepicker?.datePickerMode = .date
        DateText.inputView = datepicker
        
        datepicker?.addTarget(self, action: #selector(self.ShowDate(dataPicker:)), for: .valueChanged)
        
        let Touch = UITapGestureRecognizer(target: self, action: #selector(self.ShowDate(dataPicker:)))
        view.addGestureRecognizer(Touch)
    }
      
        @objc func ShowDate(dataPicker:UIDatePicker){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
      
            let getDate = dateFormatter.string(from: dataPicker.date)
            TimeText.text = getDate
            //view.endEditing(true)
        }
    @objc func TouchMethod(){
        view.endEditing(true)
        
    }
    }



