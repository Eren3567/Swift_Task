//
//  ViewController.swift
//  DictionaryUrl
//
//  Created by Eren Çetintaş on 31.01.2024.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate {
    @IBOutlet weak var Table: UITableView!
    
    @IBOutlet weak var Search: UISearchBar!
    
    var dictionayList = [Kelimeler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.delegate = self
        Table.dataSource = self
        Search.delegate = self
        
        allDictionaryGet()
    }
    
    func allDictionaryGet() {
        let url = URL(string: "http://kasimadalan.pe.hu/sozluk/tum_kelimeler.php")
        
        URLSession.shared.dataTask(with: url) {data,response,error in
            
            if error != nil || data != nil {
                print("Error")
                return
            }
            do {
                
                let answer = try JSONDecoder().decode(SozlukCevap(from: data!))
                
                if let gelenKelimeListesi = answer.kelimeler{
                    
                    self.dictionayList = gelenKelimeListesi
                }
                
                DispatchQueue.main.async {
                    self.Table.reloadData()
                }
                
            }
            catch{ print(error.localizedDescription)}
            
        }
    }
}
    extension ViewController: UITableViewDelegate,UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dictionayList.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let dictionary1 = dictionayList[indexPath.row]
            let cell = Table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
            cell.Label1.text = dictionary1.ingilizce
            cell.Label2.text = dictionary1.turkce
        }
        
      
        
        
        
    }

