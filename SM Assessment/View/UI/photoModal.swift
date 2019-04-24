//
//  photoModal.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/24/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import UIKit

class photoModal: UIView {

    ////////////////////////////////////////////////////////////
    ////////////////////     Initializer   /////////////////////
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
    /////////////////    Getter setter methods  ////////////////
    ////////////////////////////////////////////////////////////
    public func resetImageView() {
        imageView.image = UIImage(imageLiteralResourceName: "downloading")
    }
    
    ////////////////////////////////////////////////////////////
    ////////////////////    UI Components  ////////////////////
    ////////////////////////////////////////////////////////////
    
    // Container
    private let baseContainer : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    // ImageView
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = UIView.ContentMode.scaleAspectFill
        imageView.image = UIImage(imageLiteralResourceName: "downloading")
        return imageView
    }()
    
    
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding blur background
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = UIScreen.main.bounds
        
        insertSubview(blurEffectView, at: 0)
        
        // Add containerView
        //addSubviewToEntireView(childView: baseContainer)
        
        // Add ImageView
        addSubview(imageView)
        imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }

}
