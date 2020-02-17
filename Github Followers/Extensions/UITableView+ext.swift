//
//  UITableView+ext.swift
//  Github Followers
//
//  Created by Deonte on 2/17/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

extension UITableView {
    
    func removeExcessCells() {
        tableFooterView = UIView(frame: .zero)
    }
    
    
    func reloadDataOnMainThread() {
        DispatchQueue.main.async { self.reloadData() }
    }
    
}
