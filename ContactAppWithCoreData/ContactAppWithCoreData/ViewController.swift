//
//  ViewController.swift
//  ContactAppWithCoreData
//
//  Created by Eren Çetintaş on 11.02.2024.
//

import UIKit

class ViewController: UIViewController {

    var list = [String]()
    
    
    @IBOutlet weak var Search: UISearchBar!
    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        list = ["name1","name2","name3","name4","name5"]
        
        TableView.delegate = self
        TableView.dataSource = self
        Search.delegate = self
    }


}
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellContact", for: indexPath) as! TableViewCell
        
        cell.LabelCell.text = list[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ToDetail", sender: indexPath.row)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (UIContextualAction, UIView, boolValue) in
            print("delete: \(self.list[indexPath.row])")
        }
        
        let updateAction = UIContextualAction(style: .normal, title: "update") { (UIContextualAction, UIView, boolValue) in
            
            self.performSegue(withIdentifier: "ToUpdate", sender: indexPath.row)
        }
            return UISwipeActionsConfiguration(actions: [deleteAction,updateAction])
        }
    }
    
    
    

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(Search!)
    }
    }
    

