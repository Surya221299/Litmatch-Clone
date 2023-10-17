//
//  User.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 15/10/23.
//

import SwiftUI

struct User: Codable{
    let dateJoined, fotoSampul, avatar, username, gender, profileBio, profileStatus, lastSeen, userLocation, lastSeenChatDate, lastSeenChat: String
    let tag, pesan: [String]
    let party: Bool
    let litID, following, followers, age, diamond: Int
    let post: [Post]

    // Generate samples
    static let allPeople: [User] = Bundle.main.decode(file: "UserData.json")
    static let samplePerson: User = allPeople[0]
}

// Extension to decode JSON locally
extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
