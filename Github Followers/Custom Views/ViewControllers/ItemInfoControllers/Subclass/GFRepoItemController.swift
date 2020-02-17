//
//  GFRepoItemController.swift
//  Github Followers
//
//  Created by Deonte on 1/25/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import UIKit

protocol GFRepoDelegate: class {
    func didTapGitHubProfile(for user: User)
}

class GFRepoItemInfoController: GFItemInfoController {
    
    weak var delegate: GFRepoDelegate!


    init(user: User, delegate: GFRepoDelegate) {
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
        itemInfoViewOne.set(itemInfoType: .repos, withCount: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }
    
}
