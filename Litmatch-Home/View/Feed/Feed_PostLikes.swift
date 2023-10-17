//
//  Feed_PostLikes.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 05/10/23.
//

import SwiftUI

struct Feed_PostLikes: View {
    
    // var untuk tampilan bottom sheet likes
    
    @State private var showingBottomSheetLikes = false
    @State var detentHeight: CGFloat = 0
    
    var user: User
    
    var body: some View {
        
        VStack {
            Text("Suka dan reaksi (\(user.post[0].feedLikes.count))")
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding(.vertical, 16)
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 16) {
                    
                    ForEach(user.post[0].feedLikes.indices, id: \.self) { listLikes in
                        
                        HStack( spacing: 18) {
                            ZStack(alignment: .bottomTrailing) {
                                
                                // ini untuk avatar user
                                Image(user.post[0].feedLikes[listLikes].avatarLikes)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 42, height: 42)
                                
                                // ini conditional untuk emot di kanan atas avatar
                                
                                Image("be_liked_heart")
                                    .resizable()
                                    .frame(width: 15, height: 15)
                                
                            }
                            
                            VStack(alignment: .leading, spacing: 4) {
                                HStack( spacing: 8) {
                                    Text(user.post[0].feedLikes[listLikes].userLikes)
                                        .font(.system(size: 16))
                                        .fontWeight(.semibold)
                                    
                                    HStack(spacing: 3) {
                                        
                                        // conditional UI icon cowok apa cewek + background
                                        
                                        if (user.post[0].feedLikes[listLikes].genderLikes) == "male" {
                                            Image("boy_icon_checked")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 12, height: 12)
                                            Text("\(user.post[0].feedLikes[listLikes].ageLikes)")
                                                .font(.system(size: 12))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("boy_gender_color"))
                                        } else {
                                            Image("girl_icon_checked")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .frame(width: 12, height: 12)
                                            Text("\(user.post[0].feedLikes[listLikes].ageLikes)")
                                                .font(.system(size: 12))
                                                .fontWeight(.bold)
                                                .foregroundColor(Color("girl_gender_color"))
                                        }
                                        
                                    }
                                    
                                    .padding(.vertical, 2)
                                    .padding(.horizontal, 6)
                                    .background(Color((user.post[0].feedLikes[listLikes].genderLikes) == "male" ? "boy_gender_color" : "girl_gender_color").opacity(0.1))
                                    .cornerRadius(10)
                                }
                                Text(user.post[0].feedLikes[listLikes].userLikesStatus)
                                    .font(.system(size: 12))
                                    .opacity(0.5)
                                    .multilineTextAlignment(.leading)
                            }
                            Spacer()
                            Text("Ikuti")
                                .font(.system(size: 12))
                                .fontWeight(.semibold)
                                .padding(.vertical, 8)
                                .padding(.horizontal, 12)
                                .background(Color("primary").opacity(0.1))
                                .foregroundColor(Color("primary"))
                                .cornerRadius(15)
                            
                        }
                        .padding(.vertical, 4)
                    }
                }
                .padding(.horizontal, 12)
            }
        }
        .frame(height: UIScreen.main.bounds.size.height * 0.5)
    }
}

struct Feed_PostLikes_Previews: PreviewProvider {
    static var previews: some View {
        Feed_PostLikes(user: User.samplePerson)
    }
}
