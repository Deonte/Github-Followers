//
//  GFFollowerController.swift
//  Github Followers
//
//  Created by Deonte on 1/25/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class GFFollowerController: GFItemInfoController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
