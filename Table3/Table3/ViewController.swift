//
//  ViewController.swift
//  Table3
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Table: UITableView!
    var username = [Class2]()
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.delegate = self
        Table.dataSource = self
        
       
        
        let k1 = Class2(name: "name1",nameid: 1,phoneNumber: "2324")
        let k2 = Class2(name: "name2",nameid: 2,phoneNumber: "2325")
        let k3 = Class2(name: "name3",nameid: 3,phoneNumber: "2326")
        
        username.append(k1)
        username.append(k2)
        username.append(k3)
        
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource,cellProtocol{
    func cellprotocoladd(indexpath: IndexPath) {
        print(username[indexpath.row].name)
    }
    
 
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return username.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        let getname = username[indexPath.row]
        cell.Label.text = "\(getname.name)-\(getname.phoneNumber)"
        
        cell.protocolCell = self
        cell.indexpath = indexPath
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let getname = username[indexPath.row]
        print(getname.name)
        print(getname.phoneNumber)
    }
    
    
    
    
    
    
    
    
    
}



