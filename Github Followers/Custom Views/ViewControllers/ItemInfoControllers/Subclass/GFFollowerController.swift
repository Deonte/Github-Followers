//
//  GFFollowerController.swift
//  Github Followers
//
//  Created by Deonte on 1/25/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

protocol GFFollowerDelegate: class {
    func didTapGetFollowers(for user: User)
}

class GFFollowerController: GFItemInfoController {
    
    weak var delegate: GFFollowerDelegate!
    
    
    init(user: User, delegate: GFFollowerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
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
