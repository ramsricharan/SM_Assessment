//
//  Tab2_DrawSquaresVC.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/22/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import UIKit



class DrawSquaresVC: UIViewController {

    var drawnSquare : [UIView] = []
    var availableSlots : [UIView] = []
    var squareSide : CGFloat = 100
    var baseContainerView : UIView!
    
    lazy var baseViews = squareDrawViews(ViewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Arranging the Views
        baseViews.arrangeViews()
        baseViews.handleContainerTouches(action: #selector(containerTapped))
        baseViews.handleClearButtonTap(action: #selector(clearSquaresHandler))
    }
    
    var once = true
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if once {
            once = false
            // process here
            print(self.view.frame)
            baseContainerView = baseViews.getContainerView()
            squareSide = baseContainerView.frame.width/10
            print(baseContainerView.frame)

        }
    }
    
    ////////////////////////////////////////////////////////////
    ////////////////////    Action Handlers  ////////////////////
    ////////////////////////////////////////////////////////////
    
    @objc func containerTapped(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: baseContainerView)
        
        guard let square = checkAndMakeSquare(point: point) else {
            print("no more space...")
            showAlert(AlertTitle: OUT_OF_SPACE_TITLE, Message: OUT_OF_SPACE_MESSAGE +  "\(drawnSquare.count) squares.")
            return
        }
        stampTheBox(square: square, number: drawnSquare.count+1)
        self.baseContainerView.addSubview(square)
        drawnSquare.append(square)
        availableSlots.append(square)
        baseViews.tapCount = drawnSquare.count
        // print("Drawn Square= \(drawnSquare.count) --- Available Slots= \(availableSlots.count)")
    }
    
    @objc func clearSquaresHandler() {
        print("Clearing the squares.")
        for subView in baseContainerView.subviews {
            subView.removeFromSuperview()
        }
        
        drawnSquare.removeAll()
        availableSlots.removeAll()
        baseViews.tapCount = drawnSquare.count
    }
    
    
    ////////////////////////////////////////////////////////////
    ////////////////////    Helper Methods  ////////////////////
    ////////////////////////////////////////////////////////////
    
    func checkAndMakeSquare(point : CGPoint) -> UIView? {
        let newSquare = makeSquareWith(center: point)
        
        if(drawnSquare.isEmpty) {
            return newSquare
        }
        
        // Check if it intersects and existing squares
        for square in drawnSquare {
            if(square.frame.intersects(newSquare.frame)) ||
              (!self.baseContainerView.bounds.contains(newSquare.frame))
            {
                print("Overlap found")
                return getNewSquare()
            }
        }
        return newSquare
    }
    
    
    // Generates a non overlapping square based on availability
    func getNewSquare() -> UIView? {
        let offset = squareSide + 1
        
        for square in availableSlots {
            // Left slot
            let slot1 = makeSquareWith(center: CGPoint(x: square.center.x - offset, y: square.center.y))
            if(!isOverlapping(newSquare: slot1)) {
                // Return this slot
                print("No overlap for slot1")
                return slot1
            }
            
            // Right slot
            let slot2 = makeSquareWith(center: CGPoint(x: square.center.x + offset, y: square.center.y))
            if(!isOverlapping(newSquare: slot2)) {
                // Return this slot
                print("No overlap for slot2")
                return slot2
            }

            // Top slot
            let slot3 = makeSquareWith(center: CGPoint(x: square.center.x, y: square.center.y-offset))
            if(!isOverlapping(newSquare: slot3)) {
                // Return this slot
                print("No overlap for slot3")
                return slot3
            }

            
            // Bottom slot
            let slot4 = makeSquareWith(center: CGPoint(x: square.center.x, y: square.center.y+offset))
            if(!isOverlapping(newSquare: slot4)) {
                // Return this slot
                print("No overlap for slot4")
                return slot4
            }

            print("Removed current slot")
            availableSlots.removeFirst()
        }
        
        return nil
    }
    
    
    // Check if the new square is out of container or intersects with any other drawn squares
    func isOverlapping(newSquare : UIView) -> Bool {
        
//        print("==== Checking for overlaps =====")
//        print("Current newSquare frame \(newSquare.frame)")

        // Check if it is out of container
        if(!self.baseContainerView.bounds.contains(newSquare.frame)) {
            print("Out of frame")
            return true
        }
        
        for drawn in drawnSquare {
            if(drawn.frame.intersects(newSquare.frame)) {
//                print(" ---- Drawn frame \n \(drawn.frame) \nintersects \n newSquare frame : \(newSquare.frame) ----")
                return true
            }
        }
        return false
    }
    
    // Create Square UIViews
    private func makeSquareWith(center : CGPoint) -> UIView {
        let sideOffset : CGFloat = squareSide/2
        let square = UIView(frame: CGRect(x: center.x - sideOffset, y: center.y - sideOffset, width: squareSide, height: squareSide))
        square.backgroundColor = UIColor.pinkTint
        return square
    }
    
    private func stampTheBox(square : UIView, number : Int) {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(number)"
        label.textColor = UIColor.white
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        label.backgroundColor = .clear
        
        square.addSubview(label)
        label.heightAnchor.constraint(equalToConstant: squareSide/2).isActive = true
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: square.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: square.centerXAnchor).isActive = true
    }

}


