//
//  ChatDetail.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 11/10/23.
//

import SwiftUI

struct ChatDetail: View {
    
    
    // var untuk tampilan texfield chat
    
    @State private var komentar: String = ""
    
    // var untuk data user detailed
    
    var user: User
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            Divider()
            ScrollView(.vertical, showsIndicators: false) {
                Text("\(user.lastSeenChatDate)")
                    .font(.system(size: 14, weight: .medium))
                    .opacity(0.5)
                HStack(alignment: .top) {
                    Image("\(user.avatar)")
                        .resizable()
                        .frame(width: 42, height: 42)
                    VStack(alignment: .leading, spacing: 16) {
                        Text("\(user.pesan[0])")
                            .font(.system(size: 16, weight: .semibold))
                            .padding(.vertical, 20)
                            .padding(.horizontal, 16)
                            .background(Color("foreground_light_dark").opacity(0.01))
                            .roundedCorner(12, corners: [.bottomLeft, .topRight, .bottomRight])
                        Text("Doble click avatar untuk menepuk")
                            .font(.system(size: 11, weight: .regular))
                            .opacity(0.5)
                    }
                    Spacer()
                }
                .padding(.horizontal, 16)
                
                
            }
            HStack {
                HStack {
                    Text("\u{1F44B}")
                    Text("Lambai")
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .background(Color("foreground_light_dark").opacity(0.01))
                .clipShape(Capsule())
                
                HStack {
                    Text("\u{2764}")
                    Text("Balon")
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .background(Color("foreground_light_dark").opacity(0.01))
                .clipShape(Capsule())
                
                HStack {
                    Text("\u{1F602}")
                    Text("LOL")
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .background(Color("foreground_light_dark").opacity(0.01))
                .clipShape(Capsule())
                
                HStack {
                    Text("\u{1F97A}")
                    Text("Please")
                        .font(.system(size: 14, weight: .regular))
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 12)
                .background(Color("foreground_light_dark").opacity(0.01))
                .clipShape(Capsule())
            }
            HStack {
                
                Image("icon_mic")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding(2)
                    .foregroundColor(Color("foreground_light_dark").opacity(0.9))
                TextField ("Ketik pesan...", text: $komentar)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 12)
                    .padding(.leading, 16)
                    .background(Color("foreground_light_dark").opacity(0.02))
                    .cornerRadius(20)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color("foreground_light_dark"))
                Image("emoji_icn")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color("foreground_light_dark").opacity(0.9))
                    .padding(2)
                Image("gift_icon")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color("foreground_light_dark").opacity(0.9))
                    .padding(2)
                Image("add-plus-circle-svgrepo-com")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color("foreground_light_dark").opacity(0.9))
                    .padding(2)
            }
            .padding(.horizontal, 16)
        }
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))
        .toolbar {
            // 2
            ToolbarItem(placement: .navigationBarLeading) {
                ZStack {
                    HStack(spacing: 0) {
                        Button {
                            dismiss()
                        } label: {
                            // 4
                            Image("back_day")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("foreground_light_dark"))
                                .frame(width: 36, height: 36)
                            
                        }
                        Text("8")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.horizontal, 16)
                            .padding(.vertical, 12)
                            .background(Color("foreground_light_dark").opacity(0.01))
                            .clipShape(Capsule())
                    }
                }
                .padding(.bottom, 16)
                .padding(.top, 8)
            }
            
            ToolbarItem(placement: .principal) {
                VStack(spacing: 0) {
                    HStack {
                        Text("\(user.username)")
                            .font(.system(size: 18, weight: .semibold))
                        Image("party_hold_add")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("background_light_dark"))
                            .frame(width: 11, height: 11)
                            .padding(.vertical, 4)
                            .padding(.horizontal, 8)
                            .background(Color((user.gender) == "male" ? "boy_gender_color" : "girl_gender_color"))
                            .clipShape(Capsule())
                    }
                    Text("\(user.lastSeenChat)")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(Color("green"))
                }
                .padding(.bottom, 16)
                .padding(.top, 8)
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                
                    HStack{
                        Image("call_icon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("foreground_light_dark"))
                            .frame(width: 36, height: 36)
                        Image("black_menu_icon")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("foreground_light_dark"))
                            .frame(width: 36, height: 36)
                    }
                    .padding(.bottom, 16)
                    .padding(.top, 8)
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbarBackground(Color("background_light_dark"),
                           for: .navigationBar)
        
    }
}

struct ChatDetail_Previews: PreviewProvider {
    static var previews: some View {
        ChatDetail(user: User.samplePerson)
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
