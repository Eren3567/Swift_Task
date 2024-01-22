//
//  ViewController.swift
//  NavigationControllerIntroduction
//
//  Created by Eren Çetintaş on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // self.navigationItem.title = "Title with Code"
        // self.navigationItem.prompt = "Explaination with Code"
        // self.navigationItem.largeTitleDisplayMode = .never
        let resim = UIImage(named: "resim1")
        self.navigationItem.titleView = UIImageView(image: resim)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let apperance = UINavigationBarAppearance()
        
        apperance.backgroundColor = .systemBlue
        apperance.titleTextAttributes = [.foregroundColor: UIColor.white]
        apperance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        // plus button color is changing with white
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.barStyle = .black
        
        // option
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
    }
        
        @IBAction func Segment(_ sender: UISegmentedControl) {
            
            
            switch sender.selectedSegmentIndex {
            case 0:
                print("aaaaaaaaa")
            case 1:
                print("bbbbbbb")
            default:
                break
            }
        }
        
    }
    

