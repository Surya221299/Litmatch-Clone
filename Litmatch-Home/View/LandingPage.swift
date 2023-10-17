//
//  LandingPage.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 13/09/23.
//

import SwiftUI

struct LandingPage: View {
    @State private var selectedTab: Tab = .Home
    
    private enum Tab: String {
        case Home, PartyChat, ForYou, Chat, Profile
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment.bottom) {
                TabView(selection: $selectedTab) {
                    Home()
                        .tabItem {
                            Text("")
                            Image(selectedTab == Tab.Home ? "tabbar_light_home_hover" :  "tabbar_light_home")
                                .renderingMode(.template)
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color("background_light_dark"), for: .tabBar)
                        .tag(Tab.Home)
                    
                    PartyChat()
                        .tabItem {
                            Text("")
                            Image(selectedTab == Tab.PartyChat ? "tabbar_light_party_hover" :  "tabbar_light_party")
                                .renderingMode(.template)
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color("background_light_dark"), for: .tabBar)
                        .tag(Tab.PartyChat)
                    
                    ForYou()
                        .tabItem {
                            Text("")
                            Image(selectedTab == Tab.ForYou ? "tabbar_light_feed_hover" :  "tabbar_light_feed")
                                .renderingMode(.template)
                            
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color("background_light_dark"), for: .tabBar)
                        .tag(Tab.ForYou)
                    
                    Chat()
                        .tabItem {
                            Text("")
                            Image(selectedTab == Tab.Chat ? "tabbar_light_chat_hover" :  "tabbar_light_chat")
                                .renderingMode(.template)
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color("background_light_dark"), for: .tabBar)
                        .tag(Tab.Chat)
                    
                    Profile()
                        .tabItem {
                            Text("")
                            Image("monster_avatar_6")
                        }
                        .toolbar(.visible, for: .tabBar)
                        .toolbarBackground(Color("background_light_dark"), for: .tabBar)
                        .tag(Tab.Profile)
                }
                .accentColor(Color("foreground_light_dark"))
                .navigationBarTitle(Text(""), displayMode: .inline)
                
                ZStack() {
                    Button(action: { self.selectedTab = Tab.Home } ) {
                        Spacer()
                        Image("float_status") // << align & highlight as needed
                            .resizable()
                            .frame(width: 95, height: 50)
                            .opacity(self.selectedTab == Tab.Home ? 1 : 0)
                    }
                    Button(action: { self.selectedTab = Tab.PartyChat } ) {
                        Spacer()
                        Image("float_party") // << align & highlight as needed
                            .resizable()
                            .frame(width: 58, height: 58)
                            .opacity(self.selectedTab == Tab.PartyChat ? 1 : 0)
                    }
                    Button(action: { self.selectedTab = Tab.ForYou } ) {
                        Spacer()
                        Image("float_post") // << align & highlight as needed
                            .resizable()
                            .frame(width: 72, height: 72)
                            .opacity(self.selectedTab == Tab.ForYou ? 1 : 0)
                    }
                    Button(action: { self.selectedTab = Tab.Profile } ) {
                        Spacer()
                        Image("float_post") // << align & highlight as needed
                            .resizable()
                            .frame(width: 72, height: 72)
                            .opacity(self.selectedTab == Tab.Profile ? 1 : 0)
                    }
                    
                }
                .padding(.trailing, 24)
                .offset(y: -60)
            }
        }
    }
}

struct LandingPage_Previews: PreviewProvider {
    static var previews: some View {
        LandingPage()
    }
}
