//
//  YourProfileModel.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 09/10/23.
//

import Foundation

struct yourPost: Codable {
    let datePosted, statusText, postLocation: String
    let gambarPost, statusTag, voicePost: [String]
    let yourFeedLikes: [yourFeedLikes]
    let yourFeedComments:[yourFeedComments]
    let seen, feedShare: Int
}

struct yourFeedLikes: Codable {
    let userLikes, genderLikes, userLikesStatus, avatarLikes: String
    let ageLikes: Int
}

struct yourFeedComments: Codable {
    let avatarComments, userComments, genderComments, commentStatus, commentPostedDate, comments: String
    let ageComments: Int
    let yourFeedReComments: [yourFeedReComments]
}

struct yourFeedReComments: Codable {
    let avatarReComments, userReComments, genderReComments, recommentPostedDate, userReCommentStatus, reComment: String
    let ageReComments: Int
}


