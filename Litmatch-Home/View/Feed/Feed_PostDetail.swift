//
//  Feed_PostDetail.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 04/10/23.
//

import SwiftUI

struct Feed_PostDetail: View {
    
    // var untuk mendapatkan data diri profil utama
    
    var yourProfile: YourProfileModel = YourProfileModel.yourDataDiri
    
    // var untuk textfield komentar
    
    @State private var komentar: String = ""
    
    // var untuk tampilan bottom sheet
    
    @State private var showingBottomSheet = false
    
    // var untuk tampilan bottom Likes
    
    @State private var showingBottomSheetLikes = false
    
    // var untuk tampilan bottom sheet
    
    @State var detentHeight: CGFloat = 0
    
    // var untuk tampilan eksplisit user
    
    var user: User
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                
                    HStack(alignment: .top, spacing: 12) {
                        
                        VStack {
                            ZStack(alignment: .topTrailing) {
                                
                                // ini untuk avatar user
                                
                                Image(user.avatar)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 42, height: 42)
                            }
                            .frame(width: 42, height: 42)
                        }
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            HStack {
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    
                                    HStack(spacing: 2) {
                                        Text(user.username)
                                            .font(.system(size: 16))
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color("foreground_light_dark"))
                                        
                                        HStack(spacing: 3) {
                                            
                                            // conditional UI icon cowok apa cewek + background
                                            
                                            if (user.gender) == "male" {
                                                Image("boy_icon_checked")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 12, height: 12)
                                                Text("\(user.age)")
                                                    .font(.system(size: 13))
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
                                    // ini conditional untuk emot status
                                    
                                    Text(user.lastSeen)
                                        .font(.system(size: 12))
                                        .opacity(0.5)
                                        .foregroundColor(Color("foreground_light_dark"))
                                        .multilineTextAlignment(.leading)
                                }
                                .padding(.top, 4)
                                
                                Spacer()
                                
                                // langsung ke view chat user if tapped (Coming Soon)
                                
                                Text("Chat")
                                    .font(.system(size: 12))
                                    .foregroundColor(Color("primary"))
                                    .padding(.horizontal, 8)
                                    .padding(.vertical, 5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.purple, lineWidth: 0.5)
                                    )
                                
                                // setting user post Bottom Sheet (tidak sukai, laporkan + batalkan button) (Coming Soon)
                                
