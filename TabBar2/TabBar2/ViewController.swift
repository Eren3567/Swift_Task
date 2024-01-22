//
//  ViewController.swift
//  TabBar2
//
//  Created by Eren Çetintaş on 20.01.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let tabitem = tabBarController?.tabBar.items{
            let item = tabitem[0]
            
            item.badgeValue = "8"
            
        }
        
        let apperance = UITabBarAppearance()
        
        apperance.backgroundColor = UIColor.systemGray4
        ChangeColor(itemapperance: apperance.stackedLayoutAppearance)
        ChangeColor(itemapperance: apperance.inlineLayoutAppearance)
        ChangeColor(itemapperance: apperance.compactInlineLayoutAppearance)

        tabBarController?.tabBar.standardAppearance = apperance
        tabBarController?.tabBar.scrollEdgeAppearance = apperance
    }
    func ChangeColor (itemapperance:UITabBarItemAppearance){
        // selected Situtation
        itemapperance.selected.iconColor = .green
        itemapperance.selected.titleTextAttributes = [.foregroundColor:UIColor.blue]
        itemapperance.selected.badgeBackgroundColor = .green
        // Unselected Situtation
        itemapperance.normal.iconColor = .yellow
        itemapperance.normal.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        itemapperance.normal.badgeBackgroundColor = .yellow
        
        
    }


}

