//
//  YourProfileModel.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 15/10/23.
//

import SwiftUI

struct YourProfileModel: Codable{
    let dateJoined, fotoSampul, avatar, username, gender, profileBio, profileStatus, lastSeen, userLocation: String
    let tag: [String]
    let party: Bool
    let litID, following, followers, age, diamond, visited, lastVisited: Int
    let yourPost: [yourPost]

    // Generate samples
    static let yourDataDiri: YourProfileModel = Bundle.main.yourDecode(file: "YourProfile.json")
    static let yourProfile: YourProfileModel = yourDataDiri
}

// Extension to decode JSON locally
extension Bundle {
    func yourDecode<T: Decodable>(file: String) -> T {
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
