//
//  PartyChat.swift
//  Litmatch-Home
//
//  Created by Bamantara S on 12/09/23.
//

import SwiftUI

struct PartyChat: View {
    
    // var untuk active tab view
    
    @State var selectedTab = "For U"
    
    // var untuk slider animation
    
    @Namespace var animation
    
    // var untuk automatically carousel
    
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    
    // var untuk state awal image carousel start from index 0
    
    @State private var selection = 0
    
   
    let images = ["Carousel1","Carousel2","Carousel3","Carousel4","Carousel5", "Carousel6", "Carousel7", "Carousel8", "Carousel9", "Carousel10", "Carousel11"]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: UIScreen.main.bounds.size.height * 0.02) {
            
            // Fixed top Navigation
            
            HStack {
                Text("Party Chat")
                    .font(.system(size: 26))
                    .fontWeight(.bold)
                Spacer()
                Image("activity_center")
                    .resizable()
                    .frame(width: 32, height: 32)
                ZStack {
                    Image("lit_pass_top_right_icon")
                        .resizable()
                        .frame(width: 32, height: 32)
                    Circle()
                        .strokeBorder(.white, lineWidth: 0)
                        .background(Circle().fill(Color("red")))
                        .frame(width: 10, height:10)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                        .offset( x: 2, y: -8)
                }
                .frame(width: 32, height: 32)
                Image("ic_search")
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .foregroundColor(Color("foreground_light_dark"))
                
            }
            
            // ScrollAble Area
            
            ScrollView(.vertical, showsIndicators: false) {
                
                // Carousel Banner
                
                ZStack{
                    TabView(selection : $selection){
                        
                        ForEach(0..<11){ i in
                            Image("\(images[i])")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxWidth: .infinity)
                                .brightness( 0.15 )
                        }

                        
                    }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .onReceive(timer, perform: { _ in
                        withAnimation{
                            selection = selection < 11 ? selection + 1 : 0
                        }
                    })
                }
                .frame(height: 110)
                
                // 4 Badge view (Ranking, Family, Shop, Event)
                
                HStack {
                    
                    // Ranking
                    
                    VStack(spacing: 0) {
                        Image("family_rank_icon")
                            .resizable()
                            .frame(width: 42, height: 42)
                        Text("Ranking")
                    }
                    Spacer()
                    
                    // Family
                    
                    VStack(spacing: 0) {
                        Image("family_square_icon")
                            .resizable()
                            .frame(width: 42, height: 42)
                        Text("Family")
                    }
                    Spacer()
                    
                    // Shop
                    
                    VStack(spacing: 0) {
                        Image("party_list_shop_icon")
                            .resizable()
                            .frame(width: 42, height: 42)
                        Text("Shop")
                    }
                    Spacer()
                    
                    // Event
                    
                    
                    VStack(spacing: 0) {
                        Image("party_home_menu_events")
                            .resizable()
                            .frame(width: 42, height: 42)
                        Text("Events")
                    }
                }
                .padding(.horizontal, 12)
                .padding(.top, 12)
                
                // Sticky Horizontal view...
                
                LazyVStack(pinnedViews: [.sectionHeaders]) {
                    
                    // Horizontal link tab view
                    
                    Section {
                        GeometryReader{_ in
                            Group {
                                For_U()
                                    .opacity(selectedTab == "Following" ? 1 : 0)
                                For_U()
                                    .opacity(selectedTab == "For U" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Hot" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "New" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Teman" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Hiburan" ? 1 : 0)
                            }
                            Group {
                                For_U()
                                    .opacity(selectedTab == "Musik" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Sharing" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Kencan" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Games" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Ngobrol" ? 1 : 0)
                                
                                For_U()
                                    .opacity(selectedTab == "Recent" ? 1 : 0)
                            }
                        }
                        .frame(height: 920)
                    } header : {
                        
                        // Sticky Horizontal view...
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                ForEach(tabs,id: \.self){tab in
                                    TabButton(title: tab, selectedTab: $selectedTab,animation: animation)
                                    if tab != tabs.last{
                                        Spacer(minLength: 0)
                                    }
                                }
                                
                            }
                        }
                        .padding(.leading, -10)
                        .padding(.vertical, 6)
                        .background(Color("background_light_dark"))
                    }
                }
                
            }
        }
        .padding(.horizontal, 12)
        .background(Color("background_light_dark"))
    }
}

struct PartyChat_Previews: PreviewProvider {
    static var previews: some View {
        PartyChat()
    }
}

struct TabButton : View {
    
    var title : String
    @Binding var selectedTab : String
    var animation : Namespace.ID
    
    var body: some View{
        
        Button(action: {
            withAnimation{selectedTab = title}
            
        }) {
            VStack(spacing: 4){
                Text(title)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .padding(.horizontal, 10)
                    .foregroundColor(Color(selectedTab == title ? "primary" : "foreground_light_dark").opacity(selectedTab == title ? 1 : 0.2))
                ZStack{
                    CustomShape()
                        .fill(Color.clear)
                        .frame(width: 25, height: 3)
                    if selectedTab == title{
                        CustomShape()
                            .fill(Color("primary"))
                            .frame(width: 25, height: 3)
                            .matchedGeometryEffect(id: "Tab_Change", in: animation)
                            
                    }
                }
            }
        }
    }
}

// Custom Shape..

struct CustomShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 10, height: 10))
        
        return Path(path.cgPath)
    }
}

// Both Title Image Name Are Same....
var tabs = ["Following","For U","Hot","New", "Teman", "Hiburan", "Musik", "Sharing", "Kencan", "Games", "Ngobrol", "Recent"]
