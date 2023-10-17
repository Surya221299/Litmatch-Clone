//
//  For_U.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 19/09/23.
//

import SwiftUI

struct For_U: View {
    var body: some View {
        
        // List Party Chat
        
        // sementara memakai cara manual (copy-paste), kedepannya akan menggunakan ForEach JSON data...
        VStack(spacing: 12) {
            
            // Item Pertama
            
            HStack() {
                
                // Room master party
                
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("boy_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("17")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("girl_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
                }
                
                // Judul Party
                
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("New")
                        .font(.system(size: 11))
                        .foregroundColor(Color("green_background").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("green_background").opacity(0.12))
                        .clipShape(Capsule())
                }
                Spacer()
                
                // animasi di kanan atas
                
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("icon_red_envelop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_on_1_list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Kedua
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("girl_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("21")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("boy_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("Hiburan")
                        .font(.system(size: 11))
                        .foregroundColor(Color("foreground_light_dark").opacity(0.6))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Color("foreground_light_dark").opacity(0.05))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_list_item_fire_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Ketiga
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("girl_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("18")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("girl_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("New")
                        .font(.system(size: 11))
                        .foregroundColor(Color("green_background").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("green_background").opacity(0.12))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("icon_red_envelop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        Image("party_events_wait_icon")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_on_1_list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Keempat
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("girl_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("19")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("girl_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("Sharing")
                        .font(.system(size: 11))
                        .foregroundColor(Color("foreground_light_dark").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("foreground_light_dark").opacity(0.05))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_on_1_list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Kelima
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("boy_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("25")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("boy_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("Ngobrol")
                        .font(.system(size: 11))
                        .foregroundColor(Color("foreground_light_dark").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("foreground_light_dark").opacity(0.05))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("icon_red_envelop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_list_item_fire_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Keenam
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("girl_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("22")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("girl_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("Kencan")
                        .font(.system(size: 11))
                        .foregroundColor(Color("foreground_light_dark").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("foreground_light_dark").opacity(0.05))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("icon_red_envelop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_list_item_fire_icon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Ketujuh
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("boy_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("24")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("boy_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("Musik")
                        .font(.system(size: 11))
                        .foregroundColor(Color("foreground_light_dark").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("foreground_light_dark").opacity(0.05))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("icon_red_envelop")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_on_1_list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Kedelapan
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("boy_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("20")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("boy_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("Games")
                        .font(.system(size: 11))
                        .foregroundColor(Color("foreground_light_dark").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("foreground_light_dark").opacity(0.05))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_on_1_list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Kesembilan
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("boy_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("26")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("boy_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("New")
                        .font(.system(size: 12))
                        .foregroundColor(Color("green_background").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("green_background").opacity(0.12))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_on_1_list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
            
            // Item Kesepuluh
            
            HStack() {
                ZStack(alignment: .bottom) {
                    Image("monster_avatar_1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 64, height: 64)
                        .padding(.horizontal, 12)
                    HStack(spacing: 3) {
                        Image("girl_icon_checked")
                            .renderingMode(.template)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 10, height: 10)
                        Text("16")
                            .font(.system(size: 9))
                            .fontWeight(.bold)
                            
                    }
                    .foregroundColor(Color("background_light_dark"))
                    .padding(.vertical, 2)
                    .padding(.horizontal, 6)
                    .background(Color("girl_gender_color").opacity(1))
                    .cornerRadius(10)
                    .offset(y: 4)
    
                }
                VStack(alignment: .leading, spacing: 12) {
                    Text("English Party")
                        .font(.system(size: 16))
                        .fontWeight(.bold)
                    Text("New")
                        .font(.system(size: 12))
                        .foregroundColor(Color("green_background").opacity(0.6))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color("green_background").opacity(0.12))
                        .clipShape(Capsule())
                }
                Spacer()
                VStack(spacing: 16) {
                    HStack {
                        Spacer()
                        Image("bonfire-flame")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    HStack {
                        Image("")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                        // graphic animation
                        HStack(spacing: 0) {
                            Image("party_on_1_list")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                            Text("11")
                        }
                    }
                }
                .padding(.horizontal, 16)
                .fixedSize()
            }
            .padding(.vertical, 10)
            .background(Color("foreground_light_dark").opacity(0.01))
        }
    }
}

struct For_U_Previews: PreviewProvider {
    static var previews: some View {
        For_U()
    }
}
