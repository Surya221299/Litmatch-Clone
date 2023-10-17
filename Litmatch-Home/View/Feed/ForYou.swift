//
//  ForYou.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 12/09/23.
//

import SwiftUI

struct ForYou: View {

    @State var selected = 1
    
    var body: some View {
        // ga perlu NavigationView karna udah ada di Landing Page
        
            VStack() {
                TopBar(selected: $selected)
                    .padding(.horizontal, 12)
                GeometryReader {_ in
                    VStack {
                        if self.selected == 0 {
                            Feed_Following()
                        }
                        else if self.selected == 1 {
                            Feed_Recommendation()
                        }
                        else if self.selected == 2 {
                            Feed_JustNow()
                        }
                        else {
                            Text("Page Not Found!")
                        }
                    }
                }
            }
            
            .background(Color("background_light_dark"))
            .foregroundColor(Color("foreground_light_dark"))
    }
}

struct ForYou_Previews: PreviewProvider {
    static var previews: some View {
        ForYou()
    }
}

// list NavigationView on top view

struct TopBar : View {
    
    @Binding var selected: Int
    
    var body : some View {
        HStack(spacing: 22) {
            
            // First Link
            
            Button(action: {
                self.selected = 0
            }) {
                Text("Mengikuti").fontWeight(.semibold).foregroundColor(Color("foreground_light_dark").opacity(self.selected == 0 ? 1 : 0.5))
            }
            
            // Second Link
            
            Button(action: {
                self.selected = 1
            }) {
                Text("Rekomendasi").fontWeight(.semibold).foregroundColor(Color("foreground_light_dark").opacity(self.selected == 1 ? 1 : 0.5))
            }
            
            // Third Link
            
            Button(action: {
                self.selected = 2
            }) {
                Text("Baru Saja").fontWeight(.semibold).foregroundColor(Color("foreground_light_dark").opacity(self.selected == 2 ? 1 : 0.5))
            }
            
            // Fourth Link
            // Notification
            Spacer()
            NavigationLink(destination: Feed_Notification(), label: {
                Image("home_notify_icon")
                    .resizable()
                    .frame(width: 32, height: 32)
            })
            
        }
        .background(Color("background_light_dark"))
        .foregroundColor(Color("foreground_light_dark"))
    }
}
