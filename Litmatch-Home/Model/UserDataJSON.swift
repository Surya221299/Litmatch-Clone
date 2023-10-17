//
//  UserDataJSON.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 29/09/23.
//

import Foundation

struct Post: Codable {
    let datePosted, statusText, postLocation: String
    let gambarPost, statusTag, voicePost: [String]
    let feedLikes: [FeedLikes]
    let feedComments:[FeedComments]
    let seen, feedShare: Int
}

struct FeedLikes: Codable {
    let userLikes, genderLikes, userLikesStatus, avatarLikes: String
    let ageLikes: Int
}

struct FeedComments: Codable {
    let avatarComments, userComments, genderComments, commentStatus, commentPostedDate, comments: String
    let ageComments: Int
    let feedReComments: [FeedReComments]
}

struct FeedReComments: Codable {
    let avatarReComments, userReComments, genderReComments, recommentPostedDate, userReCommentStatus, reComment: String
    let ageReComments: Int
}

