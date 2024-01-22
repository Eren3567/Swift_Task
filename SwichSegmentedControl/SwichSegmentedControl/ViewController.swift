//
//  ViewController.swift
//  SwichSegmentedControl
//
//  Created by Eren Çetintaş on 21.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func SwichAction(_ sender: UISwitch) {
        if sender.isOn{
            print("swich on")
        }
        else{
            print("swich off")
        }
    }
    

    @IBAction func SegmentAction(_ sender: UISegmentedControl) {
      if  sender.selectedSegmentIndex == 0 {
            print("Segment on")
        }
        else if sender.selectedSegmentIndex == 1{
                print("Segment off")
            }
            
        }
    }


