//
//  ViewController.swift
//  Coredata
//
//  Created by Eren Çetintaş on 23.12.2023.
//

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 
    @IBOutlet weak var Tableview: UITableView!
    
    
    var isimdizisi = [String]()
    var iddizisi = [UUID]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        verial()
        // Set the background color directly on the table view
                Tableview.backgroundColor = UIColor.yellow
                
                // Alternatively, you can set a background view with yellow color
                let yellowBackgroundView = UIView()
                yellowBackgroundView.backgroundColor = UIColor.yellow
        Tableview.backgroundView = yellowBackgroundView

        if let tableView = Tableview {
            tableView.delegate = self
            tableView.dataSource = self
        } else {
            print("Tableview is nil")
        }

                // Do any additional setup after loading the view.
        navigationController?.navigationBar.topItem?.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(metot))]
        
        
        
    }

    @objc func metot() {
        
        performSegue(withIdentifier: "Toviewcontroller2vc", sender: nil)
       
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isimdizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
            // Set the text label to the corresponding name from the data source
        cell.textLabel?.text = isimdizisi[indexPath.row]
            return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
      verial()
    
    }
    
 func verial() {
        isimdizisi.removeAll(keepingCapacity: false)
        iddizisi.removeAll(keepingCapacity: false)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let sonuclar = try context.fetch(fetchRequest)
            
            for sonuc in sonuclar as! [NSManagedObject] {
                if let isim = sonuc.value(forKey: "isim") as? String {
                    isimdizisi.append(isim)
                }
                if let id = sonuc.value(forKey: "id") as? UUID {
                    iddizisi.append(id)
                }
                if let beden = sonuc.value(forKey: "beden") as? String {
                    isimdizisi.append(beden)
                }
                if let fiyat = sonuc.value(forKey: "fiyat") as? String {
                    isimdizisi.append(fiyat)
                }
            }
            
            Tableview.reloadData()
        } catch {
            print("Error fetching data: \(error.localizedDescription)")
        }
    }

    
}

