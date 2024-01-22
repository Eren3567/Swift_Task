//
//  ViewController.swift
//  VideoView
//
//  Created by Eren Çetintaş on 21.01.2024.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func Start(_ sender: Any) {
        
        if let filePath = Bundle.main.path(forResource: "video", ofType: "mp4"){
            
            let player = AVPlayer(url: URL(fileURLWithPath: filePath))
            
            let playerController = AVPlayerViewController()
            
            playerController.player = player
            
            present(playerController, animated: true, completion: nil)
            
        }
    }
    
}
