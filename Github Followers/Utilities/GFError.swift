//
//  GFError.swift
//  Github Followers
//
//  Created by Deonte on 1/4/20.
//  Copyright © 2020 Deonte. All rights reserved.
//

import Foundation

enum GFError: String, Error{
    case invalidUsername = "This username created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection"
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server is invalid. Please try again."
    case unableToAddFavorite = "There was an error favoriting this user. Please try again."
    case alreadyInFavorites = "You have already favorited this user. You must really like them 🤔."
}

