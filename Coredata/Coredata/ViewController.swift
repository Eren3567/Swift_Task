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
        isimdizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "isim"
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(verial), name: NSNotification.Name(rawValue: "verigirildi"), object: nil)
    }
    
    @objc func verial(){
        isimdizisi.removeAll(keepingCapacity: false)
        iddizisi.removeAll(keepingCapacity: false)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Alisveris")
        
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do {
            let sonuclar = try context.fetch(fetchRequest)
            
            for sonuc in  sonuclar as! [NSManagedObject]{
                
                if let isim = sonuc.value(forKey: "isim") as? String{
                    isimdizisi.append(isim)
                }
                if let id = sonuc.value(forKey: "id") as? UUID{
                    iddizisi.append(id)
                }
            }
            
            Tableview.reloadData()
        }
        catch{
            print("hatavar")
        }
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "veri girildi") , object: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
}

