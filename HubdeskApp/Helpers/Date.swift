//
//  Date.swift
//  HubdeskApp
//
//  Created by Omar Khaled on 29/06/2019.
//  Copyright © 2019 garana. All rights reserved.
//

import Foundation

func dateFromString(stringDate:String?) -> String {
    if let str = stringDate {
        let dateDateFormatter = DateFormatter()
        dateDateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dateDateFormatter.calendar = Calendar(identifier: .gregorian)
        dateDateFormatter.locale = Locale(identifier: "en-GB")
        dateDateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        let date = dateDateFormatter.date(from: str)
        dateDateFormatter.dateFormat = "yyyy-MM-dd hh:mm"
        
        let strDate = dateDateFormatter.string(from: date!)
        return strDate
    }
    
    return "Not Assigned"
    
}

func removeHTMLTags(string:String) -> String {
    
    if string.count > 0 {
            return string.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }

    return ""
    
}
