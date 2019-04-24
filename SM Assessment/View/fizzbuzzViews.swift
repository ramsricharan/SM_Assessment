//
//  fizzbuzzViews.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/22/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit

class fizzBuzzViews {
    
    private var currentViewController : UIViewController!
    private var rootView : UIView!
    
    
    ////////////////////////////////////////////////////////////
    ////////////////////    Initializing Methods  //////////////
    ////////////////////////////////////////////////////////////
    
    init(ViewController : UIViewController) {
        self.currentViewController = ViewController
        self.rootView = ViewController.view
    }
    
    
    ////////////////////////////////////////////////////////////
    ////////////////    Getter / Setter Methods  ///////////////
    ////////////////////////////////////////////////////////////
    public func setTableViewSources(delegate : UITableViewDelegate, dataSource : UITableViewDataSource) {
        ContentTableView.register(UITableViewCell.self, forCellReuseIdentifier: TABLE_CELL_ID)
        ContentTableView.delegate = delegate
        ContentTableView.dataSource = dataSource
    }
    
    
    
    ////////////////////////////////////////////////////////////
    ////////////////////    UIComponents  //////////////////////
    ////////////////////////////////////////////////////////////
    
    // Title View
    private lazy var TitleLabel : headerView = {
        let label = headerView()
        label.tabTitle = TabBarTitles.TAB1.PAGE_HEADER
        return label
    }()
    

    // TableView
    private lazy var ContentTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    
    func arrangeViews() {
        // Add TitleLabel
        rootView.addSubview(TitleLabel)
        TitleLabel.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        TitleLabel.widthAnchor.constraint(equalTo: rootView.widthAnchor, multiplier: 0.9).isActive = true
        TitleLabel.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        
        // Add TableView
        rootView.addSubview(ContentTableView)
        ContentTableView.topAnchor.constraint(equalTo: TitleLabel.bottomAnchor, constant: 8).isActive = true
        ContentTableView.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        ContentTableView.widthAnchor.constraint(equalTo: rootView.widthAnchor, multiplier: 0.9).isActive = true
        ContentTableView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
    }
    
}
