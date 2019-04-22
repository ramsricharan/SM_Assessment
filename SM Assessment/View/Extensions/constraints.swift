//
//  View+Extensions.swift
//  Map Racer
//
//  Created by Ram Sri Charan on 1/7/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addSubviewToEntireView(childView : UIView) {
        self.addSubview(childView)
        childView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        childView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        childView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        childView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    
//        childView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//        childView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//        childView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
//        childView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func addSubviewToEntireView(childView : UIView, paddingTop : CGFloat, paddingBottom : CGFloat, paddingLeft : CGFloat, paddingRight : CGFloat) {
        self.addSubview(childView)
        childView.topAnchor.constraint(equalTo: self.topAnchor, constant: paddingTop).isActive = true
        childView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -paddingBottom).isActive = true
        childView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: paddingLeft).isActive = true
        childView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -paddingRight).isActive = true
    }
    
    func addSubViewAtCenterXY (subView : UIView) {
        self.addSubview(subView)
        subView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}

