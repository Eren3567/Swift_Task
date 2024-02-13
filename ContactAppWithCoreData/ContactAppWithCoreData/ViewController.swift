//
//  ViewController.swift
//  ContactAppWithCoreData
//
//  Created by Eren Çetintaş on 11.02.2024.
//

import UIKit
import CoreData

let appdelegate = UIApplication.shared.delegate as! AppDelegate
class ViewController: UIViewController {
    let context1 = appdelegate.persistentContainer.viewContext
    var aramaYapiliyorMu = false
    var aramaKelimesi:String?
    var contactList = [Contacts]()
    
    
    @IBOutlet weak var Search: UISearchBar!
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
 
    
        TableView.delegate = self
        TableView.dataSource = self
        Search.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        getAllContact()
        
        if aramaYapiliyorMu {
           searchDo(phoneName: aramaKelimesi!)
        }else{
            getAllContact()
        }
        
       TableView.reloadData()
    }
    func getAllContact(){
        do {
            contactList = try context1.fetch(Contacts.fetchRequest())
            TableView.reloadData()

        } catch  {
            print("error")
        }
        for p in contactList {
            
            print(p.phoneName!)
            print(p.phoneNumber2)
           
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
         
         if segue.identifier == "toDetail" {
             let gidilecekVC = segue.destination as! ViewControllerDetail
             gidilecekVC.kisi    = contactList[indeks!]
         }
         
         if segue.identifier == "toUpdate" {
             let gidilecekVC = segue.destination as! ViewControllerUpdate
             gidilecekVC.kisi = contactList[indeks!]
             
         }
    }
    
    func save (){
        
        let p = Contacts(context: context1)
        
        p.phoneName = "name10"
        p.phoneNumber2 = "12345"
        
        appdelegate.saveContext()
        
    }
    
    func searchDo(phoneName:String){
        
        let fetchRequest:NSFetchRequest<Contacts> = Contacts.fetchRequest()
        
        fetchRequest.predicate = NSPredicate(format: "phoneName CONTAINS %@" , phoneName)
        
        do {
            contactList = try context1.fetch(fetchRequest)
        } catch  {
            print(error)
        }
    }
    
        
}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contactList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellContact", for: indexPath) as! TableViewCell
        let array1 = contactList[indexPath.row]
        if let phoneName = array1.phoneName, let phoneNumber2 = array1.phoneNumber2 {
            cell.LabelCell.text = "\(phoneName)-\(phoneNumber2)"
        } else {
            // Opsiyonel değerler nil ise, bir varsayılan değer kullanabilirsiniz
            cell.LabelCell.text = "No Name - No Number"
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDetail", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (UIContextualAction, UIView, boolValue) in
            print("delete: \(self.contactList[indexPath.row])")
            let kisi = self.contactList[indexPath.row]
            
            self.context1.delete(kisi)
            
            appdelegate.saveContext()
            
            if self.aramaYapiliyorMu {
                self.searchDo(phoneName: self.aramaKelimesi!)
            }else{
                self.getAllContact()
            }
            
            self.TableView.reloadData()
            
        }
        
        let updateAction = UIContextualAction(style: .normal, title: "update") { (UIContextualAction, UIView, boolValue) in
            
            self.performSegue(withIdentifier: "ToUpdate", sender: indexPath.row)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction,updateAction])
    }
    
}
    
    
    
    
    extension ViewController: UISearchBarDelegate {
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            print("Arama sonuç : \(searchText)")
            
            aramaKelimesi = searchText
            
            if searchText == "" {
                 aramaYapiliyorMu = false
                 getAllContact()
            }else{
                 aramaYapiliyorMu = true
               searchDo(phoneName: aramaKelimesi!
               )
            }
            
    TableView.reloadData()
            
        }
    }
    
    

