//
//  Tab3_InstaSelfiesVC.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/22/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import UIKit

class InstaSelfiesVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {


    lazy var gridViews : photoGridViews = photoGridViews(ViewController: self)
    lazy var modalView = photoModal()

    
    var ImageData : [ImageDetails] = [] {
        didSet {
            DispatchQueue.main.async {
                self.gridViews.photoCollection.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Downlaod data
        GetWebImages.downloadImages(completionHandler:  { results in
            self.ImageData = results
        })
        
        // Initialize views
        gridViews.arrangeViews()
        gridViews.initializeCollectionView(delegate: self, datasource: self)
        
        view.addSubviewToEntireView(childView: modalView)
        modalView.alpha = 0
        //modalView.isHidden = true
        
        // Adding long press gesture
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGR.minimumPressDuration = 0.5
        longPressGR.delaysTouchesBegan = true
        gridViews.photoCollection.addGestureRecognizer(longPressGR)
    }
    
    
    
    ////////////////////////////////////////////////////////////
    ////////////////////    Action Handlers  ///////////////////
    ////////////////////////////////////////////////////////////
    
    @objc func handleLongPress(_ longPressGR: UILongPressGestureRecognizer) {
        
        let p = longPressGR.location(in: self.gridViews.photoCollection)
        if let indexPath = self.gridViews.photoCollection.indexPathForItem(at: p) {
            
            let cell = self.gridViews.photoCollection.cellForItem(at: indexPath) as! photocell
            let currentImage = cell.cellImageView.image
            
            if longPressGR.state == .began {
                modalView.imageView.image = currentImage
                animateShowModal(myModal: modalView, from: p)
            }
            else if (longPressGR.state == .ended) {
                //modalView.isHidden = true
                animateHideModal(myModal: modalView, to: p)
                //modalView.resetImageView()

            }
        }
    }
    
    
    func animateShowModal(myModal : UIView, from origin : CGPoint) {
        myModal.alpha = 0
        myModal.transform = CGAffineTransform(scaleX: 0, y: 0)
        

        UIView.animate(withDuration: 0.3) {
            myModal.alpha = 1
            myModal.transform = .identity
        }
    }
    
    func animateHideModal(myModal : UIView, to origin : CGPoint) {
        myModal.alpha = 1
        UIView.animate(withDuration: 0.3) {
            myModal.alpha = 0
        }
    }
    
    
    ////////////////////////////////////////////////////////////
    /////\//////////    Collection View Methods  ///////////////
    ////////////////////////////////////////////////////////////
    
    // Total number of cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ImageData.count
    }
    
    // Set Content of the cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GRID_CELL_ID, for: indexPath) as! photocell

        if let imageURL = ImageData[indexPath.row % ImageData.count].urls.small {
            cell.cellImageView.loadImageFrom(url: imageURL)
        }
        return cell
    }
    
    // To dynamically change the size of the cell
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let bigCell = (view.frame.width) - 12
        let smallCell = bigCell/3
        
        let row = indexPath.row
        if(row % 10 == 0) {
            return CGSize(width: bigCell, height: bigCell)
        }
        else {
            return CGSize(width: smallCell, height: smallCell)
        }
    }

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath)
//        cell?.transform = CGAffineTransform(scaleX: 2, y: 2)
//    }

}


