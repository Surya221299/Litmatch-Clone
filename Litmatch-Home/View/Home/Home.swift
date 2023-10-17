//
//  Home.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 12/09/23.
//

import SwiftUI

struct Home: View {
    
    let bestMatch:LocalizedStringKey = "bestMatch"
    let bestMatchSub:LocalizedStringKey = "bestMatchSub"
    
    // var to get all users on JSON
    
    private var people: [User] = User.allPeople
    
    // gambar untuk animasi dot online
    
    let online_dot = ["online_dot_00000", "online_dot_00004", "online_dot_00008", "online_dot_00013", "online_dot_00017", "online_dot_00022", "online_dot_00026", "online_dot_00032", "online_dot_00037", "online_dot_00041"]
    
    // gambar untuk animasi grafik party
    
    let party_on = ["party_on_1_list", "party_on_2_list", "party_on_3_list", "party_on_4_list", "party_on_5_list"]
    
    // index awal untuk animasi dot online
    
    @State var activeImageIndex = 0

    // index awal untuk animasi grafik party
    
    @State var activeImageIndexParty = 0
    
    // timer untuk animasi dot online
    
    let onlineDotSwitchTimer = Timer.publish(every: 0.3, on: .main, in: .common)
                                .autoconnect()
    // time untuk animasi grafik party
    
    let onlineDotSwitchTimerParty = Timer.publish(every: 0.15, on: .main, in: .common)
                                .autoconnect()
    
    // state untuk Bottom sheet
    
    @State private var showingBottomSheetSift = false
    @State var detentHeight: CGFloat = 0
    
    // state untuk pop up hey There
    
    @State var heyThere = false
    
    
    
    var body: some View {
        ZStack {
            VStack(spacing: UIScreen.main.bounds.size.height * 0.02) {
                
                // Top App bar Fixed
                
                HStack {
                    
                    // Sift Filter
                    
                    Button( action: {
                        showingBottomSheetSift.toggle()
                    }, label: {
                        Image("home_sift")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 47, height: 24)
                    })
                    .sheet(isPresented: self.$showingBottomSheetSift) {
                        HomeSiftFilter()
                            .background(Color("background_light_dark"))
                            .readHeight()
                            .onPreferenceChange(HeightPreferenceKey.self) { height in
                                if let height {
                                    self.detentHeight = height
                                }
                            }
                            .presentationDetents([.height(self.detentHeight)])
                    }
                    Spacer()
                    
                    // Litmatch Title
                    
                    Text("Litmatch")
                        .font(.custom("goldplay-black", size: 21))
                    Spacer()
                    
                    // hey There
                    Button( action: {
                        withAnimation {
                            heyThere.toggle()
                        }
                    }, label: {
                        Image("hey_there_actived")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 24)
                    })
                    
                    
                }
                
                // Scrollable view...
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 18) {
                        HStack(spacing: 6) {
                            
                            // Soul Game
                            
                            VStack {
                                Image("icon_soul_match")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.size.width * 0.15, height: 65)
                                    .padding(.top, UIScreen.main.bounds.size.width * 0.045)
                                    .padding(.horizontal, UIScreen.main.bounds.size.width * 0.072)
                                VStack(spacing: 2) {
                                    Text("Soul Game")
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                    HStack(spacing: 4) {
                                        Image(online_dot[activeImageIndex])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 16, height: 16)
                                            .onReceive(onlineDotSwitchTimer) { _ in
                                                // Go to the next image. If this is the last image, go
                                                // back to the image #0
                                                self.activeImageIndex = (self.activeImageIndex + 1) % self.online_dot.count
                                            }
                                        
                                        Text("72429 Online")
                                            .font(.system(size: 13))
                                    }
                                    .padding(.bottom, 18)
                                }
                            }
                            .background(Color("soul_game_background"))
                            .cornerRadius(7)
                            
                            // Voice Game...
                            
