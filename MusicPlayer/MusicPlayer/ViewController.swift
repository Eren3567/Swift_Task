//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Eren Çetintaş on 3.02.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
var musicplayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        do  {
            
            let filepath = Bundle.main.path(forResource: "music", ofType: ".mp3")
            musicplayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: filepath!))
        }
        catch{
            print(error.localizedDescription)
        }
        
    }


    @IBAction func Label2(_ sender: Any) {
        
        musicplayer.play()
    }
    @IBAction func Button1(_ sender: Any) {
        musicplayer.stop()
    }
}

