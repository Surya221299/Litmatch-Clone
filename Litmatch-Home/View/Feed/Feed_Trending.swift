//
//  Feed_Trending.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 22/09/23.
//

import SwiftUI

struct Feed_Trending: View {
    
    // var untuk to get all trending tag model
    
    @ObservedObject var trendingTag = ReadJSONTrendingData()
    
    // var untuk mendapatkan semua postingan user
    
    private var people: [User] = User.allPeople
    
    // var untuk mendapatkan informasi detail postingan user
    
    var person: User = User.samplePerson
    
    // var untuk textfield komentar
    
    @State private var komentar: String = ""
    
    // var untuk tampilan Bottom sheet
    
    @State private var showingBottomSheet = false
    @State var detentHeight: CGFloat = 0
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                VStack {
                    
                    HStack( alignment: .top, spacing: 16) {
                        
                        // list trending tag + image (horizontal scroll)
                        
                        ForEach(trendingTag.tags) { info in
                            
                            VStack() {
                                
                                ZStack(alignment: .bottomTrailing) {
                                    Image(info.image)
                                        .resizable()
                                        .frame(width: 52, height: 52)
                                        .clipShape(Circle())
                                    Image(info.overlay_feed_icon)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(height: 19)
                                        .offset(x: 2)
                                }
                                
                                Text(info.title)
                                    .font(.system(size: 11, weight: .regular))
                                    .multilineTextAlignment(.center)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .frame(width: 52)
                            }
                        }
                    }
                    Rectangle().fill(Color("foreground_light_dark").opacity(0.1)).frame(height: 0.5, alignment: .center)
                        .padding(.horizontal, 12)
                }
               
            }
            
            VStack(spacing: 0) {
                
                // Looping to get all user last post (jika ada)
                
                ForEach(people, id: \.litID) { person in
                    NavigationLink(destination: Feed_PostDetail(user: person), label: {
                        if (person.post).isEmpty {
                            
                        } else {
                            
                            VStack {
                                
                                HStack(alignment: .top, spacing: 12) {

                                    VStack {
                                        ZStack(alignment: .topTrailing) {
                                            
                                            // ini untuk avatar user
                                            
                                            Image(person.avatar)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 50, height: 50)
                                            Circle()
                                                .strokeBorder(.white, lineWidth: 3)
                                                .frame(width: 17, height:17)
                                                .background(Circle().fill(Color("light-blue")))
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                        }
                                        .frame(width: 50, height: 50)
                                    }

                                    VStack(alignment: .leading, spacing: 4) {
                                        HStack {
                                            VStack(alignment: .leading, spacing: 2) {
                                                HStack(spacing: 4) {
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
                                                                .font(.system(size: 13))
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
                                                    
                                                }
                                                
                                                // ini conditional untuk emot status
                                                
                                                if (person.profileStatus).isEmpty {
                                                    Text(person.lastSeen)
                                                        .font(.system(size: 12))
                                                        .opacity(0.5)
                                                        .foregroundColor(Color("foreground_light_dark"))
                                                        .multilineTextAlignment(.leading)
                                                } else {
                                                    HStack(spacing: 5) {
                                                        Image("\(person.profileStatus)")
                                                            .resizable()
                                                            .frame(width: 16, height: 16)
                                                        Text("\(person.profileStatus)")
                                                            .font(.system(size: 12))
                                                            .foregroundColor(Color("foreground_light_dark"))
                                                            .opacity(0.5)
                                                    }
                                                }
                                            }
                                            .padding(.top, 4)
                                            
                                            // chat and setting here...
                                            
                                            Spacer()
                                            Text("Chat")
                                                .font(.system(size: 12))
                                                .foregroundColor(Color("primary"))
                                                .padding(.horizontal, 8)
                                                .padding(.vertical, 5)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color.purple, lineWidth: 0.5)
                                                )
                                            Image("feed_dot")
                                                .renderingMode(.template)
                                                .foregroundColor(Color("foreground_light_dark").opacity(0.4))
                                        }
                                        .padding(.bottom, 12)

                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            // ini postingan user...
                                            
                                            VStack(alignment: .leading, spacing: 4){
                                                
                                                if(person.post[0].statusTag).isEmpty {
                                                    
                                                } else {
                                                    HStack {
                                                        ForEach(person.post[0].statusTag.indices, id: \.self) { g in
                                                            Text("\(person.post[0].statusTag[g])")
                                                                .lineLimit(1)
                                                                .font(.system(size: 16))
                                                                .multilineTextAlignment(.leading)
                                                                .foregroundColor(Color("primary"))
                                                        }
                                                    }
                                                }
                                                    
                                                    Text("\(person.post[0].statusText) ")
                                                        .font(.system(size: 16))
                                                        .multilineTextAlignment(.leading)
                                                        .foregroundColor(Color("foreground_light_dark"))
                                                
                                                // Grid gambar disini...
                                                
                                                HStack(spacing: 12) {
                                                    let columns = Array(repeating: GridItem(.flexible(), spacing: 3), count: (person.post[0].gambarPost.count) <= 3 ? person.post[0].gambarPost.count : 3)
                                                    
                                                    LazyVGrid(columns: columns, alignment: .leading, spacing: 3, content: {
                                                        
                                                        ForEach(person.post[0].gambarPost.indices, id: \.self) { gambar in
                                                            Image("\(person.post[0].gambarPost[gambar])")
                                                                .resizable()
                                                                .padding(.vertical, 4)
                                                                .frame(width: (person.post[0].gambarPost.count) >= 3 ? 159 : 159, height: (person.post[0].gambarPost.count) >= 3 ? 159 : 211)
                                                                .cornerRadius(3)
                                                        }
                                                    })
                                                }
                                                
                                                // lokasi postingan (jika ada)
                                                
                                                if (person.userLocation).isEmpty {
                                                    
                                                } else {
                                                    HStack(spacing: 4) {
                                                        Image("feed_nearby_loc_icon")
                                                            .resizable()
                                                            .renderingMode(.template)
                                                            .frame(width: 14, height: 14)
                                                        Text("\(person.userLocation)")
                                                            .font(.system(size: 12))
                                                    }
                                                    .foregroundColor(Color("primary"))
                                                }
                                                
                                                if (person.post[0].feedComments).isEmpty {
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
                                                
                                                HStack(spacing: 1) {
                                                    
                                                    Image("comment_like")
                                                        .renderingMode(.template)
                                                    
                                                    if (person.post[0].feedLikes).isEmpty {
                                                        Text("")
                                                    } else {
                                                        Text("\(person.post[0].feedLikes.count)")
                                                            .font(.system(size: 13))
                                                    }
                                                }
                                                
                                                HStack(spacing: 1) {
                                                    Image("comment_icon")
                                                        .renderingMode(.template)
                                                    
                                                    if(person.post[0].feedComments).isEmpty {
                                                        Text("")
                                                    } else {
                                                        Text("\(person.post[0].feedComments.count)")
                                                            .font(.system(size: 13))
                                                    }
                                                }
                                                
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
                                                    
                                                    if person.post[0].feedShare == 0 {
                                                        Text("")
                                                    } else {
                                                        Text("\(person.post[0].feedShare)")
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
                                Rectangle().fill(Color("foreground_light_dark").opacity(0.1)).frame(height: 0.3, alignment: .center)
                                    .padding(.bottom, 12)
                            }
                        }
                    })
                }
            }
        }
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))
    }
    
}

struct Feed_Trending_Previews: PreviewProvider {
    static var previews: some View {
        Feed_Trending()
    }
}

// struct untuk tinggi Bottom Sheet sesuai konten

struct HeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat?
    
    static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let nextValue = nextValue() else { return }
        value = nextValue
    }
}

private struct ReadHeightModifier: ViewModifier {
    private var sizeView: some View {
        GeometryReader { geometry in
            Color.clear.preference(key: HeightPreferenceKey.self, value: geometry.size.height)
        }
    }
    
    func body(content: Content) -> some View {
        content.background(sizeView)
    }
}

extension View {
    func readHeight() -> some View {
        self
            .modifier(ReadHeightModifier())
    }
}
