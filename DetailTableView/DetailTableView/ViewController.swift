//
//  ViewController.swift
//  DetailTableView
//
//  Created by Eren Çetintaş on 27.01.2024.
//

import UIKit
//
class ViewController: UIViewController {
 var mealList = [Class2]() //Neyin listesini neye atıyor ?
    
    @IBOutlet weak var Table: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Table.dataSource = self
        Table.delegate = self
        // Class2 about y1, y2, y3, y4 for mealname, mealimage, mealprice
        let y1 = Class2(mealid: 1, mealname: "Ayran", mealimage: "ayran", mealPrice: 3)
        let y2 = Class2(mealid: 2, mealname: "Baklava", mealimage: "baklava", mealPrice: 20)
        let y3 = Class2(mealid: 3, mealname: "Fanta", mealimage: "fanta", mealPrice: 6)
        let y4 = Class2(mealid: 4, mealname: "Izgara Somon", mealimage: "izgarasomon", mealPrice: 30)
        let y5 = Class2(mealid: 5, mealname: "Izgara Tavuk", mealimage: "izgaratavuk", mealPrice: 20)
        let y6 = Class2(mealid: 6, mealname: "Kadayıf", mealimage: "kadayif", mealPrice: 40)
        let y7 = Class2(mealid: 7, mealname: "Kahve", mealimage: "kahve", mealPrice: 45)
        let y8 = Class2(mealid: 8, mealname: "Köfte", mealimage: "kofte", mealPrice: 20)
        let y9 = Class2(mealid: 9, mealname: "Lazanya", mealimage: "lazanya", mealPrice: 15)
        let y10 = Class2(mealid: 10, mealname: "Makarna", mealimage: "makarna", mealPrice: 12)
        let y11 = Class2(mealid: 11, mealname: "Pizza", mealimage: "pizza", mealPrice: 16)
        let y12 = Class2(mealid: 12, mealname: "Su", mealimage: "su", mealPrice: 1)
        let y13 = Class2(mealid: 13, mealname: "Sütlaç", mealimage: "sutlac", mealPrice: 12)
        let y14 = Class2(mealid: 14, mealname: "Tiramisu", mealimage: "tiramisu", mealPrice: 18)
        
        //mealList for y1,y2,y3
        mealList.append(y1)
        mealList.append(y2)
        mealList.append(y3)
        mealList.append(y4)
        mealList.append(y5)
        mealList.append(y6)
        mealList.append(y7)
        mealList.append(y8)
        mealList.append(y9)
        mealList.append(y10)
        mealList.append(y11)
        mealList.append(y12)
        mealList.append(y13)
        mealList.append(y14)
        
    }


}

//get mealList from table context view
extension ViewController: UITableViewDelegate,UITableViewDataSource,TableViewCellProtocol{
    func AddProtocol(indexpath: IndexPath) {
        let getmeal = mealList[indexpath.row]
        print(getmeal.mealname)
        print(getmeal.mealimage)
        print("\(getmeal.mealPrice) TL ")
    }//end extension
    
   // return -> numberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealList.count
    }//end func
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let getmeal = mealList[indexPath.row]
        let cell = Table.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        
        cell.Label1.text = getmeal.mealname
        cell.Label2.text = "\(String(getmeal.mealPrice)) TL"
        cell.Imageview.image = UIImage(named: getmeal.mealimage)
        
        cell.protocolcell = self
        cell.indexpath = indexPath
        
        
        return cell
        

    }//End class
    
    
    
    
    
    
    
    
    
}
