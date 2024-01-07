//
//  ListViewController.swift
//  Map3
//
//  Created by Eren Çetintaş on 26.12.2023.
//

import UIKit
import CoreData

class ListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
var isimDizisi = [String]()
var idDizisi = [UUID]()
    var secilenyerismi = ""
    var secilenYerid : UUID?

    @IBOutlet weak var tableViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewController.delegate = self
        tableViewController.dataSource = self
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add,target: self,action: #selector(artıbutonutiklandı))
        // Do any additional setup after loading the view.
        verial()
    }
    @objc func artıbutonutiklandı(){
        secilenyerismi = ""
        performSegue(withIdentifier: "ToMapsControllervc", sender: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(verial), name: NSNotification.Name("YeniYerOlusturuldu"), object: nil)
    }
    
   @objc func verial(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Yer")
        
        request.returnsObjectsAsFaults = false
        
        do {
            let sonuclar = try context.fetch(request)
            
            if sonuclar.count > 0 {
                
                isimDizisi.removeAll(keepingCapacity: false)
                idDizisi.removeAll(keepingCapacity: false)
                for sonuc in sonuclar as! [NSManagedObject]{
                    if let isim = sonuc.value(forKey: "ad") as? String  {
                        isimDizisi.append(isim)
                    }
                    if let id = sonuc.value(forKey: "id") as? UUID {
                        idDizisi.append(id)
                    }
                    
                }
                tableViewController.reloadData()
                
            }
            
        }catch{
            
            print("hata var")
        }
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isimDizisi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = isimDizisi[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        secilenyerismi = isimDizisi[indexPath.row]
        secilenYerid = idDizisi[indexPath.row]
        performSegue(withIdentifier: "ToMapsControllervc", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ToMapsControllervc" {
            
            let destinationVC = segue.destination as! MapsViewController
            destinationVC.secilenisim = secilenyerismi
            destinationVC.secilenId = secilenYerid
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
