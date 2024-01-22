//
//  ViewController.swift
//  WebView
//
//  Created by Eren Çetintaş on 21.01.2024.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    @IBOutlet weak var WebKit: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
  let url = URL(string:  "https://gelecegiyazanlar.turkcell.com.tr/")!
        
        WebKit.load(URLRequest(url: url))
    }
  

}

