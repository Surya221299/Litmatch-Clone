//
//  ReadJSONTrendingData.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 15/10/23.
//

import SwiftUI

// This is class for reading data

class ReadJSONTrendingData: ObservableObject {
    @Published var tags = [TrendingTag]()

    init() {
        loadData()
    }

    func loadData() {
        guard let url = Bundle.main.url(forResource: "TrendingTag", withExtension: "json")
        else{
            print("json file not found")
            return
        }

        let data = try? Data(contentsOf: url)
        let tags = try? JSONDecoder().decode([TrendingTag].self, from: data!)

        self.tags = tags!
    }
}
