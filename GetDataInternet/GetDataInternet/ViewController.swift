//
//  ViewController.swift
//  GetDataInternet
//
//  Created by Eren Çetintaş on 29.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")!
        
        Webservice().downloadNews(url: url) { (News) in
            if let News = News {
                print(News)
            }
        }
    }


}

