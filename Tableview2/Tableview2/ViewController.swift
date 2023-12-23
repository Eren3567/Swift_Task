//
//  ViewController.swift
//  Tableview2
//
//  Created by Eren Çetintaş on 23.12.2023.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   var isimdizisi = [grafik]()
    
    var kullanicisecimi : grafik?
    

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
        
        let isimler = grafik(isim: "isim1", detay:"detay1" , görsel: UIImage(named: "Ekran Resmi 2023-12-17 12.36.49")!)
        
        let isimler2 = grafik(isim: "isim2", detay: "detay2", görsel:UIImage(named: "Ekran Resmi 2023-12-17 12.37.16")! )
        
        let isimler3 = grafik(isim: "isim3", detay: "detay3", görsel:UIImage(named: "Ekran Resmi 2023-12-17 12.39.02")! )
        
        
    isimdizisi = [isimler,isimler2,isimler3]
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isimdizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimdizisi[indexPath.row].isim
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        kullanicisecimi = isimdizisi[indexPath.row]
        performSegue(withIdentifier: "toviewcontroller2vc", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toviewcontroller2vc"{
            
            let destination = segue.destination as! ViewController2
            
            destination.secilenisim = kullanicisecimi
        }
    }
    
    
}

