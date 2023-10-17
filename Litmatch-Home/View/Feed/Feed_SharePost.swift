//
//  Feed_SharePost.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 04/10/23.
//

import SwiftUI

struct Feed_SharePost: View {
    
    // var untuk tampilan bottom sheet
    
    @State private var showingBottomSheet = false
    @State var detentHeight: CGFloat = 0
    
    var bagikan: [String] = ["Salin tautan", "Facebook", "Messenger", "WhatsApp","Line", "Lainnya"]
    
    // this is tupple of array....
    
    var avatar = ["monster_avatar_1": "putri", "monster_avatar_2": "dimas", "monster_avatar_3": "yuni", "monster_avatar_4": "Wennn", "monster_avatar_5": "Ndutz", "monster_avatar_6": "salsa", "monster_avatar_7": "Iyeee", "monster_avatar_8": "Zoya", "monster_avatar_9": "astri", "monster_avatar_10": "why","monster_avatar_11": "Nasya", "monster_avatar_12": "senja", "monster_avatar_13": "ecaa", "monster_avatar_14": "zellyn", "monster_avatar_15": "Geandra"]
    
    var body: some View {
        
        // Share Bottom Sheet
        
        VStack(alignment: .leading, spacing: 16) {
            Text("Bagikan ke...")
                .font(
                    .system(size: 16)
                    .weight(.bold)
                    
                )
            Text("Surya bisa melihat postingan ini. Mungkin tidak akan terlihat oleh semua orang")
                .font(
                    .system(size: 12)
                    .weight(.medium)
                    
                )
                .multilineTextAlignment(.leading)
                .opacity(0.5)
            
            HStack() {
                ForEach(bagikan.indices, id: \.self) { foto in
                    VStack {
                        Image(bagikan[foto])
                            .resizable()
                            .frame(width: 42, height: 42)
                            .frame(maxWidth: .infinity)
                        Text(bagikan[foto])
                            .font(
                                .system(size: 11)
                                .weight(.medium)
                                
                            )
                            .lineLimit(1)
                            .opacity(0.5)
                    }
                }
            }
            
            Rectangle().fill(Color("foreground_light_dark").opacity(0.1)).frame(height: 0.5, alignment: .center)
            
            // List share ke...
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 24) {
                    ForEach(avatar.sorted(by: >), id: \.key) { key, value in
                        HStack {
                            Image(key)
                                .resizable()
                                .frame(width: 42, height: 42)
                            Text(value)
                            Spacer()
                            
                            ZStack {
                                Capsule()
                                    .fill(Color("primary"))
                                    .frame(width: 50, height: 26)
                                Image("telegram_plane")
                                    .renderingMode(.template)
                                    .resizable()
                                    .frame(width: 18, height: 18)
                                    .foregroundColor(Color("background_light_dark"))
                            }
                        }
                    }
                }
            }
            
        }
        .foregroundColor(Color("foreground_light_dark"))
        .frame(maxWidth: .infinity)
        .frame(height: UIScreen.main.bounds.size.height * 0.7)
        .padding(.horizontal, 12)
        .padding(.top, 30)
        .ignoresSafeArea()
    }
}

struct Feed_SharePost_Previews: PreviewProvider {
    static var previews: some View {
        Feed_SharePost()
    }
}




