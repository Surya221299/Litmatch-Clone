//
//  Profile.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 12/09/23.
//

import SwiftUI

struct Profile: View {
    
    // var untuk menampilan my profil utama
    
    var yourProfile: YourProfileModel = YourProfileModel.yourDataDiri
    
    // var untuk mendapatkan semua data user
    
    @StateObject var homeData = HomeViewModel()
    
    // var untuk tampilan bottom sheet
    
    @State private var showingBottomSheet = false
    
    // var untuk textfield komentar postingan
    
    @State private var komentar: String = ""
    
    // var untuk state awal tampilan bottom sheet
    
    @State var detentHeight: CGFloat = 0
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            // Since Were Pinning Header View....
            
            LazyVStack(alignment: .leading, spacing: 12, pinnedViews: [.sectionHeaders], content: {
                Section(header:
                            HStack {
                                Image("\(yourProfile.avatar)")
                                    .resizable()
                                    .frame(width: 36, height: 36)
                                    .opacity(homeData.offset > 50 ? 1 : 0)
                                    .padding(.bottom, 12)
                                Spacer()
                                HStack {
                                    HStack {
                                        Image("big_diamond")
                                            .resizable()
                                            .frame(width: 22, height: 22)
                                        Text("\(yourProfile.diamond)")
                                            .font(.system(size: 14, weight: .bold))
                                            .foregroundColor(homeData.offset > 10 ? Color("foreground_light_dark") : Color("background_light_dark"))
                                        Image("diamond_plus")
                                            .resizable()
                                            .frame(width: 22, height: 22)
                                    }
                                    .padding(.horizontal, 4)
                                    .padding(.vertical, 6)
                                    .background(Color("light-blue").opacity(0.5))
                                    .clipShape(Capsule())
                                    
                                    ZStack(alignment: .topTrailing) {
                                        
                                        Image("user_menu_op_vip_2")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width: 32, height: 32)
                                            .background(Color("foreground_light_dark").opacity(homeData.offset > 10 ? 0 : 0.3).opacity(homeData.offset > 10 ? 0 : 0.3))
                                            .foregroundColor(homeData.offset > 10 ? Color("foreground_light_dark") : Color("background_light_dark"))
                                            .clipShape(Circle())
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 10, height: 10)
                                        
                                    }
                                    ZStack(alignment: .topTrailing) {
                                        Image("zone_menu_icon_2_first_in")
                                            .resizable()
                                            .frame(width: 32, height: 32)
                                            .background(Color("foreground_light_dark").opacity(homeData.offset > 10 ? 0 : 0.3).opacity(homeData.offset > 10 ? 0 : 0.3))
                                            .foregroundColor(homeData.offset > 10 ? Color("foreground_light_dark") : Color("background_light_dark"))
                                            .clipShape(Circle())
                                        Circle()
                                            .fill(Color.red)
                                            .frame(width: 10, height: 10)
                                    }
                                    Image("user_menu_op_bag_2")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 32, height: 32)
                                        .background(Color("foreground_light_dark").opacity(homeData.offset > 10 ? 0 : 0.3).opacity(homeData.offset > 10 ? 0 : 0.3))
                                        .foregroundColor(homeData.offset > 10 ? Color("foreground_light_dark") : Color("background_light_dark"))
                                        .clipShape(Circle())
                                    Image("user_menu_op_setting_2")
                                        .resizable()
                                        .renderingMode(.template)
                                        .frame(width: 32, height: 32)
                                        .background(Color("foreground_light_dark").opacity(homeData.offset > 10 ? 0 : 0.3).opacity(homeData.offset > 10 ? 0 : 0.3))
                                        .foregroundColor(homeData.offset > 10 ? Color("foreground_light_dark") : Color("background_light_dark"))
                                        .clipShape(Circle())
                                }
                                .padding(.bottom, 12)
                            }
                            .padding(.top, 48)
                            .padding(.horizontal, 16)
                            .background((homeData.offset > 10 ? Color("background_light_dark") : .clear))
                ) {
                // Parallax Header...
                    GeometryReader{ reader -> AnyView in
                        
                        let offset = reader.frame(in: .global).minY
                        
                        if -offset >= 0 {
                            DispatchQueue.main.async {
                                self.homeData.offset = -offset
                            }
                        }
                        
                        return AnyView(
                            Image(yourProfile.gender == "male" ? "profil_background_image" : "profile_default_bg_girl")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 60 + (offset > 0 ? offset : 0))
                                .cornerRadius(2)
                                .offset(y: (offset > 0 ? -offset : 0 ))
                        )
                        
                    }
                    .frame(height: 60)
                
                    // Informasi User Disini....
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Image(yourProfile.avatar)
                            .resizable()
                            .frame(width: 95, height: 95)
                        
                        HStack {
                            Text(yourProfile.username)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color("foreground_light_dark"))
                            
                            HStack(spacing: 3) {
                                
                                // conditional UI icon cowok apa cewek + background
                                if (yourProfile.gender) == "male" {
                                    Image("boy_icon_checked")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                    Text("\(yourProfile.age)")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("boy_gender_color"))
                                } else {
                                    Image("girl_icon_checked")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                    Text("\(yourProfile.age)")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("girl_gender_color"))
                                }
                            }
                            .padding(.vertical, 2)
                            .padding(.horizontal, 6)
                            .background(Color((yourProfile.gender) == "male" ? "boy_gender_color" : "girl_gender_color").opacity(0.1))
                            .cornerRadius(10)
                        }
                        HStack(spacing: 2) {
                            Text("Lit ID: \(String(yourProfile.litID))")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                            Image("user_lit_id_copy")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                        }
                        
                        HStack(spacing: 4) {
                            Image("ic_mood_plus")
                                .resizable()
                                .renderingMode(.template)
                                .frame(width: 14, height: 14)
                                .foregroundColor(Color("primary"))
                            Text("Status")
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(Color("primary"))
                        }
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(Color("primary").opacity(0.1))
                        .clipShape(Capsule())
                        
                        HStack {
                            
                            // Postingan user disini...
                            
                            if (yourProfile.profileStatus).isEmpty {
                                
                            } else {
                                HStack(spacing: 5) {
                                    Image("\(yourProfile.profileStatus)")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    Text("\(yourProfile.profileStatus)")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color("foreground_light_dark"))
                                        .opacity(0.5)
                                    
                                }
                            }
                            
                        }
                        
                        HStack(spacing: 2) {
                            Text(yourProfile.profileBio)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                            Image("icon_bio_edit")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("foreground_light_dark"))
                                .frame(width: 22, height: 22)
                                .opacity(0.5)
                        }
                        
                        
                        HStack {
                            HStack {
                                Image("calendar-svgrepo-com")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                Text("Bergabung \(yourProfile.dateJoined)")
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(Color("foreground_light_dark"))
                                    .opacity(0.5)
                            }
                            .padding(.vertical, 6)
                            
                            // Lokasi user (jika ada)
                            
                            HStack {
                                if (yourProfile.userLocation).isEmpty {
                                    HStack(spacing: 4) {
                                        Image("me_location")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width: 16, height: 16)
                                        ZStack(alignment: .topTrailing) {
                                            Text("Belum diatur")
                                                .font(.system(size: 13, weight: .regular))
                                            Circle()
                                                .fill(Color.red)
                                                .frame(width: 8, height: 8)
                                                .offset(x: 12, y: -4)
                                        }
                                        
                                    }
                                    .foregroundColor(Color("primary"))
                                } else {
                                    HStack(spacing: 4) {
                                        Image("me_location")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width: 16, height: 16)
                                        Text("\(yourProfile.userLocation)")
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .foregroundColor(Color("primary"))
                                }
                            }
                            
                        }
                        
                        HStack {
                            ForEach(yourProfile.tag.indices, id: \.self) { tagtag in
                                Text(yourProfile.tag[tagtag])
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 8)
                                    .overlay( /// apply a rounded border
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("foreground_light_dark").opacity(0.5), lineWidth: 0.8)
                                    )
                            }
                            Image("icon_bio_edit")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(Color("foreground_light_dark"))
                                .frame(width: 22, height: 22)
                                .opacity(0.5)
                        }
                        
                        HStack {
                            HStack(spacing: 1) {
                                Text(String(yourProfile.following))
                                    .font(.system(size: 13, weight: .semibold))
                                
                                Text(" Mengikuti")
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(0.5)
                            }
                            HStack(spacing: 1) {
                                Text(String(yourProfile.followers))
                                    .font(.system(size: 13, weight: .bold))
                                
                                Text(" Pengikut")
                                    .font(.system(size: 13, weight: .semibold))
                                    .opacity(0.5)
                            }
                            ZStack(alignment: .topTrailing) {
                                HStack(spacing: 1) {
                                    Text(String(yourProfile.visited))
                                        .font(.system(size: 13, weight: .bold))
                                    
                                    Text(" Dikunjungi")
                                        .font(.system(size: 13, weight: .semibold))
                                        .opacity(0.5)
                                }
                                HStack(spacing: 4) {
                                    Text("+\(String(yourProfile.lastVisited))")
                                        .font(.system(size: 13, weight: .bold))
                                        .foregroundColor(Color("primary"))
                                }
                                .padding(.horizontal, 6)
                                .background(Color("primary").opacity(0.2))
                                .clipShape(Capsule())
                                .offset(x: 30, y: -10)
                            }
                        }
                        
                    }
                    .padding(.top, -60)
                    .padding(.horizontal, 22)
                    Divider()
                        .opacity(0.5)
                    
                    // Postingan user.....
                    
                    if(yourProfile.yourPost).isEmpty {
                        VStack( spacing: 12){
                            
                            Image("pic_data_empty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 125)
                            
                            Text("Teman Litmatch Anda ini belum pernah berbagi postingan apapun.")
                                .font(.system(size: 16, weight: .bold))
                                .multilineTextAlignment(.center)
                            Text("Tapi saat mereka berbagi postingan, postingan mereka akan muncul di sini")
                                .font(.system(size: 14, weight: .medium))
                                .multilineTextAlignment(.center)
                                .opacity(0.5)
                        }
                        .padding(.top, 80)
                        .padding(.horizontal, 85)
                    } else {
                        
                        
                        ForEach(yourProfile.yourPost.indices, id: \.self) { postingan in
                            VStack(alignment: .leading, spacing: 0) {
                                // ini postingan user...
                                
                                VStack(alignment: .leading, spacing: 6){
                                    
                                    HStack {
                                        Text("\(yourProfile.yourPost[postingan].datePosted)")
                                            .font(.system(size: 14, weight: .medium))
                                            .opacity(0.4)
                                        Spacer()
                                        Image("feed_dot")
                                            .opacity(0.5)
                                    }
                                    
                                    if(yourProfile.yourPost[postingan].statusTag).isEmpty {
                                        
                                    } else {
                                        HStack {
                                            ForEach(yourProfile.yourPost[postingan].statusTag.indices, id: \.self) { g in
                                                Text("\(yourProfile.yourPost[postingan].statusTag[g])")
                                                    .lineLimit(1)
                                                    .font(.system(size: 16))
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(Color("primary"))
                                            }
                                        }
                                    }
                                    
                                    Text("\(yourProfile.yourPost[postingan].statusText) ")
                                        .font(.system(size: 16, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color("foreground_light_dark"))
                                    //                                                }
                                    
                                    // Grid gambar disini...
                                    HStack(spacing: 12) {
                                        let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: (yourProfile.yourPost[postingan].gambarPost.count) <= 3 ? yourProfile.yourPost[postingan].gambarPost.count : 3)
                                        
                                        LazyVGrid(columns: columns, alignment: .leading, spacing: 3, content: {
                                            
                                            ForEach(yourProfile.yourPost[postingan].gambarPost.indices, id: \.self) { gambar in
                                                Image("\(yourProfile.yourPost[postingan].gambarPost[gambar])")
                                                    .resizable()
                                                    .padding(.vertical, 4)
                                                    .frame(width: (yourProfile.yourPost[postingan].gambarPost.count) >= 3 ? 159 : 159, height: (yourProfile.yourPost[postingan].gambarPost.count) >= 3 ? 159 : 211)
                                                    .cornerRadius(3)
                                            }
                                        })
                                    }
                                    HStack(spacing: 36) {
                                        Text("\(yourProfile.yourPost[postingan].seen) dilihat")
                                            .font(.system(size: 13, weight: .medium))
                                            .opacity(0.5)
                                        HStack(spacing: 4) {
                                            Text("Publik")
                                                .font(.system(size: 13, weight: .medium))
                                            
                                            Image("intimate_friends_next")
                                                .resizable()
                                                .renderingMode(.template)
                                                .frame(width: 14, height: 14)
                                        }
                                        .opacity(0.5)
                                        .foregroundColor(Color("foreground_light_dark"))
                                    }
                                    
                                    if (yourProfile.userLocation).isEmpty {
                                        
                                    } else {
                                        HStack(spacing: 4) {
                                            Image("feed_nearby_loc_icon")
                                                .resizable()
                                                .renderingMode(.template)
                                                .frame(width: 14, height: 14)
                                            Text("\(yourProfile.userLocation)")
                                                .font(.system(size: 12))
                                        }
                                        .foregroundColor(Color("primary"))
                                    }
                                    
                                    if (yourProfile.yourPost[postingan].yourFeedComments).isEmpty {
                                        HStack() {
                                            Image("monster_avatar_6")
                                                .resizable()
                                                .frame(width: 28, height: 28)
                                                .padding(.horizontal, 4)
                                            TextField ("Komentar ramah...", text: $komentar)
                                                .multilineTextAlignment(.leading)
                                                .font(.system(size: 12))
                                        }
                                        .frame(height: 32)
                                        .background(Color("foreground_light_dark").opacity(0.02))
                                        .cornerRadius(4)
                                    } else {
                                        
                                    }
                                }
                                
                                HStack(spacing: 18) {
                                    Spacer()
                                    
                                    // Like postingan
                                    
                                    HStack(spacing: 1) {
                                        
                                        Image("comment_like")
                                            .renderingMode(.template)
                                        
                                        if (yourProfile.yourPost[postingan].yourFeedLikes).isEmpty {
                                            Text("")
                                        } else {
                                            Text("\(yourProfile.yourPost[postingan].yourFeedLikes.count)")
                                                .font(.system(size: 13))
                                        }
                                    }
                                    
                                    // Komentar Postingan
                                    
                                    HStack(spacing: 1) {
                                        Image("comment_icon")
                                            .renderingMode(.template)
                                        
                                        if(yourProfile.yourPost[postingan].yourFeedComments).isEmpty {
                                            Text("")
                                        } else {
                                            Text("\(yourProfile.yourPost[postingan].yourFeedComments.count)")
                                                .font(.system(size: 13))
                                        }
                                    }
                                    
                                    // Share Psotingan
                                    
                                    HStack(spacing: 1) {
                                        
                                        Button( action: {
                                            showingBottomSheet.toggle()
                                        }, label: {
                                            Image("feed_share_icon")
                                                .renderingMode(.template)
                                        })
                                        .sheet(isPresented: self.$showingBottomSheet) {
                                            Feed_SharePost()
                                                .background(Color("background_light_dark"))
                                                .readHeight()
                                                .onPreferenceChange(HeightPreferenceKey.self) { height in
                                                    if let height {
                                                        self.detentHeight = height
                                                    }
                                                }
                                                .presentationDetents([.height(self.detentHeight)])
                                            
                                        }
                                        
                                        if yourProfile.yourPost[postingan].feedShare == 0 {
                                            Text("")
                                        } else {
                                            Text("\(yourProfile.yourPost[postingan].feedShare)")
                                                .font(.system(size: 13))
                                        }
                                    }
                                    .padding(.trailing, 32)
                                }
                                .foregroundColor(Color("foreground_light_dark").opacity(0.4))
                                
                                .frame(maxWidth: .infinity)
                            }
                            .padding(.horizontal, 22)
                        }
                        
                    }
                }
            })
            HStack {
                
            }
            .frame(height: 300)
        }
        .ignoresSafeArea()
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))

    }
}

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
    }
}
