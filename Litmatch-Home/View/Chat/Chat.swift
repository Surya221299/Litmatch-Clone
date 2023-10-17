//
//  Chat.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 12/09/23.
//

import SwiftUI

struct Chat: View {
    
    // var untuk mendapatkan semua data user JSON
    
    private var people: [User] = User.allPeople
    
    // var untuk texfield search
    
    @State private var search = ""
    
    var body: some View {
        
        VStack(spacing: 12) {
            
            // ZStack agar title pas ditengah
            
            ZStack {
                
                HStack {
                    
                    // Icon feedback
                    Image("home_feedback")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                    Spacer()
                    
                    // Icon Kontak
                    
                    Image("ic_contacts")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 36, height: 36)
                    
                    // Icon Friend
                    
                    Image("ic_add_friend")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 36, height: 36)
                }
                
                // Chat Screen Title
                
                VStack(spacing: 0) {
                    Text("Chat")
                        .font(.system(size: 18, weight: .semibold))
                    HStack {
                        Text("Mereka mencari teman baru")
                            .font(.system(size: 15, weight: .regular))
                            .opacity(0.5)
                        Image("arrow_title")
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                }
            }
            
            // Vertical Scroll
            
            ScrollView(.vertical, showsIndicators: false) {
                
                // Search bar...
                
                VStack(spacing: 24) {
                    HStack {
                        Image("ic_search")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20)
                        TextField("Cari History Chat", text: $search)
                            .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .background(Color("foreground_light_dark").opacity(0.02))
                    .clipShape(Capsule())
                    
                    // Tonton iklan...
                    
                    HStack(spacing: 12) {
                        Image("watch_video")
                            .resizable()
                            .frame(width: 50, height: 50)
                        VStack(alignment: .leading, spacing: 4) {
                            HStack {
                                Text("Diamond Gratis")
                                    .font(.system(size: 14, weight: .semibold))
                                Image("big_diamond")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            HStack() {
                                Text("Menangkan diamond acak dengan menonton video")
                                    .font(.system(size: 12, weight: .regular))
                                    .opacity(0.5)
                                Spacer()
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 10, height: 10)
                                    .offset(y: -10)
                            }
                        }
                    }
                    
                    // list chat (ForEach Vertical Scroll)
                    
                    HStack {
                        Image("App_Icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipShape(Circle())
                        VStack {
                            HStack {
                                Text("Lit official")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                Spacer()
                                Text("Kemarin 21:50")
                                    .font(.system(size: 12))
                                    .opacity(0.5)
                            }
                            HStack {
                                Text("Tidak, tidak, tidak, masih ada yang belum tahu bahwa ada banyak hal baru yang bisa didengar disini...")
                                    .font(.system(size: 14, weight: .medium))
                                    .opacity(0.5)
                                    .lineLimit(1)
                                Spacer()
                                Text("32")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 14, weight: .medium))
                                    .padding(.horizontal, 6)
                                    .padding(.vertical, 1)
                                    .background(Color.red)
                                    .cornerRadius(10)
                                
                            }
                        }
                    }
                    
                    // Looping to get every list of user chat
                    
                    ForEach(people, id: \.litID) { person in
                        
                        if person.pesan.isEmpty {
                            
                        } else {
                            NavigationLink(destination: ChatDetail(user: person), label: {
                                HStack {
                                    Image(person.avatar)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 60, height: 60)
                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack( spacing: 8) {
                                            Text(person.username)
                                                .font(.system(size: 16))
                                                .fontWeight(.semibold)
                                                .foregroundColor(Color("foreground_light_dark"))
                                            HStack(spacing: 3) {
                                                
                                                // conditional UI icon cowok apa cewek + background
                                                if (person.gender) == "male" {
                                                    Image("boy_icon_checked")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 12, height: 12)
                                                    Text("\(person.age)")
                                                        .font(.system(size: 12))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color("boy_gender_color"))
                                                } else {
                                                    Image("girl_icon_checked")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 12, height: 12)
                                                    Text("\(person.age)")
                                                        .font(.system(size: 12))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color("girl_gender_color"))
                                                }
                                                
                                                
                                            }
                                            
                                            .padding(.vertical, 2)
                                            .padding(.horizontal, 6)
                                            .background(Color((person.gender) == "male" ? "boy_gender_color" : "girl_gender_color").opacity(0.1))
                                            .cornerRadius(10)
                                            Spacer()
                                            Text("\(person.lastSeenChatDate)")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("foreground_light_dark"))
                                                .opacity(0.5)
                                        }
                                        HStack {
                                            Text(person.pesan[0])
                                                .font(.system(size: 14, weight: .medium))
                                                .foregroundColor(Color("foreground_light_dark"))
                                                .opacity(0.5)
                                                .lineLimit(1)
                                            Spacer()
                                            
                                            Text("\(person.pesan.count)")
                                                .foregroundColor(Color.white)
                                                .font(.system(size: 14, weight: .medium))
                                                .padding(.horizontal, 6)
                                                .padding(.vertical, 1)
                                                .background(Color.red)
                                                .cornerRadius(10)
                                        }
                                    }
                                }
                            })
                        }
                    }
                }
            }
        }
        .padding(.horizontal, 12)
        .background(Color("background_light_dark"))
    }
}

struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat()
    }
}
