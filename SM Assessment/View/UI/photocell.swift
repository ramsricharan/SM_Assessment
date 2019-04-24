//
//  photocell.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/23/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit

class photocell : UICollectionViewCell {
    
    
    ////////////////////////////////////////////////////////////
    ////////////////////    Initialization  ////////////////////
    ////////////////////////////////////////////////////////////
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    ////////////////////////////////////////////////////////////
    ////////////////////    View Components  ////////////////////
    ////////////////////////////////////////////////////////////
    let cellImageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .yellow
        image.image = UIImage(imageLiteralResourceName: "downloading")
        image.contentMode = UIView.ContentMode.scaleAspectFill
        image.clipsToBounds = true
        return image
    }()

    func arrangeViews() {
        addSubviewToEntireView(childView: cellImageView)
    }
    
}
