//
//  squareDrawViews.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/22/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit

class squareDrawViews {
    
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
    /////////////    Getter Setter Methods  ////////////////////
    ////////////////////////////////////////////////////////////
    public func getContainerView() -> UIView {
        return baseView
    }
    
    public func handleContainerTouches(action : Selector) {
        let tap = UITapGestureRecognizer(target: currentViewController, action: action)
        baseView.addGestureRecognizer(tap)
    }
    
    public var tapCount : Int = 0 {
        didSet {
            tapCountLabel.text = TAP_COUNT + "\(tapCount)"
        }
    }
    
    public func handleClearButtonTap(action : Selector) {
        clearButton.addTarget(currentViewController, action: action, for: .touchUpInside)
    }
    
    ////////////////////////////////////////////////////////////
    ////////////////////    UI Components   ////////////////////
    ////////////////////////////////////////////////////////////
    
    // Title View
    private lazy var titleLabel : headerView = {
        let label = headerView()
        label.tabTitle = TabBarTitles.TAB2.PAGE_HEADER
        return label
    }()
    
    // Container to add squares
    private let baseView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private let infoBoxView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    // Tap counter
    private let tapCountLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = TAP_COUNT + "0"
        return label
    }()
    
    // Clear button
    private let clearButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(CLEAR_BUTTON, for: .normal)
        button.setTitleColor(.red, for: .normal)
        return button
    }()
    
    
    func arrangeViews() {
        // Add the title label
        rootView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: rootView.widthAnchor, multiplier: 0.9).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        
        // Add the container view
        rootView.addSubview(baseView)
        baseView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8).isActive = true
        baseView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        baseView.widthAnchor.constraint(equalTo: rootView.widthAnchor, multiplier: 0.9).isActive = true
        
        
        
        // Add the info container
        rootView.addSubview(infoBoxView)
        infoBoxView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        infoBoxView.widthAnchor.constraint(equalTo: rootView.widthAnchor, multiplier: 0.9).isActive = true
        infoBoxView.topAnchor.constraint(equalTo: baseView.bottomAnchor, constant: 8).isActive = true
        infoBoxView.centerXAnchor.constraint(equalTo: rootView.centerXAnchor).isActive = true
        infoBoxView.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        // Add other info related views to info container
            // Add tap Counter
            infoBoxView.addSubview(tapCountLabel)
            tapCountLabel.leftAnchor.constraint(equalTo: infoBoxView.leftAnchor, constant: 16).isActive = true
            tapCountLabel.centerYAnchor.constraint(equalTo: infoBoxView.centerYAnchor).isActive = true
            tapCountLabel.widthAnchor.constraint(equalTo: infoBoxView.widthAnchor, multiplier: 0.7, constant: -(16+2)).isActive = true
        
            // Add clear button
            infoBoxView.addSubview(clearButton)
            clearButton.leftAnchor.constraint(equalTo: tapCountLabel.rightAnchor, constant: 4).isActive = true
            clearButton.centerYAnchor.constraint(equalTo: infoBoxView.centerYAnchor).isActive = true
            clearButton.rightAnchor.constraint(equalTo: infoBoxView.rightAnchor, constant: -8).isActive = true
            clearButton.widthAnchor.constraint(equalTo: infoBoxView.widthAnchor, multiplier: 0.3, constant: -(8+2)).isActive = true
        
        
        
    }
    
}
