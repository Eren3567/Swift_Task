//
//  ViewController.swift
//  SliderStepper
//
//  Created by Eren Çetintaş on 21.01.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Text: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SliderAction(_ sender: UISlider) {
        Label2.text = " Slider: \(Int(sender.value))"
    }
    
    @IBAction func StepperAction(_ sender: UIStepper) { Label.text = " Stepper: \(Int(sender.value))"
    }
    
}

