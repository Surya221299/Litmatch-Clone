//
//  DetailProfileUser.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 29/09/23.
//

import SwiftUI

struct DetailProfileUser: View {
    
    // var to get explicit user
    
    var yourProfile: YourProfileModel = YourProfileModel.yourDataDiri
    
    // var to get offset for on scroll use
    
    @StateObject var homeData = HomeViewModel()
    
    // var untuk menampilkan Bottom sheet
    
    @State private var showingBottomSheet = false
    
    // var untuk texfield komentar
    
    @State private var komentar: String = ""
    
    // var state awal bottom sheet
    
    @State var detentHeight: CGFloat = 0
    
    @Environment(\.dismiss) private var dismiss
    
    var person: User = User.samplePerson
    
    var user: User
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading, spacing: 15) {
                    
                    // Parallax Header image...
                    
                    GeometryReader{ reader -> AnyView in
                        
                        let offset = reader.frame(in: .global).minY
                        
                        if -offset >= 0 {
                            DispatchQueue.main.async {
                                self.homeData.offset = -offset
                            }
                        }
                        
                        return AnyView(
                            Image(user.gender == "male" ? "profil_background_image" : "profile_default_bg_girl")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: 153 + (offset > 0 ? offset : 0))
                                .cornerRadius(2)
                                .offset(y: (offset > 0 ? -offset : 0 ))
                        )
                        
                    }
                    .frame(height: 153)
                    
                    // Informasi User Disini....
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Image(user.avatar)
                            .resizable()
                            .frame(width: 95, height: 95)
                        
                        HStack {
                            Text(user.username)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundColor(Color("foreground_light_dark"))
                            HStack(spacing: 3) {
                                
                                // conditional UI icon cowok apa cewek + background
                                
                                if (user.gender) == "male" {
                                    Image("boy_icon_checked")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                    Text("\(user.age)")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("boy_gender_color"))
                                } else {
                                    Image("girl_icon_checked")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 12, height: 12)
                                    Text("\(user.age)")
                                        .font(.system(size: 12))
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("girl_gender_color"))
                                }
                            }
                            .padding(.vertical, 2)
                            .padding(.horizontal, 6)
                            .background(Color((user.gender) == "male" ? "boy_gender_color" : "girl_gender_color").opacity(0.1))
                            .cornerRadius(10)
                        }
                        
                        // lit ID
                        
                        HStack(spacing: 2) {
                            Text("Lit ID: \(String(user.litID))")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                            Image("user_lit_id_copy")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                        }
                        
                        HStack {
                            
                            // Postingan user disini...
                            
                            if (user.profileStatus).isEmpty {
                                
                            } else {
                                HStack(spacing: 5) {
                                    Image("\(user.profileStatus)")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    Text("\(user.profileStatus)")
                                        .font(.system(size: 16))
                                        .foregroundColor(Color("foreground_light_dark"))
                                        .opacity(0.5)
                                }
                            }
                        }
                        
                        // user bio
                        
                        HStack {
                            Text(user.profileBio)
                                .font(.system(size: 15, weight: .regular))
                                .multilineTextAlignment(.leading)
                        }
                        
                        //  icon kalender + tanggal bergabung user
                        
                        HStack {
                            HStack {
                                Image("calendar-svgrepo-com")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                Text("Bergabung \(user.dateJoined)")
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundColor(Color("foreground_light_dark"))
                                    .opacity(0.5)
                            }
                            .padding(.vertical, 6)
                            
                            // Lokasi user (jika ada)
                            
                            HStack {
                                if (user.userLocation).isEmpty {
                                    
                                } else {
                                    HStack(spacing: 4) {
                                        Image("me_location")
                                            .resizable()
                                            .renderingMode(.template)
                                            .frame(width: 16, height: 16)
                                        Text("\(user.userLocation)")
                                            .font(.system(size: 13, weight: .regular))
                                    }
                                    .foregroundColor(Color("primary"))
                                }
                            }
                            
                        }
                        
                        // tag2 user
                        
                        HStack {
                            ForEach(user.tag.indices, id: \.self) { tagtag in
                                Text(user.tag[tagtag])
                                    .font(.system(size: 12, weight: .regular))
                                    .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 8)
                                    .overlay( /// apply a rounded border
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color("foreground_light_dark").opacity(0.5), lineWidth: 0.8)
                                    )
                            }
                        }
                        
                    }
                    .padding(.top, -60)
                    .padding(.horizontal, 22)
                    Divider()
                        .opacity(0.5)
                    
                    // Postingan user.....
                    
                    if(user.post).isEmpty {
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
                        
                        // Looping to get all user posts
                        
                        ForEach(user.post.indices, id: \.self) { postingan in
                            VStack(alignment: .leading, spacing: 4) {
                                
                                // ini postingan user...
                                
                                VStack(alignment: .leading, spacing: 12){
                                    
                                    Text("\(user.post[postingan].datePosted)")
                                        .font(.system(size: 14, weight: .medium))
                                        .opacity(0.4)
                                    
                                    if(user.post[postingan].statusTag).isEmpty {
                                        
                                    } else {
                                        HStack {
                                            ForEach(user.post[postingan].statusTag.indices, id: \.self) { g in
                                                Text("\(user.post[postingan].statusTag[g])")
                                                    .lineLimit(1)
                                                    .font(.system(size: 16))
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(Color("primary"))
                                            }
                                        }
                                    }
                                    
                                    Text("\(user.post[postingan].statusText) ")
                                        .font(.system(size: 16, weight: .medium))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color("foreground_light_dark"))
                                    
                                    // Grid gambar disini...
                                    
                                    HStack(spacing: 12) {
                                        let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: (user.post[postingan].gambarPost.count) <= 3 ? user.post[postingan].gambarPost.count : 3)
                                        
                                        LazyVGrid(columns: columns, alignment: .leading, spacing: 3, content: {
                                            
                                            ForEach(user.post[postingan].gambarPost.indices, id: \.self) { gambar in
                                                Image("\(user.post[postingan].gambarPost[gambar])")
                                                    .resizable()
                                                    .padding(.vertical, 4)
                                                    .frame(width: (user.post[postingan].gambarPost.count) >= 3 ? 159 : 159, height: (user.post[postingan].gambarPost.count) >= 3 ? 159 : 211)
                                                    .cornerRadius(3)
                                            }
                                        })
                                    }
                                    
                                    // lokasi postingan user.. (jika ada)
                                    
                                    if (user.userLocation).isEmpty {
                                        
                                    } else {
                                        HStack(spacing: 4) {
                                            Image("feed_nearby_loc_icon")
                                                .resizable()
                                                .renderingMode(.template)
                                                .frame(width: 14, height: 14)
                                            Text("\(user.userLocation)")
                                                .font(.system(size: 12))
                                        }
                                        .foregroundColor(Color("primary"))
                                    }
                                    
                                    // komentar postingan
                                    
                                        if (user.post[postingan].feedComments).isEmpty {
                                            
                                            // jika belum ada komentar tampilin kolom komentar + your avatar
                                            // jika sudah ada komentar gausah nampilin kolom komentar
                                            
                                            HStack() {
                                                Image("\(yourProfile.avatar)")
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
                                
                                
                                // postingan likess....
                                
                                HStack(spacing: 18) {
                                    Spacer()
                                    
                                    // icon like + count jumlah likes postingan
                                    
                                    HStack(spacing: 1) {
                                        
                                        Image("comment_like")
                                            .renderingMode(.template)
                                        
                                        if (user.post[postingan].feedLikes).isEmpty {
                                            Text("")
                                        } else {
                                            Text("\(user.post[postingan].feedLikes.count)")
                                                .font(.system(size: 13))
                                        }
                                    }
                                    
                                    // icon comment + count jumlah comment postingan
                                    NavigationLink(destination: Feed_PostDetail(user: person), label: {
                                        HStack(spacing: 1) {
                                            Image("comment_icon")
                                                .renderingMode(.template)
                                            
                                            if(user.post[postingan].feedComments).isEmpty {
                                                Text("")
                                            } else {
                                                Text("\(user.post[postingan].feedComments.count)")
                                                    .font(.system(size: 13))
                                            }
                                        }
                                    })
                                    
                                    // share postingan UI Bootom Sheet + count jumlah share postingan
                                    
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
                                        
                                        // count jumlah share postingan
                                        
                                        if user.post[postingan].feedShare == 0 {
                                            Text("")
                                        } else {
                                            Text("\(user.post[postingan].feedShare)")
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
                HStack {
                    
                }
                .frame(height: 300)
            }
            
            // Tampilan Follow + Chat fixed

            Divider()
            HStack(spacing: 12) {
                HStack {
                    Image("user_detail_icon_follow")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 28, height: 28)
                    Text("Ikuti")
                        .font(.system(size: 22, weight: .semibold))
                }
                .foregroundColor(Color("primary"))
                .padding(.vertical, 10)
                .padding(.horizontal, UIScreen.main.bounds.size.width * 0.06)
                .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color("primary"), lineWidth: 2)
                        )

                HStack {
                    Image("ic_hand")
                        .resizable()
                        .frame(width: 28, height: 28)
                    Text("Chat")
                        .font(.system(size: 22, weight: .semibold))
                        .foregroundColor(Color.white)
                }
                .padding(.vertical, 10)
                .padding(.horizontal, UIScreen.main.bounds.size.width * 0.16)
                .background(Color("primary"))
                .clipShape(Capsule())
            }
            .padding(.horizontal, 16)
            
        }
        
        // Color untuk both Dark mode and Light Mode
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))
        .navigationBarBackButtonHidden(true)
        
        // tampilan di paling atas view
        
        .toolbar {
            // 2
            ToolbarItem(placement: .navigationBarLeading) {
                HStack(spacing: 12) {
                    Button {
                        dismiss()
                    } label: {
                        // 4
                        ZStack {
                            Circle()
                                .fill(Color("foreground_light_dark"))
                                .frame(width: 40, height: 40)
                                .opacity(homeData.offset > 1 ? 0 : 0.3)
                            Image("back_day")
                                .renderingMode(.template)
                                .resizable()
                                .frame(width: 36, height: 36)
                                .foregroundColor(homeData.offset > 1 ? Color("foreground_light_dark") : Color("background_light_dark"))
                        }
                    }
                    Image(user.avatar)
                        .resizable()
                        .frame(width: 36, height: 36)
                        .opacity(homeData.offset > 50 ? 1 : 0)
                    
                    Text(user.username)
                        .font(.system(size: 18, weight: .bold))
                        .opacity(homeData.offset > 50 ? 1 : 0)
                        .foregroundColor(Color("foreground_light_dark"))
                }
                .padding(.bottom, 16)
                if homeData.offset > 50 {
                    Divider()
                }
            }
            
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    ZStack {
                        Circle()
                            .fill(Color("foreground_light_dark"))
                            .frame(width: 40, height: 40)
                            .opacity(homeData.offset > 1 ? 0 : 0.3)
                        Image("user_menu_op_zone_2")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .foregroundColor(homeData.offset > 1 ? Color("foreground_light_dark") : Color("background_light_dark"))
                    }
                    
                    ZStack {
                        Circle()
                            .fill(Color("foreground_light_dark"))
                            .frame(width: 40, height: 40)
                            .opacity(homeData.offset > 1 ? 0 : 0.3)
                        Image("black_menu_icon")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 36, height: 36)
                            .foregroundColor(homeData.offset > 1 ? Color("foreground_light_dark") : Color("background_light_dark"))
                    }
                }
                .padding(.bottom, 16)
            }
            
        }
        .toolbarBackground( homeData.offset > 1 ? Color("background_light_dark") : .clear, for: .navigationBar)
        .toolbarBackground( homeData.offset > 1 ? .visible : .hidden, for: .navigationBar)
        .edgesIgnoringSafeArea(.top)
    }
}

struct DetailProfileUser_Previews: PreviewProvider {
    static var previews: some View {
        DetailProfileUser(user: User.samplePerson)
    }
}