                            VStack {
                                Image("icon_voice_match")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.size.width * 0.15, height: 65)
                                    .padding(.top, UIScreen.main.bounds.size.width * 0.045)
                                    .padding(.horizontal, UIScreen.main.bounds.size.width * 0.072)
                                VStack(spacing: 2) {
                                    Text("Voice Game")
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                    HStack(spacing: 4) {
                                        Image(online_dot[activeImageIndex])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 16, height: 16)
                                            .onReceive(onlineDotSwitchTimer) { _ in
                                                // Go to the next image. If this is the last image, go
                                                // back to the image #0
                                                self.activeImageIndex = (self.activeImageIndex + 1) % self.online_dot.count
                                            }
                                        Text("72429 Online")
                                            .font(.system(size: 13))
                                    }
                                    .padding(.bottom, 18)
                                }
                            }
                            .background(Color("voice_game_background"))
                            .cornerRadius(7)
                            
                            // Grup Chat....
                            
                            VStack {
                                Image("party_chat")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: UIScreen.main.bounds.size.width * 0.15, height: 65)
                                    .padding(.top, UIScreen.main.bounds.size.width * 0.045)
                                    .padding(.horizontal, UIScreen.main.bounds.size.width * 0.072)
                                VStack(spacing: 2) {
                                    Text("Grup Chat")
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                    HStack(spacing: 4) {
                                        Image(party_on[activeImageIndexParty])
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 16, height: 16)
                                            .onReceive(onlineDotSwitchTimerParty) { _ in
                                                // Go to the next image. If this is the last image, go
                                                // back to the image #0
                                                self.activeImageIndexParty = (self.activeImageIndexParty + 1) % self.party_on.count
                                            }
                                        Text("72429 Online")
                                            .font(.system(size: 13))
                                    }
                                    .padding(.bottom, 18)
                                }
                            }
                            .background(Color("group_chat_background"))
                            .cornerRadius(7)
                        }
                        
                        // Instant Chat...
                        
                        HStack(spacing: 12) {
                            Image("ic_home_best_match")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 65)
                                .padding(.vertical, 4)
                                .padding(.leading, 8)
                            VStack(alignment: .leading, spacing: 8) {
                                Text(bestMatch)
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                Text(bestMatchSub)
                                    .font(.system(size: 13))
                            }
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color("instant_chat_background"))
                        
                        // list user here using ForEach from JSON data...
                        
                        VStack(spacing: 8) {
                            
                            // User Pertama
                            
                            ForEach(people, id: \.litID) { person in
                                NavigationLink(destination: DetailProfileUser(user: person), label: {
                                    HStack( spacing: 18) {
                                        ZStack(alignment: .topTrailing) {
                                            
                                            // ini untuk avatar user
                                            
                                            Image(person.avatar)
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 60, height: 60)
                                            
                                            // ini conditional untuk emot di kanan atas avatar
                                            
                                            if (person.profileStatus).isEmpty {
                                                
                                            } else {
                                                ZStack(alignment: .center) {
                                                    Circle()
                                                        .fill(Color("foreground_light_dark").opacity(0.2))
                                                        .frame(width: 30, height: 30)
                                                    Image("\(person.profileStatus)")
                                                        .resizable()
                                                        .frame(width: 23, height: 23)
                                                        .offset(x: 0.5, y: -0.5)
                                                    
                                                }
                                                .offset(x: 8, y: -5)
                                            }
                                            
                                            // lingkaran hijau di kanan bawah avatar
                                            
                                            Circle()
                                                .strokeBorder(.white, lineWidth: 3)
                                                .frame(width: 17, height:17)
                                                .background(Circle().fill(Color("light-blue")))
                                                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                                        }
                                        .frame(width: 60, height: 60)
                                        
                                        // nama user dan bio user
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            
                                            // nama user
                                            
                                            HStack( spacing: 8) {
                                                Text(person.username)
                                                    .font(.system(size: 16))
                                                    .fontWeight(.semibold)
                                                
                                                HStack(spacing: 3) {
                                                    
                                                    // conditional UI icon cowok apa cewek + warna background
                                                    
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
                                            }
                                            
                                            // user bio
                                            
                                            Text(person.profileBio)
                                                .font(.system(size: 12))
                                                .opacity(0.5)
                                                .multilineTextAlignment(.leading)
                                        }
                                        Spacer()
                                    }
                                    .padding(.vertical, 4)
                                })
                            }
                            
                        }
                    }
                    
                    .ignoresSafeArea()
                }
            }
            .padding(.horizontal, UIScreen.main.bounds.size.width * 0.03)
            if heyThere {
                HeyThere(show: $heyThere)
            }
        }
        
        // Color untuk both Dark mode and Light Mode
        
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))
    }
    
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
    }
}

// Class untuk dapetin value CGFloat (digunakan untuk kondisi onScroll)

class HomeViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
}

