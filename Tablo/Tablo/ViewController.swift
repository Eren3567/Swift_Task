//
//  ViewController.swift
//  Tablo
//
//  Created by Eren Çetintaş on 19.12.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    
    
    @IBOutlet weak var tableview: UITableView!
    var resimler = [String]()
    var isimler = [String]()
    var   secilenisim = ""
         var   secilengörsel = ""
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableview.delegate = self
        tableview.dataSource = self
     
        isimler.append("resim1")
        isimler.append("resim2")
        isimler.append("resim3")
        isimler.append("resim4")
        
        
       
        
     resimler.append("Ekran Resmi 2023-12-17 12.36.49")
   resimler.append("Ekran Resmi 2023-12-17 12.39.02")
        resimler.append("Ekran Resmi 2023-12-17 12.39.27")
    resimler.append("Ekran Resmi 2023-12-17 12.41.23")
        
    }
    
  
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell()
        cell.textLabel!.text = isimler[indexPath.row]
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
   
        secilenisim = isimler[indexPath.row]
       secilengörsel = resimler[indexPath.row]
        performSegue(withIdentifier: "tosecondvc", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tosecondvc" {
            
            let destination = segue.destination as! SecondViewController
           
            destination.secilengörselismi = secilengörsel
            destination.secilenkahramanismi = secilenisim
        }
    }
}

