//
//  ViewController.swift
//  CaseStudy
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import UIKit
import WebKit
class ViewController: UIViewController {
  
    
    @IBOutlet weak var WebKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:  "https://rss.itunes.apple.com/api/v1/us/books/top-free/all/ 100/non-explicit.json")!
              
              WebKit.load(URLRequest(url: url))
          }
    }




