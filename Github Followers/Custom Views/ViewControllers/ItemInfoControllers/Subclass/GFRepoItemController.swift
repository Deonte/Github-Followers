//
//  GFRepoItemController.swift
//  Github Followers
//
//  Created by Deonte on 1/25/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

class GFRepoItemInfoController: GFItemInfoController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
}
