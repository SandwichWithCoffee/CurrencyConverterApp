//
//  TabBarController.swift
//  CurrencyConverterApp
//
//  Created by 초코크림 on 2023/05/03.
//

import Foundation
import UIKit

class TabBarController: UITabBarController{
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.tabBar.items?[0].title = "Picker"
        self.tabBar.items?[0].image = UIImage(systemName: "filemenu.and.selection")
        
        self.tabBar.items?[1].title = "Table"
        self.tabBar.items?[1].image = UIImage(systemName: "list.bullet")
    }
}
