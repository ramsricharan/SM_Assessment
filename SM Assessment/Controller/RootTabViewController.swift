//
//  ViewController.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/22/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import UIKit

class RootTabViewController : UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.yellow
        
        let allTabs = getTabs()
        viewControllers = allTabs
        
    }
    
    
    private func getTabs() -> [UIViewController] {
        
        // Tab #1: FizzBuzz table
        let tab1 = FizzBuzzVC()
        tab1.tabBarItem = UITabBarItem(title: TabBarTitles.TAB1.BAR_ITEM, image: UIImage(named: "tab1_fizzbuzz"), tag: 0)
        
        // Tab #2: Draw squares on touch
        let tab2 = DrawSquaresVC()
        tab2.tabBarItem = UITabBarItem(title: TabBarTitles.TAB2.BAR_ITEM, image: UIImage(named: "tab2_square"), tag: 1)
        
        // Tab #3: Instagram Selfies grid
        let tab3 =  InstaSelfiesVC()
        tab3.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 2)
        tab3.tabBarItem = UITabBarItem(title: TabBarTitles.TAB3.BAR_ITEM, image: UIImage(named: "tab3_board"), tag: 2)
        
        return [tab1, tab2, tab3]
    }


}

