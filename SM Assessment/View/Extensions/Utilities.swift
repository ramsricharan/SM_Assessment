//
//  Utilities.swift
//  SM Assessment
//
//  Created by Ram Sri Charan on 4/23/19.
//  Copyright © 2019 Ram Sri Charan. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController
{
    func showAlert(AlertTitle: String, Message : String)
    {
        let alert = UIAlertController(title: AlertTitle, message: Message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}



// UIImageView extensions
extension UIImageView
{
    func loadImageFrom(url imageURL: String) {
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if(error == nil) {
                    if let data = data {
                        DispatchQueue.main.async() {
                            self.image = UIImage(data: data)
                        }
                    } else {
                        print(error ?? "Unable to download the image")
                    }
                }
            }.resume()
        }
    }
}