                                Image("feed_dot")
                                    .renderingMode(.template)
                                    .foregroundColor(Color("foreground_light_dark").opacity(0.4))
                            }
                            .padding(.bottom, 12)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                
                                // ini status tag user (jika ada)...
                                
                                VStack(alignment: .leading, spacing: 4){
                                    
                                    if(user.post[0].statusTag).isEmpty {
                                        
                                    } else {
                                        HStack {
                                            ForEach(user.post[0].statusTag.indices, id: \.self) { g in
                                                Text("\(user.post[0].statusTag[g])")
                                                    .lineLimit(1)
                                                    .font(.system(size: 16))
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(Color("primary"))
                                            }
                                        }
                                    }
                                    
                                    Text("\(user.post[0].statusText) ")
                                        .font(.system(size: 16))
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(Color("foreground_light_dark"))
                                    
                                    // Grid gambar disini...
                                    
                                    HStack(spacing: 12) {
                                        let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: (user.post[0].gambarPost.count) <= 3 ? user.post[0].gambarPost.count : 3)
                                        
                                        LazyVGrid(columns: columns, alignment: .leading, spacing: 3, content: {
                                            
                                            ForEach(user.post[0].gambarPost.indices, id: \.self) { gambar in
                                                Image("\(user.post[0].gambarPost[gambar])")
                                                    .resizable()
                                                    .padding(.vertical, 4)
                                                    .frame(width: (user.post[0].gambarPost.count) >= 3 ? 159 : 159, height: (user.post[0].gambarPost.count) >= 3 ? 159 : 211)
                                                    .cornerRadius(3)
                                            }
                                        })
                                    }
                                    
                                    // lokasi postingan (jika ada)
                                    
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
                                    
                                    // jika belum ada komentar tampilin kolom komentar + your avatar
                                    // jika sudah ada komentar gausah nampilin kolom komentar
                                    
                                    if (user.post[0].feedComments).isEmpty {
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
                                
                                // tampilan postingan likes, comment, share
                                
                                HStack(spacing: 18) {
                                    Spacer()
                                    
                                    // icon + count postingan likes
                                    
                                    HStack(spacing: 1) {
                                        
                                        Image("comment_like")
                                            .renderingMode(.template)
                                        
                                        if (user.post[0].feedLikes).isEmpty {
                                            Text("")
                                        } else {
                                            Text("\(user.post[0].feedLikes.count)")
                                                .font(.system(size: 13))
                                        }
                                    }
                                    
                                    // icon + count postingan share
                                    
                                    HStack(spacing: 1) {
                                        Image("comment_icon")
                                            .renderingMode(.template)
                                        
                                        if(user.post[0].feedComments).isEmpty {
                                            Text("")
                                        } else {
                                            Text("\(user.post[0].feedComments.count)")
                                                .font(.system(size: 13))
                                        }
                                    }
                                    // icon + count postingan share
                                    
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
                                        
                                        if user.post[0].feedShare == 0 {
                                            Text("")
                                        } else {
                                            Text("\(user.post[0].feedShare)")
                                                .font(.system(size: 13))
                                        }
                                    }
                                    .padding(.trailing, 32)
                                }
                                .foregroundColor(Color("foreground_light_dark").opacity(0.4))
                                .frame(maxWidth: .infinity)
                                 
                            }
                            
                        }
                        
                    }
                
                    // pesan di bawah postingan yang rame
                    
                    HStack(spacing: 4) {
                        Image("police_icon")
                            .resizable()
                            .frame(width: 29, height: 29)
                        Text("Tekan lama pada komen untuk hapus atau lapor")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                        
                        Spacer()
                        Image("ic_call_ended_close")
                            .resizable()
                            .frame(width: 29, height: 29)
                    }
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color("foreground_light_dark").opacity(0.02))
                    .cornerRadius(6)
                    
                    Rectangle().fill(Color("foreground_light_dark").opacity(0.1)).frame(height: 0.3, alignment: .center)
                        .padding(.bottom, 12)
                    

                    HStack(spacing: 16) {
                        Text("Komentar (\(user.post[0].feedComments.count))")
                            .font(.system(size: 16))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("foreground_light_dark"))
                        
                        // kasi bottom sheet disini.......
                        
                        Button( action: {
                            showingBottomSheetLikes.toggle()
                        }, label: {
                            Text("Suka dan reaksi (\(user.post[0].feedLikes.count))")
                                .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                .font(.system(size: 16))
                                .fontWeight(.medium)
                            Spacer()
                        })
                        .sheet(isPresented: self.$showingBottomSheetLikes) {
                            Feed_PostLikes(user: user)
                                .background(Color("background_light_dark"))
                                .readHeight()
                                .onPreferenceChange(HeightPreferenceKey.self) { height in
                                    if let height {
                                        self.detentHeight = height
                                    }
                                }
                                .presentationDetents([.height(self.detentHeight)])
                        }
 
                    }
                    
                    
                    // List Komentar postingan disini.... (jika ada)
                    
                    if (user.post[0].feedComments).isEmpty {
                        
                        // jika belum ada komentar tampikan gambar + pesan
                        
                        VStack(spacing: 24) {
                            Image("pic_data_empty")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 100)
                            
                            Text("Penulis menantikan komentar kamu ~")
                                .font(.system(size: 15))
                                .fontWeight(.medium)
                                .foregroundColor(Color("foreground_light_dark").opacity(0.4))
                        }
                        .padding(.top, 130)
                        
                        // jika sudah ada komentar tampilkan semua komentar dan re-comment
                        
                    } else {
                        
                        VStack {
                            
                            // Lopping to get all comment on each post
                            
                            ForEach(user.post[0].feedComments.indices, id: \.self) { comment in
                                
                                VStack(alignment: .leading, spacing: 2) {
                                    
                                    VStack(spacing: 20) {
                                        HStack(spacing: 16) {

                                            // avatar user yg komen
                                            
                                            Image("\(user.post[0].feedComments[comment].avatarComments)")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 36, height: 36)
                                            
                                            
                                            VStack(alignment: .leading) {
                                                
                                                HStack(spacing: 4) {
                                                    
                                                    // nama user yg komen
                                                    
                                                    Text("\(user.post[0].feedComments[comment].userComments)")
                                                        .font(.system(size: 13))
                                                        .fontWeight(.bold)
                                                        .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                                    
                                                    HStack(spacing: 3) {
                                                        
                                                        // conditional UI icon cowok apa cewek + background
                                                        
                                                        if (user.post[0].feedComments[comment].genderComments) == "male" {
                                                            Image("boy_icon_checked")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .frame(width: 12, height: 12)
                                                            Text("\(user.post[0].feedComments[comment].ageComments)")
                                                                .font(.system(size: 13))
                                                                .fontWeight(.bold)
                                                                .foregroundColor(Color("boy_gender_color"))
                                                        } else {
                                                            Image("girl_icon_checked")
                                                                .resizable()
                                                                .aspectRatio(contentMode: .fit)
                                                                .frame(width: 12, height: 12)
                                                            Text("\(user.post[0].feedComments[comment].ageComments)")
                                                                .font(.system(size: 12))
                                                                .fontWeight(.bold)
                                                                .foregroundColor(Color("girl_gender_color"))
                                                        }
                                                        
                                                    }
                                                    .padding(.vertical, 2)
                                                    .padding(.horizontal, 6)
                                                    .background(Color((user.post[0].feedComments[comment].genderComments) == "male" ? "boy_gender_color" : "girl_gender_color").opacity(0.1))
                                                    .cornerRadius(10)
                                                    
                                                    // Status yang komen (penulis atau bukan)
                                                    // jika bukan penulis maka kososng
                                                    // jika yg komen penulis maka ada tag penulis
                                                    
                                                    if(user.post[0].feedComments[comment].commentStatus).isEmpty {
                                                        
                                                    } else {
                                                        
                                                        // ini tag penulis
                                                        
                                                        Text("\(user.post[0].feedComments[comment].commentStatus)")
                                                            .font(.system(size: 10))
                                                            .fontWeight(.regular)
                                                            .padding(.horizontal, 6)
                                                            .padding(.vertical, 4)
                                                            .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                                            .background(Color("foreground_light_dark").opacity(0.04))
                                                            .cornerRadius(8)
                                                    }
                                                    
                                                    // tanggal mundur komentar
                                                    
                                                    Text(user.post[0].feedComments[comment].commentPostedDate)
                                                        .font(.system(size: 12))
                                                        .opacity(0.5)
                                                        .foregroundColor(Color("foreground_light_dark"))
                                                        .multilineTextAlignment(.leading)
                                                    
                                                    Spacer()
                                                    
                                                    // icon like komentar
                                                    
                                                    Image("comment_like")
                                                        .renderingMode(.template)
                                                        .resizable()
                                                        .frame(width: 20, height: 20)
                                                }
                                                
                                                // komentar postingan
                                                
                                                Text("\(user.post[0].feedComments[comment].comments)")
                                                    .font(.system(size: 16))
                                                    .multilineTextAlignment(.leading)
                                                    .fontWeight(.regular)
                                                    .foregroundColor(Color("foreground_light_dark"))
                                                
                                            }
                                            
                                        }
                                        // Looping to get all komentar balasan (re-comment) disini...
                                        
                                        VStack(alignment: .leading) {
                                            
                                            ForEach(user.post[0].feedComments[comment].feedReComments.indices, id: \.self) { recoment in
                                                
                                                // Re-comment here...
                                                
                                                HStack(spacing: 8) {
                                                    
                                                    // avatar user yang re-comment
                                                    
                                                    Image("\(user.post[0].feedComments[comment].feedReComments[recoment].avatarReComments)")
                                                        .resizable()
                                                        .aspectRatio(contentMode: .fit)
                                                        .frame(width: 25, height: 25)
                                                    
                                                    // nama user yang re-comment
                                                    
                                                    HStack(spacing: 4) {
                                                        Text("\(user.post[0].feedComments[comment].feedReComments[recoment].userReComments)")
                                                            .font(.system(size: 15))
                                                            .fontWeight(.medium)
                                                            .foregroundColor(Color("foreground_light_dark"))
                                                        
                                                        HStack(spacing: 5) {
                                                            
                                                            // conditional UI icon cowok apa cewek + background
                                                            
                                                            if(user.post[0].feedComments[comment].feedReComments[recoment].genderReComments) == "male" {
                                                                Image("boy_icon_checked")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width: 10, height: 10)
                                                                Text("\(user.post[0].feedComments[comment].feedReComments[recoment].ageReComments)")
                                                                    .font(.system(size: 13))
                                                                    .fontWeight(.bold)
                                                                    .foregroundColor(Color("boy_gender_color"))
                                                            } else {
                                                                Image("girl_icon_checked")
                                                                    .resizable()
                                                                    .aspectRatio(contentMode: .fit)
                                                                    .frame(width: 10, height: 10)
                                                                Text("\(user.post[0].feedComments[comment].feedReComments[recoment].ageReComments)")
                                                                    .font(.system(size: 12))
                                                                    .fontWeight(.bold)
                                                                    .foregroundColor(Color("girl_gender_color"))
                                                            }
                                                            
                                                        }
                                                        .padding(.vertical, 2)
                                                        .padding(.horizontal, 6)
                                                        .background(Color((user.post[0].feedComments[comment].feedReComments[recoment].genderReComments) == "male" ? "boy_gender_color" : "girl_gender_color").opacity(0.1))
                                                        .cornerRadius(10)
                                                        
                                                        // Status yang re-komen (penulis atau bukan)
                                                        // jika bukan penulis maka kososng
                                                        // jika yg re-komen penulis maka ada tag penulis
                                                        
                                                        if(user.post[0].feedComments[comment].feedReComments[recoment].userReCommentStatus).isEmpty {
                                                            
                                                        } else {
                                                            Text("\(user.post[0].feedComments[comment].feedReComments[recoment].userReCommentStatus)")
                                                                .font(.system(size: 10))
                                                                .fontWeight(.regular)
                                                                .padding(.horizontal, 6)
                                                                .padding(.vertical, 4)
                                                                .foregroundColor(Color("foreground_light_dark").opacity(0.5))
                                                                .background(Color("foreground_light_dark").opacity(0.04))
                                                                .cornerRadius(8)
                                                        }
                                                        
                                                        // tanggal mundur re-comment
                                                        
                                                        Text(user.post[0].feedComments[comment].feedReComments[recoment].recommentPostedDate)
                                                            .font(.system(size: 12))
                                                            .opacity(0.5)
                                                            .foregroundColor(Color("foreground_light_dark"))
                                                            .multilineTextAlignment(.leading)
                                                        
                                                        Spacer()
                                                        Image("comment_like")
                                                            .renderingMode(.template)
                                                            .resizable()
                                                            .frame(width: 20, height: 20)
                                                    }
                                                }
                                                .padding(.top, 12)
                                                .padding(.horizontal, 12)
                                                
                                                // Komentar balasan (re-commen)
                                                
                                                Text("\(user.post[0].feedComments[comment].feedReComments[recoment].reComment)")
                                                    .font(.system(size: 16))
                                                    .fontWeight(.medium)
                                                    .multilineTextAlignment(.leading)
                                                    .foregroundColor(Color("foreground_light_dark"))
                                                    .padding(.leading, 48)
                                                    .padding(.bottom, 12)
                                                
                                                Rectangle().fill(Color("foreground_light_dark").opacity(0.1)).frame(height: 0.3, alignment: .center)
                                                    .padding(.horizontal, 12)
                                                
                                            }
                                        }
                                        .background(Color("foreground_light_dark").opacity(0.02))
                                        .padding(.leading, 40)
                                        .cornerRadius(6)
                                    }
                                    
                                }
                                .padding(.top, 4)
                            }
                        }
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 16)
            
            // Textfield Tulis Komentar di paling bawah view
            
            HStack {
                Image("emoji_icn")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color("foreground_light_dark").opacity(0.9))
                    .padding(2)
                Image("at_sign")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 28, height: 28)
                    .padding(2)
                    .foregroundColor(Color("foreground_light_dark").opacity(0.9))
                TextField ("Komentar ramah...", text: $komentar)
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 12)
                    .padding(.leading, 16)
                    .background(Color("foreground_light_dark").opacity(0.02))
                    .cornerRadius(20)
                    .font(.system(size: 15))
                    .fontWeight(.medium)
                    .foregroundColor(Color("foreground_light_dark"))
                
                Button("Kirim") {
                    /// Execution here...
                }
                .font(.system(size: 14))
                .fontWeight(.medium)
                .foregroundColor(Color("background_light_dark"))
                .padding(.vertical, 12)
                .padding(.horizontal, 16)
                .background(Color("primary"))
                .clipShape(Capsule())
                
            }
        }
        
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))

        // This is navigation item
        
        .toolbar {
            // 2
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    // 4
                    HStack {
                        Image("back_day")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(Color("foreground_light_dark"))
                            .frame(width: 36, height: 36)
                    }
                }
            }
            
        }
        .padding(.bottom, 12)
        .toolbarBackground(Color("background_light_dark"),
                           for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Detail")
        
        
    }
}

struct Feed_PostDetail_Previews: PreviewProvider {
    static var previews: some View {
        Feed_PostDetail(user: User.samplePerson)
    }
}
