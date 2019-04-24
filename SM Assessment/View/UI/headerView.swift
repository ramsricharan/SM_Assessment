//
//  HeaderView.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/23/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import UIKit

class headerView: UIView {

    ////////////////////////////////////////////////////////////
    ////////////////////    Initialization  ////////////////////
    ////////////////////////////////////////////////////////////
    override init(frame: CGRect){
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    ////////////////////////////////////////////////////////////
    ////////////////////    Getter Setter Methods  /////////////
    ////////////////////////////////////////////////////////////
    
    var tabTitle : String = "New Tab" {
        didSet {
            titleLabel.text = self.tabTitle
        }
    }
    
    ////////////////////////////////////////////////////////////
    ////////////////////    View Components  ///////////////////
    ////////////////////////////////////////////////////////////
    
    // Title label
    private let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.pinkTint
        label.text = TabBarTitles.TAB3.PAGE_HEADER
        return label
    }()
    
    private func setup() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubviewToEntireView(childView: titleLabel)
    }

}
