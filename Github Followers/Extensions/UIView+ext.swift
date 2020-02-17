//
//  UIView+ext.swift
//  Github Followers
//
//  Created by Deonte on 2/16/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit


extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach { view in addSubview(view) }
    }
    
    
    func pinToEdges(of superview: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor)
        ])
    }
}
