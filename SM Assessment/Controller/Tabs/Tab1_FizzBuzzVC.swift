//
//  FizzBuzzVC.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/22/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import UIKit

class FizzBuzzVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var baseViews = fizzBuzzViews(ViewController: self)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Setup Views
        baseViews.setTableViewSources(delegate: self, dataSource: self)
        baseViews.arrangeViews()
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1000
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TABLE_CELL_ID, for: indexPath as IndexPath)
        let tempVal = getFizzBuzzValue(number: indexPath.row+1)
        cell.textLabel?.text = tempVal.value
        cell.textLabel?.textColor = tempVal.textColor
        
        return cell
    }
    
    
    // Check if the cell is FizzBuzz
    private func getFizzBuzzValue(number : Int) -> FizzBuzzModal {
        var result = ""
        var color = UIColor.darkText
        
        if(number % 3 == 0) {
            result += "Fizz"
            color = UIColor.red
        }
        if(number % 5 == 0) {
            result += "Buzz"
            color = color == UIColor.darkText ? UIColor.green : UIColor.magenta
        }
        if(result == "") {
            result += "\(number)"
            color = UIColor.darkText
        }
        return FizzBuzzModal(value: result, textColor: color)
    }
    

}
