//
//  Feed_Recommendation.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 22/09/23.
//

import SwiftUI

struct Feed_Recommendation: View {
    
    @State var selectedRekomendasi = 0
    
    var body: some View {
        
        // Halaman Feed Rekomendasi
        VStack(alignment: .leading) {
            
            RekomendasiLink(selectedRekomendasi: $selectedRekomendasi)
                .padding(.horizontal, 12)
            if self.selectedRekomendasi == 0 {
                Feed_Trending()
            }
            else if self.selectedRekomendasi == 1 {
                Feed_FindFriends()
            }
            else {
                Text("Page Not Found!")
            }
            
        }
        .padding(.horizontal, 16)
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))
    }
}

struct Feed_Recommendation_Previews: PreviewProvider {
    static var previews: some View {
        Feed_Recommendation()
    }
}

struct RekomendasiLink : View {
    
    @Binding var selectedRekomendasi: Int
    
    var body : some View {
        HStack(spacing: 25) {
            
            // Link Trending Active
            
            Button(action: {
                self.selectedRekomendasi = 0
            }) {
                Text("Trending")
                    .fontWeight(.medium)
                    .foregroundColor(self.selectedRekomendasi == 0 ? Color("primary") : Color("foreground_light_dark").opacity(0.5))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(self.selectedRekomendasi == 0 ? Color("primary").opacity(0.1) : .clear)
                    .cornerRadius(20)
            }
            
            // Link Trending Cari Teman
            
            Button(action: {
                self.selectedRekomendasi = 1
            }) {
                Text("Cari Teman")
                    .fontWeight(.medium)
                    .foregroundColor(self.selectedRekomendasi == 1 ? Color("primary") : Color("foreground_light_dark").opacity(0.5))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 10)
                    .background(self.selectedRekomendasi == 1 ? Color("primary").opacity(0.1) : .clear)
                    .cornerRadius(20)
                
            }
        }
    }
}
