//
//  ViewController.swift
//  TableViewCustomCell
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableViewName: UITableView!

    
    var namesArray = [Person]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TableViewName.dataSource = self
        TableViewName.delegate = self
        
        let k1 = Person(name: "name1",nameid: 2,phoneNumber: "979769")
        let k2 = Person(name: "name2",nameid: 3,phoneNumber: "979768")
        let k3 = Person(name: "name3",nameid: 4,phoneNumber: "979767")
        
        namesArray.append(k1)
        namesArray.append(k2)
        namesArray.append(k3)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return namesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewName.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath) as! TableViewCell
        
        
        let getPerson = namesArray[indexPath.row]
        cell.Label.text = getPerson.name
        return cell
    }
    
        
        
        
        
        
        
    }



