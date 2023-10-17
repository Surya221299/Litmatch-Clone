//
//  ReadJSONTrendingTag.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 23/09/23.
//

import Foundation

// This is User Model
struct TrendingTag: Codable, Identifiable {
    
    enum CodingKeys: CodingKey {
        case image
        case title
        case overlay_feed_icon
    }
    
    var id = UUID()
    var image: String
    var title: String
    var overlay_feed_icon: String
}


