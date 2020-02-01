//
//  Date+ext.swift
//  Github Followers
//
//  Created by Deonte on 1/25/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
    
}
