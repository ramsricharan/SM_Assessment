//
//  photoGridViews.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/23/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit

class photoGridViews {
    
    
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
    /////////////////    Getter/Setter Methods  ////////////////
    ////////////////////////////////////////////////////////////
    
    public func initializeCollectionView(delegate: UICollectionViewDelegate, datasource: UICollectionViewDataSource) {
        self.photoCollection.register(photocell.self, forCellWithReuseIdentifier: GRID_CELL_ID)
        self.photoCollection.delegate = delegate
        self.photoCollection.dataSource = datasource
    }
    
    
    ////////////////////////////////////////////////////////////
    ////////////////////    UI Components  /////////////////////
    ////////////////////////////////////////////////////////////
    
    // Title View
    private lazy var titleLabel : headerView = {
        let label = headerView()
        label.tabTitle = TabBarTitles.TAB3.PAGE_HEADER
        return label
    }()
    
    // Collection View
    lazy var photoCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    
    
    func arrangeViews() {
        // Add header View
        rootView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: rootView.widthAnchor, multiplier: 0.9).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        
        // Add Collection View
        rootView.addSubview(photoCollection)
        photoCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        photoCollection.leftAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.leftAnchor, constant: 5).isActive = true
        photoCollection.rightAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.rightAnchor, constant: -5).isActive = true
        photoCollection.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
        
    }
}
