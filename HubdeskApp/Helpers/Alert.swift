//
//  Alert.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 25/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation
import UIKit

func displayErrorAlert(message: String, title: String) -> UIAlertController {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
    
    alert.addAction(dismissAction)
    
    return alert
}


func displayErrorsAlert(messages:[String:[String]]) -> UIAlertController? {
    
    var errors = ""
    
    for message in messages {
        errors = errors + message.value.joined(separator: "\n") +  "\n"
    }
    
    
    
    let alert = UIAlertController(title: "Error", message: errors, preferredStyle: .alert)
    
    let dismissAction = UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)
    
    alert.addAction(dismissAction)
    
    return alert
}
